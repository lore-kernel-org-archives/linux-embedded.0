From: Steve Calfee <stevecalfee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Mon, 19 Apr 2010 14:03:24 -0700
Message-ID: <l2s4a5ff6bc1004191403nfe758331h3b70cdfd40568338@mail.gmail.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
	 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
	 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
	 <20100419162611.GA15131@nokia.com>
	 <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=EKjD1hbeiuZCmnNXuHzjXjWvi6u8QC8kXiF7cD2JEgo=;
        b=fAOMXKapimrW238/H6gLfyQtEiISnuWthPeiuZMaVBybKgEZq/M27/sKSYqo1G1IDV
         AXVWzmIT80aNRc0t7IRAb3Gfjza2XIJx2x7JFQV7AO0xAyGk0+/V4hXmfayRFI6VOjoU
         Tlj90jDAL4EsCREkZVafcv0Na34MAbV+JUnXE=
In-Reply-To: <p2p63386a3d1004191223jb650984ft37372276e4870e87-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Quadros Roger (Nokia-D/Helsinki)" <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, linux-embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, "libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>

On Mon, Apr 19, 2010 at 12:23 PM, Linus Walleij
<linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 2010/4/19 Felipe Balbi <felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>:
>>> 2010/4/18 Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>

>
>>> Second: after looking at this, I think that atleast the part of
>>> functionality
>>> called "OS descriptor" should be in the kernel and not in userspace,
>>> is the OS descriptor the reason to why you want to expose EP0 to
>>> userspace, or are you using this for other things in the MTP stack?
>>
>> OS descriptor is MS specific crap, it's not on the USB-IF mtp spec and most
>> like MS has some patent on that.
>
> ...so I read you like it's not going to be supported with the proposed
> solution?
>
> I think that if you want you gadget to work with older Windowses,
> you simply have to support this.
>
Interesting.

For 6 months, a while ago, I was working on virtual USB stuff for a
company. I did analyser traces of many devices including many MS
devices (mice, webcam, keyboard, joystick), and never found any device
from MS or anyone that supported that command. All devices that I saw
just replied (properly) with a STALL - and Winxp would just continue
on and handle the device.

When you say "older windowses", which one; the only earlier ones with
USB was 98 and descendants and somewhat 95.

Also have you found a device that actually responds to the "get
osdescriptor" request?

Regards, Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
