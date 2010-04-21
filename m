From: Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Wed, 21 Apr 2010 22:02:00 +0200
Message-ID: <g2q63386a3d1004211302kc175c24dj3eb71aca516c07db@mail.gmail.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
	 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
	 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
	 <20100419162611.GA15131@nokia.com>
	 <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>
	 <l2s4a5ff6bc1004191403nfe758331h3b70cdfd40568338@mail.gmail.com>
	 <u2s63386a3d1004191610va4b2aba3lc84c8b666f19a9e9@mail.gmail.com>
	 <4BCD619B.2000907@nokia.com>
	 <i2x63386a3d1004201644g685b8ddeo609c6eaa8c07ed1f@mail.gmail.com>
	 <4BCEA444.20307@nokia.com>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=HLqZ6tQY4jO5u70+qVZy5cAhFpVNf5OjzfvKmhxNzoA=;
        b=GRzRqb+yby/JpucF8y3wS6bF9dMDLb6mXJN4tT3j1DM3SMo1EHhVWfADIHaoQzv8a1
         Y2uXxBiLDCnB/sBviQi9rwHX2Ezjxnr3UzWT10zZf9wMRFA4cS3d99sqGreNI/H+7n+G
         ITbwnc35na45KRPrFHZyQDSOH6y47/3MsyW8Y=
In-Reply-To: <4BCEA444.20307-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roger Quadros <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Steve Calfee <stevecalfee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Balbi Felipe (Nokia-D/Helsinki)" <felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, linux-embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, "libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>

2010/4/21 Roger Quadros <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>:

[MTP device with PTP class and MTP extension code]

> On Linux (Ubuntu 9.04) it works as PTP device.

If you have libmtp 1.0.1 or later it should work as MTP with some
client program like Rhythmbox or Amarok or Banshee, unless some
PTP handler hogs it first.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
