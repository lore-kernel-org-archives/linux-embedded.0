From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM PATCH 7/7] PWM API driver for MPC52xx GPT peripheral
Date: Tue,  9 Feb 2010 14:46:34 -0600
Message-ID: <c6c7ccbedbade4c8e4695f914d065d40b646587e.1265748264.git.bgat@billgatliff.com>
References: <cover.1265748263.git.bgat@billgatliff.com>
 <b7afd475c3fce08f459bceff7814de57ffce7bd0.1265748264.git.bgat@billgatliff.com>
 <7178097a5a8af15f61656f11b6bef68b0da71498.1265748264.git.bgat@billgatliff.com>
 <6ba8043e7749806f88b685ecd5ad7c4e1062bc91.1265748264.git.bgat@billgatliff.com>
 <0b1e9d2f93d366f003348f4d31fdfbf8da4594b2.1265748264.git.bgat@billgatliff.com>
 <e5f3ecb7c7220a75184525a71ca668f91e5667c7.1265748264.git.bgat@billgatliff.com>
 <1b70ab4f8fdfc90eea12d6570be347f990abc8a9.1265748264.git.bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1b70ab4f8fdfc90eea12d6570be347f990abc8a9.1265748264.git.bgat@billgatliff.com>
In-Reply-To: <cover.1265748263.git.bgat@billgatliff.com>
References: <cover.1265748263.git.bgat@billgatliff.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: linux-embedded@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bill Gatliff <bgat@billgatliff.com>


Signed-off-by: Bill Gatliff <bgat@billgatliff.com>
---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c |  195 +++++++++++++++++++++=
+++++++-
 1 files changed, 193 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/p=
latforms/52xx/mpc52xx_gpt.c
index 6f8ebe1..b9aa4a5 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -1,6 +1,7 @@
 /*
  * MPC5200 General Purpose Timer device driver
  *
+ * Copyright (c) 2010 Bill Gatliff <bgat@billgatliff.com>
  * Copyright (c) 2009 Secret Lab Technologies Ltd.
  * Copyright (c) 2008 Sascha Hauer <s.hauer@pengutronix.de>, Pengutron=
ix
  *
@@ -50,6 +51,12 @@
  * IO, or it can be an Open Collector (OC) output.  At the moment it i=
s the
  * responsibility of either the bootloader or the platform setup code =
to set
  * the output mode.  This driver does not change the output mode setti=
ng.
+ *
+ * To use the PWM function, the following property must be added to
+ * the device tree node for the gpt device:
+ *     pwm-controller;
+ * TODO: we could set polarity, initial period and duty cycle, on/off,
+ * and whatnot inside the dts file...
  */
=20
 #include <linux/device.h>
@@ -65,11 +72,12 @@
 #include <linux/watchdog.h>
 #include <linux/miscdevice.h>
 #include <linux/uaccess.h>
+#include <linux/pwm/pwm.h>
 #include <asm/div64.h>
 #include <asm/mpc52xx.h>
=20
 MODULE_DESCRIPTION("Freescale MPC52xx gpt driver");
