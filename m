From: Greg KH <greg@kroah.com>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Mon, 19 Apr 2010 10:15:34 -0700
Message-ID: <20100419171534.GA30381@kroah.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
 <20100419162611.GA15131@nokia.com>
 <op.vbe5bfm47p4s8u@pikus>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <op.vbe5bfm47p4s8u@pikus>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?Q?Micha=C5=82?= Nazarewicz <m.nazarewicz@samsung.com>
Cc: felipe.balbi@nokia.com, ext Linus Walleij <linus.ml.walleij@gmail.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus@nokia.com>, "Quadros Roger (Nokia-D/Helsinki)" <roger.quadros@nokia.com>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta@nokia.com>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy@nokia.com>, David Brownell <david-b@pacbell.net>, linux-embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, "libmtp-discuss@lists.sourceforge.net" <libmtp-discuss@lists.sourceforge.net>

On Mon, Apr 19, 2010 at 06:55:53PM +0200, Micha=C5=82 Nazarewicz wrote:
> > On Mon, Apr 19, 2010 at 06:10:52PM +0200, ext Linus Walleij wrote:
> >> Further comments: there is apparently a driver floating around thi=
s list
> >> for supporting PTP through the gadgetfs. How does this work relate
> >> to that, and why can't you use gadgetfs?
>=20
> On Mon, 19 Apr 2010 18:26:11 +0200, Felipe Balbi <felipe.balbi@nokia.=
com> wrote:
> > dude, can't you read ? gadgetfs prevents us from combining into a
> > composite gadget. We went throught that already. Please follow the
> > thread before commenting.
>=20
> On related news, I've just posted FunctionFS driver. :) It's still im=
perfect
> but appears to be working.

Yes, that should solve the gadgetfs issue for you, right Felipe?

thanks,

greg k-h
