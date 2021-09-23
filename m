From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] MAINTAINERS: Remove Matt Mackall as his identity is
 obsolete
Date: Thu, 23 Sep 2021 20:51:34 +0200
Message-ID: <20210923185134.vkokv3kglkjklkkf@pengutronix.de>
References: <20210920080635.253826-1-u.kleine-koenig@pengutronix.de>
 <CAMuHMdVAjtF2GKXgHgbmjUnMdWxqSpusKV_EieF2wEWezdqrPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7rnfxr5b22heuaq6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVAjtF2GKXgHgbmjUnMdWxqSpusKV_EieF2wEWezdqrPQ@mail.gmail.com>
List-ID: <linux-embedded.vger.kernel.org>
To: Olivia Mackall <olivia@selenic.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>


--7rnfxr5b22heuaq6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Sep 20, 2021 at 03:01:25PM +0200, Geert Uytterhoeven wrote:
> On Mon, Sep 20, 2021 at 11:52 AM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > The mails I sent to Matt on September 14 and 20 both were refused by the
> > MTA responsible for selenic.com (i.e. waste.org) with:
> >
> >         554 5.7.1 <mpm@selenic.com>: Recipient address rejected: This i=
dentity is obsolete
> >
> > Also the most recent commit that involved him (ignoring "Cc: Matt
> > Mackall <mpm@selenic.com>" footers) is commit 330e0a01d54c (MAINTAINERS:
> > Theodore Ts'o is taking over the random driver) where he was removed
> > from the entry for random number drivers in 2012.
> >
> > So drop him completely from the list of maintainers.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  MAINTAINERS | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d7b4f32875a9..805630c67a1f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6812,7 +6812,6 @@ F:        drivers/media/usb/em28xx/
> >
> >  EMBEDDED LINUX
> >  M:     Paul Gortmaker <paul.gortmaker@windriver.com>
> > -M:     Matt Mackall <mpm@selenic.com>
>=20
> Perhaps this should be replaced by
> "Olivia Mackall <olivia@selenic.com>" instead?

I think we need some feedback from Olivia here? At least I don't know
more than I wrote in the commit log and so I'm not in a position to
decide anything here.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7rnfxr5b22heuaq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFMzLMACgkQwfwUeK3K
7Ak2lAf+KpzyLszB2tlawn0Jr7OKP3tXXdSMb+HQPvRi6UMoYz7qM0PwaaSXmRWQ
qcbsWUYzZAa/wAldjrQ1vvNnn2AVn/nZ+nxc0zsC36TVPE/q54TxLzOlOhhaoyZS
zJ7UHyUQ3cv6Lpq7KJ9aM116CLieCa9rIkJHqweVfdZRw1vD8YpNOKfsE3cAXwLb
+8tnEYX4v9enVyiKysf5uYArrDV/ZjAF0fQDf66m/6fvGMpXhsvN5GAtGo2O1VhN
u+g48E8eP6YJjH5THkeororXKquoNRxZ6j48bfpy/Np4RkfGSlR+D1cVguuR/9o7
HDvT+ccdZ/ZQahwYy+q+BSj//DNQ6g==
=6qxm
-----END PGP SIGNATURE-----

--7rnfxr5b22heuaq6--
