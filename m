From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: building Rootfs
Date: Wed, 9 Jul 2008 08:43:57 +0200
Message-ID: <20080709064357.GU4319@pengutronix.de>
References: <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com> <20080708140034.B2B7424681@gemini.denx.de> <63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Jul 09, 2008 at 01:53:46AM +0200, Linus Walleij wrote:
> 2008/7/8 Wolfgang Denk <wd@denx.de>:
> 
> >> 3. Getting files into the filesystem when the development
> >> system does not allow root access.
> 
> > 3. is a non-issue for most common file systems.
> 
> The only one thing I ever ran into trouble with was device nodes,
> these cannot be reproduced any way, not even with fakeroot
> environments, just in scratchbox, which in turn needs you to be root.

You can create an image with fakeroot which contains the device nodes,
then flash it into the device as a normal user and boot it there.

> initramfs etc can handle it with special description files. But if
> you want to cook up say a .tar file of your rootfs, you're pretty
> much lost AFAIK.

Right, but it's no real issue.

> The good thing is that you don't need the device nodes
> if you have udev, I think the kernel wants /dev/console
> and a few more at boot but actually it survives just fine
> without them.

Udev is pretty slow, so we have both possibilities in ptxdist. Users
have a choice if they want to be as "normal" as possible (udev) or if
they have faster requirements. For boot time optimized systems, we have
even done mixed systems, with static device nodes in the (quick) boot
phase and udev later on.

> If you know some way of sneaking a device node into a .tar file
> created ENTIRELY running as a regular user, tell me!

The question is: why do you need a tar file?

Hmm, I'm wondering if this discussion isn't off-topic here, as it is a
kernel mailing list. But I know no other list anyway, so if nobody
complains ...

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
