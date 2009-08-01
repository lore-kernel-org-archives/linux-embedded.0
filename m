From: tom.leiming@gmail.com
Subject: [PATCH] USB:musb:fix dependency of selecting TWL4030_USB
Date: Sat,  1 Aug 2009 21:01:58 +0800
Message-ID: <1249131718-21388-1-git-send-email-tom.leiming@gmail.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=RXZdWZ4KkQGIaG10c8e5nQLirGlo8X73x/j0jYuv/80=;
        b=lrg/WN400698WSYXy6IZvL+pP5R+8IwFfuI5OA/2wu2oJVzuDjcOuNcLLHlGx/L2cK
         td/8bNPilcy1Xf44Xx6NPXstFCn9FFgEKe4WgTYFR5DnD/5G/LBH8sf1X0Kmr1GdnHR3
         81xLQskKC9/WG2XbMwIuQ7vppZp6s7eqMNYGU=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com, dbrownell@users.sourceforge.net
Cc: linux-usb@vger.kernel.org, linux-embedded@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>

From: Ming Lei <tom.leiming@gmail.com>

All machines based on OMAP34XX should select TWL_4030_USB if
they want to support musb.

Signed-off-by: Ming Lei <tom.leiming@gmail.com>
---
 drivers/usb/musb/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 70073b1..6ac465e 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -11,7 +11,7 @@ config USB_MUSB_HDRC
 	depends on (USB || USB_GADGET) && HAVE_CLK
 	depends on !SUPERH
 	select NOP_USB_XCEIV if ARCH_DAVINCI
-	select TWL4030_USB if MACH_OMAP_3430SDP
+	select TWL4030_USB if ARCH_OMAP34XX
 	select USB_OTG_UTILS
 	tristate 'Inventra Highspeed Dual Role Controller (TI, ADI, ...)'
 	help
-- 
1.6.0.GIT
