From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Thu, 31 Jul 2008 17:57:11 +0100
Message-ID: <1217523431.3454.283.camel@pmac.infradead.org>
References: <20080731092703.661994657@free-electrons.com>
	 <20080731093220.969460336@free-electrons.com>
	 <20080731135319.GA20212@cs181140183.pp.htv.fi>
	 <20080731162007.285938e0@surf>
	 <20080731153757.GB20212@cs181140183.pp.htv.fi>
	 <20080731182616.4c20f0db@surf>
	 <20080731164918.GE20212@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080731164918.GE20212@cs181140183.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Adrian Bunk <bunk@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, matthew@wil.cx, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org

On Thu, 2008-07-31 at 19:49 +0300, Adrian Bunk wrote:
> On Thu, Jul 31, 2008 at 06:26:16PM +0200, Thomas Petazzoni wrote:
> > Le Thu, 31 Jul 2008 18:37:57 +0300,
> > Adrian Bunk <bunk@kernel.org> a =C3=A9crit :
> >=20
> > > I'm just not a fan of adding config options for each few kB of co=
de -=20
> > > we have to maintain them and the more complex the configuration
> > > becomes the more often it breaks.
> >=20
> > I'm not a fan of these too, but are there other solutions ?
>=20
> There are many things that can be done to reduce the kernel size or t=
ry=20
> to minimize the growth of the kernel.
>=20
> E.g. working on --combine -fwhole-program (where David once had=20
> preliminary patches for the per-module approach) might be better.

Yeah, I'm planning to dig that out again and play with it some time
soon. The Kbuild issues were too scary at the time, but I'm less
frightened of it these days...

Segher has also been looking at it, and reported quite a useful win whe=
n
he used it to combine arch/$ARCH/mm and mm/, and arch/$ARCH/kernel and
kernel/.

--=20
David Woodhouse                            Open Source Technology Centr=
e
David.Woodhouse@intel.com                              Intel Corporatio=
n


