From: Marc Pignat <marc.pignat@hevs.ch>
Subject: Re: [RFC 1/6] [PWM] Generic PWM API implementation
Date: Thu, 9 Oct 2008 10:17:24 +0200
Message-ID: <200810091017.25563.marc.pignat@hevs.ch>
References: <cover.1223482372.git.bgat@billgatliff.com> <4b5c3aa2b1bc2b7efad834da49c2dec8c0a8726b.1223482372.git.bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4b5c3aa2b1bc2b7efad834da49c2dec8c0a8726b.1223482372.git.bgat@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

Cleanup implementation for __pwm_create_sysfs.

Signed-off-by: Marc Pignat <marc.pignat@hevs.ch>
---

Hi all!

Here is a missing piece in the generic pwm implementation.

Bill, the code is simpler that you was thinking ;)

In facts, attributes are deleted by device_unregister -> there is nothing to
worry about attributes (un-)successful creation.

Finding which device was created is also trivial (thanks to class_find_device).

Best regards

Marc

diff --git a/drivers/pwm/pwm.c b/drivers/pwm/pwm.c
index 2f28c20..391f820 100644
--- a/drivers/pwm/pwm.c
+++ b/drivers/pwm/pwm.c
@@ -626,15 +626,23 @@ static int __pwm_create_sysfs(struct pwm_device *pwm)
 			goto err_dev_create;
 		ret = sysfs_create_group(&dev->kobj, &pwm_device_attr_group);
 		if (ret)
-			goto err_dev_group_create;
+			goto err_dev_create;
 	}
 
 	return ret;
 
-err_dev_group_create:
 err_dev_create:
-	/* TODO: undo all the successful device_create calls */
-	return -ENODEV;
+	for (wchan = 0; wchan < pwm->nchan; wchan++) {
+		dev = class_find_device(&pwm_class, NULL,
+					&pwm->channels[wchan],
+					__match_device);
+		if (dev) {
+			put_device(dev);
+			device_unregister(dev);
+		}
+	}
+
+	return ret;
 }
 
 
