From: "mohammed shareef" <mdshareef@gmail.com>
Subject: x11 fails with floating point exception
Date: Sun, 8 Jun 2008 15:37:00 +0530
Message-ID: <a1d91fa0806080307l64175a61i14cfb205081dd878@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=va5EisDpGaYf5aOLoefDH0ZnuGLKFJWUBPYlurreOJ0=;
        b=XzEL9PLXGUjC8WmzStZ8nL4NcQClJnDjhhZ+Dcg1mNwL4fmNIYoMIMRuWYMlFIBKSw
         0LvqRHX5f9B6OnnnldMVVGklokFWKcPenBsDQ/M5yWl4itSU9q7qX97He2pcrOeZbTAx
         /9rNVLQZpThQEkG3IIfWuxOhY2u8/V2UOhzAM=
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

i am new to linux.

when i compile x-windows, the xlib--X11 fails with a floating point exception.

../src/util/makekeys < /usr/include/X11/keysymdef.h > ks_tables_h
/bin/sh: line 1: 12048 Floating point exception../src/util/makekeys <
/usr/include/X11/keysymdef.h > ks_tables_h
make[1]: *** [ks_tables.h] Error 136
make[1]: Leaving directory `/root/omap5912/xwin_snapshot/xlibs/X11/src'
make: *** [install-recursive] Error 1

could someone please tell me how to solve this

thank you,
Shareef
