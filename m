From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: building Rootfs
Date: Wed, 9 Jul 2008 09:10:48 +0200
Message-ID: <20080709071048.GW4319@pengutronix.de>
References: <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com> <20080708140034.B2B7424681@gemini.denx.de> <63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com> <48740BD2.6090000@cisco.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48740BD2.6090000@cisco.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David VomLehn <dvomlehn@cisco.com>
Cc: Linus Walleij <linus.ml.walleij@gmail.com>, linux-embedded@vger.kernel.org

On Tue, Jul 08, 2008 at 05:52:34PM -0700, David VomLehn wrote:
> We do this all the time. We have a very minimal root filesystem and 
> aren't currently using any of the frameworks for building root 
> filesystems, so everything is done with make. In general, we create tar 
> files for each piece. The piece that has device nodes has a make file 
> with something like:
>
> 	all:
> 		fakeroot make fakeroot-package
>
> 	fakeroot-package:
> 		mkdir -p image
> 		mknod image/dev/null c 1 3
> 		mknod image/dev/random c 1 8
> 		tar -C image -czf image.tgz .

That does work fine when packaging the rootfs on the host. It was the
reason why we went the ipkg way: you can put device nodes into them.

> We ran into some issues when we separated running mknod and tar into 
> separate fakeroot invocations because there is a bug in fakeroot with 
> exporting and importing its state. Fortunately, doing all of this under a 
> single fakeroot command works just fine. When we untar the tar files for 
> all of the pieces to create a root filesystem image and then run mkcramfs 
> to create a CRAMFS image, we do all commands under a single invocation of 
> fakeroot.
>
> No stage of the build requires running as root.

The only stage we need root privileges in PTXdist is when creating a
root filesystem which can be booted via nfsroot (which is common during
development). In that case, you *need* /dev/console and /dev/null, which
cannot be created by the user.

We have solved that by using sudo there: the automatic build asks for
the user password, but with a timeout. So in interactive builds, you can
just enter the password and have a rootfs ready to be booted, and it
still works with automatic overnight builds.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
