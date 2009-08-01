From: tom.leiming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] USB:otg:twl4030-usb.c: mark .init as subsys_initcall_sync
Date: Sat,  1 Aug 2009 20:39:57 +0800
Message-ID: <1249130397-20971-1-git-send-email-tom.leiming@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=qutEtxV0ZFfGBQVpX0VRqD18a8sFI8TekcGZ4Yo1xEU=;
        b=itjSuCO+j0L34Le49vgNJLz2THZypVl3z2MAEG/XUMRcdzmK+9U0vmJh/73o7XEF3n
         vTn/BtTVYk+p7S1804VLaEMNhPPSdElENTkjXh9DGIfarTuqYOkRR77I7OVBMNdE5l+N
         7CnLUeOXpd1btRKsQxBPINC38tVfYJGmf/huY=
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org, dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ming Lei <tom.leiming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

From: Ming Lei <tom.leiming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch fixes the .probe failure of twl4030_usb driver if
it is compiled into kernel.

Since twl4030_usb USB transceiver .probe depends on
twl4030-regulator, marking twl4030_usb_init as subsys_initcall_sync
can make it called after twl4030-regulator initialization is finished,
then twl4030_usb USB transceiver driver can be probed successfully.

Signed-off-by: Ming Lei <tom.leiming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/otg/twl4030-usb.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/otg/twl4030-usb.c b/drivers/usb/otg/twl4030-usb.c
index 9e3e7a5..d1852d4 100644
--- a/drivers/usb/otg/twl4030-usb.c
+++ b/drivers/usb/otg/twl4030-usb.c
@@ -774,7 +774,7 @@ static int __init twl4030_usb_init(void)
 {
 	return platform_driver_register(&twl4030_usb_driver);
 }
-subsys_initcall(twl4030_usb_init);
+subsys_initcall_sync(twl4030_usb_init);
 
 static void __exit twl4030_usb_exit(void)
 {
-- 
1.6.0.GIT

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
