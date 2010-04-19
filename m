From: Felipe Balbi <felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Mon, 19 Apr 2010 20:24:04 +0300
Message-ID: <20100419172404.GA15340@nokia.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
 <20100419162611.GA15131@nokia.com>
 <op.vbe5bfm47p4s8u@pikus>
 <20100419171534.GA30381@kroah.com>
Reply-To: felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100419171534.GA30381-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: ext Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: =?utf-8?Q?Micha=C5=82?= Nazarewicz <m.nazarewicz-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "Balbi Felipe (Nokia-D/Helsinki)" <felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, ext Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Quadros Roger (Nokia-D/Helsinki)" <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, linux-embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, "libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>

On Mon, Apr 19, 2010 at 07:15:34PM +0200, ext Greg KH wrote:
>On Mon, Apr 19, 2010 at 06:55:53PM +0200, Micha=C5=82 Nazarewicz wrote=
:
>> > On Mon, Apr 19, 2010 at 06:10:52PM +0200, ext Linus Walleij wrote:
>> >> Further comments: there is apparently a driver floating around th=
is list
>> >> for supporting PTP through the gadgetfs. How does this work relat=
e
>> >> to that, and why can't you use gadgetfs?
>>
>> On Mon, 19 Apr 2010 18:26:11 +0200, Felipe Balbi <felipe.balbi@nokia=
=2Ecom> wrote:
>> > dude, can't you read ? gadgetfs prevents us from combining into a
>> > composite gadget. We went throught that already. Please follow the
>> > thread before commenting.
>>
>> On related news, I've just posted FunctionFS driver. :) It's still i=
mperfect
>> but appears to be working.
>
>Yes, that should solve the gadgetfs issue for you, right Felipe?

sure it should. Will take a look at it :-)

--=20
balbi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
