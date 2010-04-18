From: Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Sun, 18 Apr 2010 17:24:29 +0200
Message-ID: <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=BscHymLvX3+tssGY88xWSEgtxUd6cn9evm7KEpq12Gs=;
        b=Lxq7hsPg87p3eqDQG0JDJlaVChCaa3nCXIRD6EE1Jek1P92nlTKRAQ9q1vmNu+wr6K
         /DKPfQWbUWzgHDHWhV4tsi+BLoCHuAfwW7tm8DrpXYZ8+rXE64hSa18wM/XFRvV41a9L
         PPiqzJKu7MvqBHFKrNA2Oj5e7bzyS4j7kTT8M=
In-Reply-To: <1268123742-22968-1-git-send-email-felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heikki Krogerus <ext-heikki.krogerus-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Roger Quadros <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Yauheni Kaliuta <yauheni.kaliuta-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Arnaud Mandy <ext-arnaud.2.mandy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, linux-embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org

Hi Felipe,

> The following two patches are RFC because we still have
> a few open questions regarding them.

sorry for responding so late on this patch set. I've been working
on MTP for some years from the host side of the MTP pipe,
with the initiator library libmtp.

I would appreciate if future patch sets are CC:ed to
libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org where we have an MTP
initiator community, thanks.

The patch has some small basic problems due to it's actual
paradigm/use model not being described, and that should be part
of the patch so as to open up for a wider discussion.

The intention of this patch is not to provide any MTP or PTP
gadget drivers at all really, it is about creating a stub driver for
MTP that can be used from userspace, where the actual protocol
implementation is supposed to reside. So this is the PTP/MTP
equivalent of TAP or TUN. This should be clear from the
description of the patch and go in the comments of the file
itself as well so as not to confuse anyone.

The actual background to the driver being a stub is that vendors
are deploying the (proprietary) MTP stack implementation from
Microsoft in userspace on top of a driver like this. (This exact same
work has been duplicated in a few places across the device
manufacturer world.) This rationale should also be clear from the
patch and the files.

It is of course possible to implement a *real* MTP gadget driver in
kernelspace, directly accessing the file system etc, not needing
to involve userspace for any MTP transfers at all. There is an
official USB IF specification for MTP which can be used to that end.
Some day somebody will come along and do just that, I've been sort
of hoping that some company like Google could jump in and actually
do that.

I know this is all absolutely crystal clear to you, but it's not going to
be for everyone else in the world, that why all the words...

Naming the function driver f_mtp.c is confusing since it does not
implement MTP, it should be named f_mtpstub.c (and mtpstub.c) so
that when someone one day really want to implement the protocol in the
kernel, they can use f_mtp.c.

Has the driver been designed with PTP in mind as well? There
are several cameras running PTP on Linux in this world, for example
the stuff from SONY. They have a userspace PTP stack in the same
fashion I believe. I think it would just work with PTP as well after a
quick review, but please give it a second thought.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
