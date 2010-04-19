From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Mon, 19 Apr 2010 20:57:18 +0200
Message-ID: <op.vbfaxsld7p4s8u@pikus>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
 <20100419162611.GA15131@nokia.com> <op.vbe5bfm47p4s8u@pikus>
 <20100419171534.GA30381@kroah.com> <20100419172404.GA15340@nokia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <20100419172404.GA15340@nokia.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: felipe.balbi@nokia.com, ext Greg KH <greg@kroah.com>
Cc: ext Linus Walleij <linus.ml.walleij@gmail.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus@nokia.com>, "Quadros Roger (Nokia-D/Helsinki)" <roger.quadros@nokia.com>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta@nokia.com>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy@nokia.com>, David Brownell <david-b@pacbell.net>, linux-embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, "libmtp-discuss@lists.sourceforge.net" <libmtp-discuss@lists.sourceforge.net>, =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <mina86@mina86.com>

>> On Mon, Apr 19, 2010 at 06:55:53PM +0200, Micha=C5=82 Nazarewicz wro=
te:
>>> On related news, I've just posted FunctionFS driver. :) It's still =
imperfect
>>> but appears to be working.

> On Mon, Apr 19, 2010 at 07:15:34PM +0200, ext Greg KH wrote:
>> Yes, that should solve the gadgetfs issue for you, right Felipe?

On Mon, 19 Apr 2010 19:24:04 +0200, Felipe Balbi <felipe.balbi@nokia.co=
m> wrote:
> sure it should. Will take a look at it :-)

As I've said it's still imperfect.  In particular the throughput won't =
be
impressive but that's on the TODO list (I first want to put a real driv=
er
on top of FunctionFS before optimising the code) and in particular u_ch=
ar
seem to be a good piece to steal code from. ;)  Still, as said, I haven=
't
analysed possible optimisations just yet.

All in all, I believe FunctionFS can work for you as you will handle da=
ta
transfers in user space anyway.  At the same time FunctionFS solves eve=
ns
end setup requests communication (I'm still wondering whether it would =
be
better to use separate file for events and for setup requests).

--=20
Best regards,                                           _     _
  .o. | Liege of Serenely Enlightened Majesty of       o' \,=3D./ `o
  ..o | Computer Science,  Micha=C5=82 "mina86" Nazarewicz     (o o)
  ooo +---[mina86@mina86.com]---[mina86@jabber.org]---ooO--(_)--Ooo--
