From: Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Mon, 19 Apr 2010 21:23:46 +0200
Message-ID: <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
	 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
	 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
	 <20100419162611.GA15131@nokia.com>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=1dwNQH0mjkKuU4MhrrlMDfiShDJvtQfkBRgw3UjKUz8=;
        b=JNTFzpLRIrVHgruH12fLLk6EA5lMCg0OFrVb7rGlr1WZl9fQAIzB12TK8Zd7/jv+Ph
         UsROsbD3wWEv44RN6q3l3f3PuOKep+dNGX4Db6RwbeTTF7S76zgFTmKNHEy/VQNsN+Mz
         YcNpYEjtnKTBFR0IPEuDhDFtwijDNk/YTKwhU=
In-Reply-To: <20100419162611.GA15131-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Quadros Roger (Nokia-D/Helsinki)" <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, linux-embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, "libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>

2010/4/19 Felipe Balbi <felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>:
>> 2010/4/18 Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:

>> Further comments: there is apparently a driver floating around this list
>> for supporting PTP through the gadgetfs. How does this work relate
>> to that, and why can't you use gadgetfs?
>
> dude, can't you read ? gadgetfs prevents us from combining into a composite
> gadget. We went throught that already. Please follow the thread before
> commenting.

Yeah sorry, I'm trying to catch up and miss some pieces here and there.
I'm mainly reading it from the MTP side of things.

>> Second: after looking at this, I think that atleast the part of
>> functionality
>> called "OS descriptor" should be in the kernel and not in userspace,
>> is the OS descriptor the reason to why you want to expose EP0 to
>> userspace, or are you using this for other things in the MTP stack?
>
> OS descriptor is MS specific crap, it's not on the USB-IF mtp spec and most
> like MS has some patent on that.

...so I read you like it's not going to be supported with the proposed
solution?

I think that if you want you gadget to work with older Windowses,
you simply have to support this.

Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
