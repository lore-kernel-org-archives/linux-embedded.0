From: Greg KH <gregkh@suse.de>
Subject: Re: [PWM v9 1/3] PWM: Implement a generic PWM framework
Date: Thu, 14 Apr 2011 12:58:42 -0700
Message-ID: <20110414195842.GA18872@suse.de>
References: <1301630392-20793-1-git-send-email-bgat@billgatliff.com>
 <1301630392-20793-2-git-send-email-bgat@billgatliff.com>
 <BANLkTi=1Nh+EcZw_U6U8ZS2yVyqmCtuAcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTi=1Nh+EcZw_U6U8ZS2yVyqmCtuAcQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>, Kay Sievers <kay.sievers@vrfy.org>

On Thu, Apr 14, 2011 at 01:49:27PM -0600, Grant Likely wrote:
> > +static struct class pwm_class =3D {
> > + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pwm",
> > + =A0 =A0 =A0 .owner =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
> > + =A0 =A0 =A0 .dev_attrs =A0 =A0 =A0=3D pwm_dev_attrs,
> > +};
>=20
> >From my understanding, class is deprecated.  I believe you should be
> using bus_type directly now.  Check with Greg and Kay.

Yes, that is correct, please don't create new classes if at all
possible.  And this code looks like it is fine to use a bus_type.

thanks,

greg k-h
