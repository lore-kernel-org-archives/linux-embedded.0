From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Wed, 21 Apr 2010 12:12:48 +0200
Message-ID: <op.vbibzmh17p4s8u@pikus>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
 <20100419162611.GA15131@nokia.com> <op.vbe5bfm47p4s8u@pikus>
 <20100419171534.GA30381@kroah.com> <20100419172404.GA15340@nokia.com>
 <op.vbfaxsld7p4s8u@pikus> <20100419200457.GB27643@nokia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20100419200457.GB27643-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org
Cc: ext Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, ext Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Quadros Roger (Nokia-D/Helsinki)" <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, linux-embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, "libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>

> On Mon, Apr 19, 2010 at 08:57:18PM +0200, ext Micha=C5=82 Nazarewicz =
wrote:
>> on top of FunctionFS before optimising the code) and in particular u=
_char
>> seem to be a good piece to steal code from. ;)  Still, as said, I ha=
ven't
>> analysed possible optimisations just yet.

On Mon, 19 Apr 2010 22:04:57 +0200, Felipe Balbi <felipe.balbi-xNZwKgViW5g@public.gmane.org=
m> wrote:
> go for it :-)

I only started wondering whether buffering won't break some drivers.
Queuing the requests and buffering the data may be good from speed
point of view, but it may lead to user space driver loosing control
over the transmission.

My understanding of USB protocol is not perfect so I may use wrong
terms here, but please bare with me.

fsync() solves the issue of not knowing when the data is sent but
there is no similar mechanism for reading.

In particular how can we stall on read? Say protocol is designed in
such a way, that host sends a request on EP0 and some data on EP1.
Now, after handling the control request from EP0 we would like to
stall no EP1 but by the time we try to do that the data from host
has already been received and buffered in FunctionFS.

--=20
Best regards,                                           _     _
  .o. | Liege of Serenely Enlightened Majesty of       o' \,=3D./ `o
  ..o | Computer Science,  Micha=C5=82 "mina86" Nazarewicz     (o o)
  ooo +---[mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org]---[mina86-/eSpBmjxGS4dnm+yROfE0A@public.gmane.org]---ooO--(_)--Ooo--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
