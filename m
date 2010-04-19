From: Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Mon, 19 Apr 2010 18:10:52 +0200
Message-ID: <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
	 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=ts2KIKXuhUOYv8SnI2KkbQ8vvKc2zcWg9asJkSWLGgw=;
        b=HlcUIi5uuRkgxh5oNPmK9NGD21na0iOgmfkUVSBLRzZroFMuasmthNuQGAx3oapgBN
         +rc9JKfsaH1ddm5RoaFtbuluAM7FQHuXjgblRboP9sdr79V9lOoiuIopH+PjRvfvjzbr
         gK+eetIEn9Y5OLOcBK/QDe0FlRldslhBazPkc=
In-Reply-To: <x2m63386a3d1004180824u30bea481t3a11ed889c26b293-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heikki Krogerus <ext-heikki.krogerus-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Roger Quadros <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Yauheni Kaliuta <yauheni.kaliuta-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Arnaud Mandy <ext-arnaud.2.mandy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, linux-embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org

2010/4/18 Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:

> The following two patches are RFC because we still have
> a few open questions regarding them.

Further comments: there is apparently a driver floating around this list
for supporting PTP through the gadgetfs. How does this work relate
to that, and why can't you use gadgetfs?

Second: after looking at this, I think that atleast the part of functionality
called "OS descriptor" should be in the kernel and not in userspace,
is the OS descriptor the reason to why you want to expose EP0 to
userspace, or are you using this for other things in the MTP stack?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
