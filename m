From: Bill Gatliff <bgat@billgatliff.com>
Subject: [RFC 2/6] [PWM] Changes to existing include/linux/pwm.h to adapt to generic PWM API
Date: Wed,  8 Oct 2008 11:43:14 -0500
Message-ID: <88de40673cc33e014928c2ee3a86bdac566021c8.1223482372.git.bgat__46239.8759708323$1223486458$gmane$org@billgatliff.com>
References: <cover.1223482372.git.bgat@billgatliff.com>
 <4b5c3aa2b1bc2b7efad834da49c2dec8c0a8726b.1223482372.git.bgat@billgatliff.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4b5c3aa2b1bc2b7efad834da49c2dec8c0a8726b.1223482372.git.bgat@billgatliff.com>
In-Reply-To: <cover.1223482372.git.bgat@billgatliff.com>
References: <cover.1223482372.git.bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>


Signed-off-by: Bill Gatliff <bgat@billgatliff.com>
---
 include/linux/pwm.h |  168 ++++++++++++++++++++++++++++++++++++++++++++------
 1 files changed, 147 insertions(+), 21 deletions(-)

diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 3945f80..d3d18f7 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -1,31 +1,157 @@
 #ifndef __LINUX_PWM_H
 #define __LINUX_PWM_H
 
-struct pwm_device;
-
 /*
- * pwm_request - request a PWM device
+ * include/linux/pwm.h
+ *
+ * Copyright (C) 2008 Bill Gatliff
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
-struct pwm_device *pwm_request(int pwm_id, const char *label);
 
-/*
- * pwm_free - free a PWM device
- */
-void pwm_free(struct pwm_device *pwm);
+enum {
+	PWM_CONFIG_DUTY_TICKS = BIT(0),
+	PWM_CONFIG_PERIOD_TICKS = BIT(1),
+	PWM_CONFIG_POLARITY = BIT(2),
+	PWM_CONFIG_START = BIT(3),
+	PWM_CONFIG_STOP = BIT(4),
 
-/*
- * pwm_config - change a PWM device configuration
- */
-int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns);
+	PWM_CONFIG_HANDLER = BIT(5),
 
-/*
- * pwm_enable - start a PWM output toggling
- */
-int pwm_enable(struct pwm_device *pwm);
+	PWM_CONFIG_DUTY_NS = BIT(6),
+	PWM_CONFIG_DUTY_PERCENT = BIT(7),
+	PWM_CONFIG_PERIOD_NS = BIT(8),
+};
+
+struct pwm_channel;
+struct work_struct;
+
+typedef int (*pwm_handler_t)(struct pwm_channel *p, void *data);
+typedef void (*pwm_callback_t)(struct pwm_channel *p);
+
+struct pwm_channel_config {
+	int config_mask;
+	unsigned long duty_ticks;
+	unsigned long period_ticks;
+	int polarity;
+
+	pwm_handler_t handler;
+
+	unsigned long duty_ns;
+	unsigned long period_ns;
+	int duty_percent;
+};
+
+struct pwm_device {
+	struct list_head list;
+	spinlock_t list_lock;
+	struct device *dev;
+	struct module *owner;
+	struct pwm_channel *channels;
+
+	const char *bus_id;
+	int nchan;
+
+	int	(*request)	(struct pwm_channel *p);
+	void	(*free)		(struct pwm_channel *p);
+	int	(*config)	(struct pwm_channel *p,
+				 struct pwm_channel_config *c);
+	int	(*config_nosleep)(struct pwm_channel *p,
+				  struct pwm_channel_config *c);
+	int	(*synchronize)	(struct pwm_channel *p,
+				 struct pwm_channel *to_p);
+	int	(*unsynchronize)(struct pwm_channel *p,
+				 struct pwm_channel *from_p);
+	int	(*set_callback)	(struct pwm_channel *p,
+				 pwm_callback_t callback);
+};
+
+int pwm_register(struct pwm_device *pwm);
+int pwm_unregister(struct pwm_device *pwm);
+
+enum {
+	FLAG_REQUESTED = 0,
+	FLAG_STOP = 1,
+};
+
+struct pwm_channel {
+	struct list_head list;
+	struct pwm_device *pwm;
+	const char *requester;
+	int chan;
+	unsigned long flags;
+	unsigned long tick_hz;
+
+	spinlock_t lock;
+	struct completion complete;
+
+	pwm_callback_t callback;
+
+	struct work_struct handler_work;
+	pwm_handler_t handler;
+	void *handler_data;
+
+	int active_low;
+	unsigned long period_ticks;
+	unsigned long duty_ticks;
+};
+
+struct pwm_channel *
+pwm_request(const char *bus_id, int chan,
+	    const char *requester);
+
+void pwm_free(struct pwm_channel *pwm);
+
+int pwm_config_nosleep(struct pwm_channel *pwm,
+		       struct pwm_channel_config *c);
+
+int pwm_config(struct pwm_channel *pwm,
+	       struct pwm_channel_config *c);
+
+unsigned long pwm_ns_to_ticks(struct pwm_channel *pwm,
+			      unsigned long nsecs);
+
+unsigned long pwm_ticks_to_ns(struct pwm_channel *pwm,
+			      unsigned long ticks);
+
+int pwm_period_ns(struct pwm_channel *pwm,
+		  unsigned long period_ns);
+
+int pwm_duty_ns(struct pwm_channel *pwm,
+		unsigned long duty_ns);
+
+int pwm_duty_percent(struct pwm_channel *pwm,
+		     int percent);
+
+int pwm_polarity(struct pwm_channel *pwm,
+		 int active_high);
+
+int pwm_start(struct pwm_channel *pwm);
+
+int pwm_stop(struct pwm_channel *pwm);
+
+int pwm_set_handler(struct pwm_channel *pwm,
+		    pwm_handler_t handler,
+		    void *data);
+
+int pwm_synchronize(struct pwm_channel *p,
+		    struct pwm_channel *to_p);
+
+
+int pwm_unsynchronize(struct pwm_channel *p,
+		      struct pwm_channel *from_p);
 
-/*
- * pwm_disable - stop a PWM output toggling
- */
-void pwm_disable(struct pwm_device *pwm);
 
-#endif /* __ASM_ARCH_PWM_H */
+#endif /* __LINUX_PWM_H */
-- 
1.5.6.5
