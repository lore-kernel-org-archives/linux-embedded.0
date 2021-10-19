From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Matt Mackall as his identity is
 obsolete
Date: Tue, 19 Oct 2021 12:47:04 +0300
Message-ID: <YW6UGP10hfGJ2kYy@pendragon.ideasonboard.com>
References: <20210920080635.253826-1-u.kleine-koenig@pengutronix.de>
 <CA+bK7J741D=DgZMNeEC5xg9kDDSaJu19QsRunVvXkBGx1mKGnQ@mail.gmail.com>
 <YW5r61ZQx+E9xfuH@pendragon.ideasonboard.com>
 <57122a67509bebdf0d1b9f5bc15db116e0124e5d.camel@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-crypto-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634636843;
        bh=9WpIKSjpHCw/alwPbMvvbFk/40a6krbHuMfWKlR1GB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SmesInog4R8l0uM1cVLwfoG/7ocuW2JwahC8DYBA7HH60IdBVEtNvkq/kuazDMg4L
         hS3w2xlaBDCwaOJi5dMyu70ZM3SIxH2EaSCOzuHB616tNKejlKDBNCUtpdrb9U7uxS
         BJK/rJwy+JRKA0xMMuYyH8n42vN8Q40VTViflhA4=
Content-Disposition: inline
In-Reply-To: <57122a67509bebdf0d1b9f5bc15db116e0124e5d.camel@infradead.org>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Tim Bird <tbird20d@gmail.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, kernel@pengutronix.de, Matt Porter <mporter@konsulko.com>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, thomas.petazzoni@bootlin.com, Tim Bird <tim.bird@sony.com>

On Tue, Oct 19, 2021 at 10:33:10AM +0100, David Woodhouse wrote:
> On Tue, 2021-10-19 at 09:55 +0300, Laurent Pinchart wrote:
> > Hi Tim,
> >=20
> > On Mon, Oct 18, 2021 at 03:17:22PM -0600, Tim Bird wrote:
> > > I think an overhaul of the "EMBEDDED LINUX" MAINTAINERS entry
> > > is long-overdue.
> > >=20
> > > No offense to any of the 3 persons listed, but I think the kernel dev=
eloper
> > > community would be better served by a group of individuals with a more
> > > current active role in embedded linux.  I have a few names I'll
> > > toss out for
> > > candidates: Matt Porter, Kevin Hilman, Thomas Gleixner,  Thomas
> > > Petazonni, Laurent Pinchart, and Uwe Kleine-K=C3=B6nig (and maybe even
> > > myself).
> > >=20
> > > This entry in the MAINTAINERS file is somewhat special, in that it
> > > covers a "field of endeavor" rather than a specific set of files or
> > > directories.
> > >=20
> > > Thoughts?
> >=20
> > Thank you for volunteering me :-)
> >=20
> > I was indeed wondering about this particular MAINTAINERS entry. As it
> > doesn't cover any particular set of files, directories, drivers,
> > subsystems or architectures, what does being listed here endeavour ?
>=20
> Basically nothing; I was going to suggest removing it entirely. There's
> certainly no point listing me there any more.
>=20
> Once upon a time it involved a certain amount of heckling about memory
> usage and "your hash table doesn't need to be that large" but that ship
> sailed a long time ago :)

Heckling is still an option without a MAINTAINERS entry I suppose :-)

I wouldn't object if we were to remove it.

--=20
Regards,

Laurent Pinchart
