From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM 09/10] Build pwm.o only if CONFIG_GENERIC_PWM is set
Date: Fri,  1 Oct 2010 10:17:50 -0500
Message-ID: <1285946271-17728-9-git-send-email-bgat@billgatliff.com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org, linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>

Signed-off-by: Bill Gatliff <bgat@billgatliff.com>
---
 drivers/pwm/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index e8cacc5..5f29752 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -1,6 +1,6 @@
 #
 # Makefile for pwm devices
 #
-obj-y := pwm.o
+obj-$(CONFIG_GENERIC_PWM)	+= pwm.o
 obj-$(CONFIG_ATMEL_PWM)		+= atmel-pwm.o
 obj-$(CONFIG_GPIO_PWM)		+= gpio.o
-- 
1.7.1
