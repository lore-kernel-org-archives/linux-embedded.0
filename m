From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 4/5] cramfs: add mmap support
Date: Tue, 29 Aug 2017 20:11:22 +0000
Message-ID: <SG2PR06MB1165928D73A113D94DA864EF8A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
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
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=phtdYFmJDy4ZhN8ALbmIXKNh4Fn2MNpTf4K019H5u/k=;
 b=gvyoDGo6fiuOroTOQxFZM71VNia841uidTdbci3kphNqUFPb3IaVCUCkooDIlB1J5BnqYUuZIvsMhimUxcNjI0IcmK+N6dWC6tlVZyXKaw3AlA8BueA53iPrfSRWb5Z60qw1sjyHSdsJUcivmoha9GosGclssCvQdEEHzA19Wco=
In-Reply-To: <nycvar.YSQ.7.76.1708291552240.2606@knanqh.ubzr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tuesday, August 29, 2017, Nicolas Pitre wrote:
> On Tue, 29 Aug 2017, Chris Brandt wrote:
>=20
> > On Monday, August 28, 2017, Nicolas Pitre wrote:
> > > OK I moved the lock promotion right at the beginning _before_
> validating
> > > the split point. Also got a reference on the file to make sure that
> > > hasn't changed too.
> > >
> > > > While we are at it, what happens if you mmap 120Kb, then munmap()
> the
> > > middle
> > > > 40Kb.  Leaving two 40Kb VMAs with 40Kb gap between them, that is.
> Will
> > > your
> > > > ->vm_private_data be correct for both?
> > >
> > > It wouldn't, but I now changed it to contain absolute values so now i=
t
> > > will. And if the split point lands in the hole then the code just
> > > readjusts the pgoff at the beginning of the remaining part.
> > >
> > > Here's the revised patch:
> >
> >
> > For whatever it's worth, as soon as I moved to 4.13-rc7,
> > CONFIG_CRAMFS_PHYSMEM=3Dy crashes my XIP_KERNEL system before it can ev=
en
> > get to any console output.
> >
> > (both the old patch and the new patch)
> >
> > If CONFIG_CRAMFS_PHYSMEM is not set, my XIP system boots fine.
> >
> > However, if I boot -rc7 as a uImage, the new patch works just as good a=
s
> > the old patch.
>=20
> When not a uImage, do you mean by that a XIP kernel?

Yes, CONFIG_XIP_KERNEL.

> If so you should
> know by now from that other thread on LAK that the XIP linker script is
> broken and probably just worked by luck till now. Still, if you could
> bisect between -rc4 and -rc7 and pinpoint the change that makes it not
> work that would be better than speculations.

Note that everything else seem OK when CONFIG_XIP_KERNEL=3Dy. It's just=20
when CONFIG_XIP_KERNEL=3Dy CONFIG_CRAMFS_PHYSMEM=3Dy which is odd. So hopef=
ully
that means it will be easy to track down.


Chris

