From: Matt Mackall <mpm@selenic.com>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Mon, 04 Aug 2008 13:54:01 -0500
Message-ID: <1217876041.3657.119.camel@calx>
References: <20080731092703.661994657@free-electrons.com>
	 <20080731093220.969460336@free-electrons.com>
	 <20080802163848.GB30454@fieldses.org> <20080804155237.1f64892d@surf>
	 <20080804181641.GE25940@fieldses.org> <48974973.6000408@am.sony.com>
	 <20080804182532.GF25940@fieldses.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080804182532.GF25940@fieldses.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Tim Bird <tim.bird@am.sony.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, matthew@wil.cx, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org


On Mon, 2008-08-04 at 14:25 -0400, J. Bruce Fields wrote:
> On Mon, Aug 04, 2008 at 11:24:51AM -0700, Tim Bird wrote:
> > J. Bruce Fields wrote:
> > > On Mon, Aug 04, 2008 at 03:52:37PM +0200, Thomas Petazzoni wrote:
> > >> Le Sat, 2 Aug 2008 12:38:48 -0400,
> > >> "J. Bruce Fields" <bfields@fieldses.org> a =C3=A9crit :
> > >>
> > >>> Out of curiosity, why does the nfs client need disabling, but n=
ot
> > >>> nfsd, gfs2, fuse, etc.?
> > >> Then also need disabling.
> > >=20
> > > OK by me, but again, why exactly?  Since you're replacing the loc=
king
> > > calls they used by stubs that just return errors, in theory nfs, =
nfsd,
> > > gfs2, and the rest should still compile and run, just without loc=
king
> > > support, right?
> >=20
> > I think so, but haven't tested this myself.
> >=20
> > However, I would still be inclined to NOT add the extra config
> > dependencies.  Just my 2 cents.
>=20
> OK.  My fear was that there was some good reason that the nfs depende=
ncy
> was added in the first place, and that it's since been lost....

I vaguely remember there was some compile issue here, but that would
have been back in the 2.6.10 era.

--=20
Mathematics is the supreme nostalgia of our time.