-MODULE_AUTHOR("Sascha Hauer, Grant Likely, Albrecht Dre=C3=9F");
+MODULE_AUTHOR("Sascha Hauer, Grant Likely, Albrecht Dre=C3=9F, Bill Ga=
tliff");
 MODULE_LICENSE("GPL");
=20
 /**
@@ -95,6 +103,9 @@ struct mpc52xx_gpt_priv {
 #if defined(CONFIG_GPIOLIB)
 	struct of_gpio_chip of_gc;
 #endif
+#if defined(CONFIG_GENERIC_PWM)
+	struct pwm_device pwm;
+#endif
 };
=20
 LIST_HEAD(mpc52xx_gpt_list);
@@ -125,6 +136,10 @@ DEFINE_MUTEX(mpc52xx_gpt_list_mutex);
=20
 #define MPC52xx_GPT_STATUS_IRQMASK	(0x000f)
=20
+#define MPC52xx_GPT_PWM_WIDTH_MASK	(0xffff0000)
+#define MPC52xx_GPT_PWM_PWMOP		(0x100)
+#define MPC52xx_GPT_PWM_LOAD		(0x1)
+
 #define MPC52xx_GPT_CAN_WDT		(1 << 0)
 #define MPC52xx_GPT_IS_WDT		(1 << 1)
=20
@@ -274,6 +289,182 @@ mpc52xx_gpt_irq_setup(struct mpc52xx_gpt_priv *gp=
t, struct device_node *node)
=20
=20
 /* -------------------------------------------------------------------=
--
+ * PWM API hooks
+ */
+#if defined(CONFIG_GENERIC_PWM)
+static inline struct mpc52xx_gpt_priv *pwm_to_mpc52xx_gpt(const struct=
 pwm_channel *p)
+{
+	return container_of(p->pwm, struct mpc52xx_gpt_priv, pwm);
+}
+
+static int mpc52xx_gpt_pwm_request(struct pwm_channel *p)
+{
+	struct mpc52xx_gpt_priv *gpt =3D pwm_to_mpc52xx_gpt(p);
+
+	/* TODO: add hooks to prevent conflicts in use */
+	p->tick_hz =3D gpt->ipb_freq;
+	return 0;
+}
+
+static void mpc52xx_gpt_pwm_free(struct pwm_channel *p)
+{
+	/* TODO: add hooks to prevent conflicts in use */
+}
+
+static int __mpc52xx_gpt_pwm_config_period_ticks(struct pwm_channel *p=
,
+					       struct pwm_channel_config *c)
+{
+	struct mpc52xx_gpt_priv *gpt =3D pwm_to_mpc52xx_gpt(p);
+	u64 prescale, count;
+
+	prescale =3D (c->period_ticks >> 16) + 1;
+	count =3D c->period_ticks;
+	do_div(count, prescale);
+	out_be32(&gpt->regs->count, prescale << 16 | count);
+
+	p->period_ticks =3D count * prescale;
+	dev_dbg(p->pwm->dev, "prescale %4x count %4x period_ticks %8x\n",
+		(unsigned int)prescale, (unsigned int)count,
+		(unsigned int)p->period_ticks);
+
+	return 0;
+}
+
+static int __mpc52xx_gpt_pwm_config_duty_ticks(struct pwm_channel *p,
+					       struct pwm_channel_config *c)
+{
+	struct mpc52xx_gpt_priv *gpt =3D pwm_to_mpc52xx_gpt(p);
+	unsigned long flags;
+	u64 width =3D c->duty_ticks;
+	u32 prescale, count;
+
+	spin_lock_irqsave(&gpt->lock, flags);
+
+	count =3D in_be32(&gpt->regs->count);
+	prescale =3D count >> 16;
+	count &=3D 0xffffUL;
+
+	/* TODO: this probably isn't the best place to do a divide... */
+	do_div(width, prescale);
+
+	clrsetbits_be32(&gpt->regs->pwm, MPC52xx_GPT_PWM_WIDTH_MASK,
+			MPC52xx_GPT_PWM_WIDTH_MASK & (width << 16));
+	spin_unlock_irqrestore(&gpt->lock, flags);
+
+	p->duty_ticks =3D width * prescale;
+	dev_dbg(p->pwm->dev, "prescale %4x count %4x width %4x duty_ticks %8x=
\n",
+		(unsigned int)prescale, (unsigned int)count,
+		(unsigned int)width, (unsigned int)p->duty_ticks);
+
+	return 0;
+}
+
+static int __mpc52xx_gpt_pwm_config_polarity(struct pwm_channel *p,
+					     struct pwm_channel_config *c)
+{
+	struct mpc52xx_gpt_priv *gpt =3D pwm_to_mpc52xx_gpt(p);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpt->lock, flags);
+	if (c->polarity)
+		setbits32(&gpt->regs->pwm, MPC52xx_GPT_PWM_PWMOP);
+	else
+		clrbits32(&gpt->regs->pwm, MPC52xx_GPT_PWM_PWMOP);
+	spin_unlock_irqrestore(&gpt->lock, flags);
+	return 0;
+}
+
+static int __mpc52xx_gpt_pwm_start(struct pwm_channel *p)
+{
+	struct mpc52xx_gpt_priv *gpt =3D pwm_to_mpc52xx_gpt(p);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpt->lock, flags);
+	clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_MS_MASK,
+		     MPC52xx_GPT_MODE_MS_PWM);
+	spin_unlock_irqrestore(&gpt->lock, flags);
+	return 0;
+}
+
+static int __mpc52xx_gpt_pwm_stop(struct pwm_channel *p)
+{
+	struct mpc52xx_gpt_priv *gpt =3D pwm_to_mpc52xx_gpt(p);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpt->lock, flags);
+	clrbits32(&gpt->regs->mode, MPC52xx_GPT_MODE_MS_MASK);
+	spin_unlock_irqrestore(&gpt->lock, flags);
+	return 0;
+}
+
+static int mpc52xx_gpt_pwm_config_nosleep(struct pwm_channel *p,
+					  struct pwm_channel_config *c)
+{
+	int ret =3D -EINVAL;
+
+	if (c->config_mask & PWM_CONFIG_PERIOD_TICKS)
+		if ((ret =3D __mpc52xx_gpt_pwm_config_period_ticks(p, c)))
+			goto done;
+
+	if (c->config_mask & PWM_CONFIG_DUTY_TICKS)
+		if ((ret =3D __mpc52xx_gpt_pwm_config_duty_ticks(p, c)))
+			goto done;
+
+	if (c->config_mask & PWM_CONFIG_POLARITY)
+		if ((ret =3D __mpc52xx_gpt_pwm_config_polarity(p, c)))
+			goto done;
+
+	if (c->config_mask & PWM_CONFIG_START)
+		if ((ret =3D __mpc52xx_gpt_pwm_start(p)))
+			goto done;
+
+	if (c->config_mask & PWM_CONFIG_STOP)
+		if ((ret =3D __mpc52xx_gpt_pwm_stop(p)))
+			goto done;
+
+done:
+	return ret;
+}
+
+static int mpc52xx_gpt_pwm_config(struct pwm_channel *p,
+				  struct pwm_channel_config *c)
+{
+	dev_dbg(p->pwm->dev, "config_mask %x\n", c->config_mask);
+
+	if (!mpc52xx_gpt_pwm_config_nosleep(p, c))
+		return 0;
+
+	might_sleep();
+
+	/* TODO: add other API entry points */
+
+	return -EINVAL;
+}
+
+static void
+mpc52xx_gpt_pwm_setup(struct mpc52xx_gpt_priv *gpt, struct device_node=
 *node)
