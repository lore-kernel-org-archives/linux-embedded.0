From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Fri, 13 Nov 2009 13:45:48 +0200
Message-ID: <1258112748.21596.1227.camel@localhost>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
	 <4AFC4D31.2000101@gmail.com>
	 <20091112215649.GA28349@dvomlehn-lnx2.corp.sa.net>
	 <20091113091031.3f6d4bba@marrow.netinsight.se>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20091113091031.3f6d4bba@marrow.netinsight.se>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Cc: David VomLehn <dvomlehn@cisco.com>, Marco Stornelli <marco.stornelli@gmail.com>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

On Fri, 2009-11-13 at 09:10 +0100, Simon Kagstrom wrote:
> On Thu, 12 Nov 2009 16:56:49 -0500
> David VomLehn <dvomlehn@cisco.com> wrote:
>=20
> > Good question. Some more detail on our application might help. In s=
ome
> > situations, we may have no disk and only enough flash for the bootl=
oader.
> > The kernel is downloaded over the network. When we get to user spac=
e, we
> > initialize a number of things dynamically. For example, we dynamica=
lly
> > compute some MAC address, and most of the IP addresses are obtained=
 with
> > DHCP. This are very useful to have for panic analysis.
> >=20
> > Since there is neither flash nor disk, user space has no place to s=
tore
> > this information, should the kernel panic. When we come back up, we=
 will get
> > different MAC and IP addresses. Storing them in memory is our only =
hope.
> >=20
> > Fortunately, there is a section of RAM that the bootloader promises=
 not
> > to overwrite. On a panic, we capture the messages written on the co=
nsole
> > and store them in the protected area. If the information from the
> > /proc file is written as part of the panic, we will capture it, too=
=2E
>=20
> Can't you solve this completely from userspace using phram and mtdoop=
s
> instead? I.e., setup two phram areas
>=20
> 	modprobe phram 4K@start-of-your-area,4K@start-of-your-area+4K    # C=
an't remember the exact syntax!
>=20
> you'll then get /dev/mtdX and /dev/mtdX+1 for these two. You can then=
 do
>=20
> 	modprobe mtdoops mtddev=3D/dev/mtdX+1 dump_oops=3D0
>=20
> to load mtdoops to catch the panic in the second area, and just write
> your userspace messages to /dev/mtdX.

This might work for them, not sure, but not for us. We store panics on
flash, and later they are automatically sent to the panic collection
system via the network. And the complications are:

1. There may be many panics before the device has network access and ha=
s
a chance to send the panics.
2. User can re-flash the device with different SW inbetween.

So we really need to print some user-space supplied information during
the panic, and then we store it on flash with mtdoops, and the later,
when the device has network access we send whole bunch of oopses via th=
e
network.

> One thing probably have to be fixed though: I don't think phram has a
> panic_write, which will be needed by mtdoops to catch the panic - thi=
s
> should be trivial to add though since it's plain RAM.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
