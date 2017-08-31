From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 4/5] cramfs: add mmap support
Date: Thu, 31 Aug 2017 02:29:50 +0000
Message-ID: <SG2PR06MB1165F81B8D8CFEB21A3D0B288A9D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org>
 <20170816173536.1879-5-nicolas.pitre@linaro.org>
 <20170828064632.GA26136@ZenIV.linux.org.uk>
 <nycvar.YSQ.7.76.1708280914260.2606@knanqh.ubzr>
 <20170828142306.GJ5426@ZenIV.linux.org.uk>
 <nycvar.YSQ.7.76.1708281058590.2606@knanqh.ubzr>
 <SG2PR06MB1165FE414425AFD1C64E7CD78A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <nycvar.YSQ.7.76.1708291552240.2606@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=82rIsxPOfzJOY0vVAtGHl0YeWcxZSOjfdCRhwx+kHdI=;
 b=cRq1C1yXxwHvwQ4kzOmSmq1PNbPJcq854Xsai6/jAy+m6fz58ePojQcfRpIHhCkjaZ2O0im/Gia0aezR0lvLTlWFjSzc/sWw4OqE907XOQ1h6MpZIoUcuI9+T35h4Fj/jULfaxDUMz/MfObi1KviK2VlBo2NZ5eb5a0ivNTa5j8=
Content-Language: en-US
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tuesday, August 29, 2017, Chris Brandt wrote:
> On Tuesday, August 29, 2017, Nicolas Pitre wrote:
> > On Tue, 29 Aug 2017, Chris Brandt wrote:
> >
> > > On Monday, August 28, 2017, Nicolas Pitre wrote:
> > > > OK I moved the lock promotion right at the beginning _before_
> > validating
> > > > the split point. Also got a reference on the file to make sure that
> > > > hasn't changed too.
> > > >
> > > > > While we are at it, what happens if you mmap 120Kb, then munmap()
> > the
> > > > middle
> > > > > 40Kb.  Leaving two 40Kb VMAs with 40Kb gap between them, that is.
> > Will
> > > > your
> > > > > ->vm_private_data be correct for both?
> > > >
> > > > It wouldn't, but I now changed it to contain absolute values so now
> it
> > > > will. And if the split point lands in the hole then the code just
> > > > readjusts the pgoff at the beginning of the remaining part.
> > > >
> > > > Here's the revised patch:
> > >
> > >
> > > For whatever it's worth, as soon as I moved to 4.13-rc7,
> > > CONFIG_CRAMFS_PHYSMEM=3Dy crashes my XIP_KERNEL system before it can
> even
> > > get to any console output.
> > >
> > > (both the old patch and the new patch)
> > >
> > > If CONFIG_CRAMFS_PHYSMEM is not set, my XIP system boots fine.
> > >
> > > However, if I boot -rc7 as a uImage, the new patch works just as good
> as
> > > the old patch.
> >
> > When not a uImage, do you mean by that a XIP kernel?
>=20
> Yes, CONFIG_XIP_KERNEL.
>=20
> > If so you should
> > know by now from that other thread on LAK that the XIP linker script is
> > broken and probably just worked by luck till now. Still, if you could
> > bisect between -rc4 and -rc7 and pinpoint the change that makes it not
> > work that would be better than speculations.
>=20
> Note that everything else seem OK when CONFIG_XIP_KERNEL=3Dy. It's just
> when CONFIG_XIP_KERNEL=3Dy CONFIG_CRAMFS_PHYSMEM=3Dy which is odd. So
> hopefully
> that means it will be easy to track down.


Update:

My issue was caused by the XIP linker script (vmlinux-xip.lds.S).

Therefore, by applying the following patch series from the=20
linux-arm-kernel mailing list, my system could boot normally.

 [PATCH v2 0/5] make XIP kernel .data compressed in ROM
 [PATCH v2 1/5] ARM: head-common.S: speed up startup code
 [PATCH v2 2/5] ARM: vmlinux*.lds.S: some decruftification
 [PATCH v2 3/5] ARM: vmlinux.lds.S: replace open coded .data sections with =
generic macros
 [PATCH v2 4/5] ARM: vmlinux-xip.lds.S: fix multiple issues
 [PATCH v2 5/5] ARM: XIP kernel: store .data compressed in ROM


Now that I could boot again, this cramfs series of patches operates as=20
designed.

Notice that busybox, libc and ld have physical addresses in Flash (ie, XIP)

$ cat /proc/self/maps
00008000-000a1000 r-xp 1b005000 00:0c 18192      /bin/busybox
000a9000-000aa000 rw-p 00099000 00:0c 18192      /bin/busybox
000aa000-000ac000 rw-p 00000000 00:00 0          [heap]
b6eed000-b6fc6000 r-xp 1b0bc000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6fc6000-b6fce000 ---p 1b195000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6fce000-b6fd0000 r--p 000d9000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6fd0000-b6fd1000 rw-p 000db000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6fd1000-b6fd4000 rw-p 00000000 00:00 0
b6fd4000-b6feb000 r-xp 1b0a4000 00:0c 670372     /lib/ld-2.18-2013.10.so
b6fee000-b6fef000 rw-p 00000000 00:00 0
b6ff0000-b6ff2000 rw-p 00000000 00:00 0
b6ff2000-b6ff3000 r--p 00016000 00:0c 670372     /lib/ld-2.18-2013.10.so
b6ff3000-b6ff4000 rw-p 00017000 00:0c 670372     /lib/ld-2.18-2013.10.so
bee27000-bee48000 rw-p 00000000 00:00 0          [stack]
beea4000-beea5000 r-xp 00000000 00:00 0          [sigpage]
ffff0000-ffff1000 r-xp 00000000 00:00 0          [vectors]



Tested-by: Chris Brandt <chris.brandt@renesas.com>