+{
+	if (!of_find_property(node, "pwm-controller", NULL))
+		return;
+
+	gpt->pwm.dev =3D gpt->dev;
+	gpt->pwm.bus_id =3D dev_name(gpt->dev);
+	gpt->pwm.nchan =3D 1;
+	gpt->pwm.owner =3D THIS_MODULE;
+
+	gpt->pwm.request =3D mpc52xx_gpt_pwm_request;
+	gpt->pwm.free =3D mpc52xx_gpt_pwm_free;
+	gpt->pwm.config_nosleep =3D mpc52xx_gpt_pwm_config_nosleep;
+	gpt->pwm.config =3D mpc52xx_gpt_pwm_config;
+
+	pwm_register(&gpt->pwm);
+}
+#else
+static void
+mpc52xx_gpt_pwm_setup(struct mpc52xx_gpt_priv *p, struct device_node *=
np) {}
+#endif
+
+/* -------------------------------------------------------------------=
--
  * GPIOLIB hooks
  */
 #if defined(CONFIG_GPIOLIB)
@@ -737,9 +928,9 @@ static int __devinit mpc52xx_gpt_probe(struct of_de=
vice *ofdev,
 	}
=20
 	dev_set_drvdata(&ofdev->dev, gpt);
-
 	mpc52xx_gpt_gpio_setup(gpt, ofdev->node);
 	mpc52xx_gpt_irq_setup(gpt, ofdev->node);
+	mpc52xx_gpt_pwm_setup(gpt, ofdev->node);
=20
 	mutex_lock(&mpc52xx_gpt_list_mutex);
 	list_add(&gpt->list, &mpc52xx_gpt_list);
--=20
1.6.5
