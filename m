From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: building Rootfs
Date: Tue, 8 Jul 2008 08:54:06 +0200
Message-ID: <20080708065406.GL4319@pengutronix.de>
References: <BAY131-W252EE4B85EEB3F7A87466FE2940@phx.gbl> <4871E98F.8030802@gmail.com> <20080707181018.GG4319@pengutronix.de> <63386a3d0807071334q2242ac45x540cee2a3fcb231b@mail.gmail.com> <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Haller, John H (John)" <jhaller@alcatel-lucent.com>
Cc: Linus Walleij <linus.ml.walleij@gmail.com>, linux-embedded@vger.kernel.org

On Mon, Jul 07, 2008 at 06:24:48PM -0500, Haller, John H (John) wrote:
> There are three issues in building an embedded cross-filesystem:
> 1. Identification of the files to put into the filesystem.
> 2. Stripping or extracting debug symbols from the filesystem.
> 3. Getting files into the filesystem when the development
> system does not allow root access.

Ack. In PTXdist, we also cover

4. what to put into the initial image on deployment (we had what you
   describe in 3 above but split that up into "what to build" vs. "what
   to install" in ptxdist-2.x).

5. how to push the image into the device (managing and writing
   complicated u-boot environments and pushing it into the device
   automatically, via serial+ethernet)

6. automatic test suites against embedded targets

> The first item is made a little easier by RPM, as it groups files
> together into packages, and package dependencies are quite often
> properly declared. However, packages sometimes have dependencies on
> another package when only part of the package may be required. Anothe=
r
> problem is with documentation files (usually unwanted on an embedded
> system), and locales which are huge and generally unwanted.

That was the reason why we went with ipkg; the meta data of rpm and deb
are too large to be hold on an embedded system, but we want software
updatability. However, if someone needs any sort of Carrier Grade
Blubberblabber, we could easily add rpm and/or deb :-)

> The second item can be tricky, as one doesn't want to strip debug
> symbols every time a filesystem is built, but the debug symbols are
> generally needed for cross debugging.

Yup; ptxdist solves this by having root/ and root-debug/, where the
first one can be booted via NFS or flash, and the second one contains
all the debug symbols. Cross debugging works that way, even with Eclips=
e
(for the people who deny seeing the pure elegance and shinyness of vim
and commandline gdb).

> The third item is easy for an initramfs, but not well handled by
> existing tools for an initrd (although I haven't looked recently). On=
e
> possibility is to modify a mkfs program, such as mke2fs, for the
> filesystem of choice to accept proto files, like the traditional Unix
> mkfs does. [Google mkfs proto for some examples]. I'm not sure if
> ptxdist supports both initramfs and initrd. If you do have root
> access, this is all much simpler, as an initrd can be locally mounted
> and populated.

I'm not sure as well; the parts for initramfs are there, but we don't
use it here at Pengutronix, because all of our current customer systems
have normal flash root filesystems; we once had a system with IXP425
that needed a userspace firmware for nfsroot, but that's the only case =
I
can remember.

However, if somebody needs improvement, he is free to send patches...

> One other item that pops up sometimes is post-install scripts
> that are associated with some packages. These scripts run in
> the target filesystem, and there is no good way to run them
> in the host environment.

This is already solved :-) We have pre/post scripts, this way:

rules/foobar.make
rules/foobar.preinst
rules/foobar.postinst
=2E..

In the scripts you can check if DESTDIR is set; if yes, you are in the
host environment (development system tries to build a root fs from the
ipkgs); if not, you are on the target (something does 'ipkg install').

With that mechanics, you can for example decide that on the target you
need to stop a service first, then update, then start it again.
Everything but update isn't required if only an image is being made.

> This doesn't happen too often, so it can usually be handled by hand a=
s
> an exception. One example of this type of item is installing the
> symbolic links in the right place for init scripts.

Yup, that can be done with the mechanics above.

> Using the tools from an embedded vendor has two problems -
> they can change from release to release,

We have a stable ptxdist-1.x series with long term bugfix maintenance
for that ... even this stable series is completely open source, for
everyone's download pleasure.

> and they are proprietary tools that lock you into the vendor.

No need to do so. Everything in ptxdist is GPL. If somebody wants to be
locked to Pengutronix, we feel better if he does so because he has the
warm and cuddly feeling that we solve his problems best ... which, by
the way, doesn't work too bad.

> But, they may provide a GUI, if you are into graphical presentations.

Well, if someone absolutely needs a GUI, he can use gvim=B9 :-)

rsc

=B9 Or even Eclipse & vmware, if your software department has a better
  feeling while using buzzword technology.
--=20
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
