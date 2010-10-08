From: sugumar <sugumar@ti.com>
Subject: [PATCH 3/4] Modify the back light driver to support the new PWM framework
Date: Fri,  8 Oct 2010 18:47:43 +0530
Message-ID: <1286543863-32115-1-git-send-email-sugumar@ti.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: davinci-linux-open-source@linux.davincidsp.com, sugumar <sugumar@ti.com>

This patch makes necessary changes to the existing backlight
driver to work with the new PWM framework

Signed-off-by: sugumar <sugumar@ti.com>
---
 drivers/pwm/Kconfig              |    1 +
 drivers/video/backlight/pwm_bl.c |   28 +++++++++++++++-------------
 include/linux/pwm_backlight.h    |    3 ++-
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 6f32dd6..0c90d98 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -5,6 +5,7 @@
 menuconfig GENERIC_PWM
 	tristate "PWM Support"
 	depends on SYSFS
+	select HAVE_PWM
 	help
 	  This enables PWM support through the generic PWM API.
 	  If unsure, say N.
diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 5504435..591a2fd 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -17,12 +17,12 @@
 #include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/err.h>
-#include <linux/pwm.h>
+#include <linux/pwm/pwm.h>
 #include <linux/pwm_backlight.h>
 #include <linux/slab.h>
 
 struct pwm_bl_data {
-	struct pwm_device	*pwm;
+	struct pwm_channel	*pwm;
 	struct device		*dev;
 	unsigned int		period;
 	int			(*notify)(struct device *,
@@ -45,11 +45,13 @@ static int pwm_backlight_update_status(struct backlight_device *bl)
 		brightness = pb->notify(pb->dev, brightness);
 
 	if (brightness == 0) {
-		pwm_config(pb->pwm, 0, pb->period);
-		pwm_disable(pb->pwm);
+		pwm_set_period_ns(pb->pwm, pb->period);
+		pwm_set_duty_ns(pb->pwm, 0);
+		pwm_stop(pb->pwm);
 	} else {
-		pwm_config(pb->pwm, brightness * pb->period / max, pb->period);
-		pwm_enable(pb->pwm);
+		pwm_set_period_ns(pb->pwm, pb->period);
+		pwm_set_duty_ns(pb->pwm, brightness * pb->period / max);
+		pwm_start(pb->pwm);
 	}
 	return 0;
 }
@@ -94,7 +96,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	pb->notify = data->notify;
 	pb->dev = &pdev->dev;
 
-	pb->pwm = pwm_request(data->pwm_id, "backlight");
+	pb->pwm = pwm_request(data->pwm_id, data->ch, "backlight");
 	if (IS_ERR(pb->pwm)) {
 		dev_err(&pdev->dev, "unable to request PWM for backlight\n");
 		ret = PTR_ERR(pb->pwm);
@@ -119,7 +121,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	return 0;
 
 err_bl:
-	pwm_free(pb->pwm);
+	pwm_release(pb->pwm);
 err_pwm:
 	kfree(pb);
 err_alloc:
@@ -135,9 +137,9 @@ static int pwm_backlight_remove(struct platform_device *pdev)
 	struct pwm_bl_data *pb = dev_get_drvdata(&bl->dev);
 
 	backlight_device_unregister(bl);
-	pwm_config(pb->pwm, 0, pb->period);
-	pwm_disable(pb->pwm);
-	pwm_free(pb->pwm);
+	pwm_set_duty_ns(pb->pwm, 0);
+	pwm_stop(pb->pwm);
+	pwm_release(pb->pwm);
 	kfree(pb);
 	if (data->exit)
 		data->exit(&pdev->dev);
@@ -153,8 +155,8 @@ static int pwm_backlight_suspend(struct platform_device *pdev,
 
 	if (pb->notify)
 		pb->notify(pb->dev, 0);
-	pwm_config(pb->pwm, 0, pb->period);
-	pwm_disable(pb->pwm);
+	pwm_set_duty_ns(pb->pwm, 0);
+	pwm_stop(pb->pwm);
 	return 0;
 }
 
diff --git a/include/linux/pwm_backlight.h b/include/linux/pwm_backlight.h
index 01b3d75..eb325bb 100644
--- a/include/linux/pwm_backlight.h
+++ b/include/linux/pwm_backlight.h
@@ -5,7 +5,8 @@
 #define __LINUX_PWM_BACKLIGHT_H
 
 struct platform_pwm_backlight_data {
-	int pwm_id;
+	const char *pwm_id;
+	int ch;
 	unsigned int max_brightness;
 	unsigned int dft_brightness;
 	unsigned int pwm_period_ns;
-- 
1.5.6
