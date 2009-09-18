From: Ming Lei <tom.leiming@gmail.com>
Subject: [BUG]: v2.6.31: always output black in beagle DVI LCD
Date: Fri, 18 Sep 2009 23:52:25 +0800
Message-ID: <d82e647a0909180852u13dc1751pc1ae88413707706@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-omap-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=tVSJWF4jzpjYA+MiMj+/c8T6hRDOoy4BLaBpVfNtBKE=;
        b=kTvvSmlVXSbf9R3lmIt80iazgKpS/hswLGTkpx7IcUJIaqKGgv5grrbxMN8H8kmbA7
         IAk7g68RFgHOc7ChunuZ5UE0TB+G87pOSjllFm6L9ng9yA15NCPPESEz9Ckx/+LAeHYA
         XayiX+7uVkiAENJIbfW0jr40Vi2VWh3LEgUV4=
Sender: linux-omap-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-omap@vger.kernel.org, Linux-ARM Kernel <linux-arm-kernel@lists.arm.linux.org.uk>, linux-embedded@vger.kernel.org

Board: beagle B5
LCD: can show beagle logo in uboot

Once I upgrade to v2.6.31 from
         git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git

and apply the patch:
          omapfb: Reorder Register_framebuffer call
          http://marc.info/?l=linux-omap&m=125277326104621&w=2

the dvi lcd can't show anything but black colour. And from view of the monitor,
there is video signal outputed from beagle, which can be indicated the
green-led of
monitor.

Also the fb device(/dev/fb0) can be accessed well by my test code.

I can provide more information if anyone needs.

Thanks.

-- 
Lei Ming
