From: Daniel Ng <daniel.ng1234-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: 2.6.27- Sending uevent from a driver
Date: Thu, 2 Jul 2009 14:39:21 +1000
Message-ID: <547eba1b0907012139l6b406191p1fc1bdbe3ebc0737@mail.gmail.com>
References: <547eba1b0906300130r6b704e9ft408c63d2c1e6f4a@mail.gmail.com>
	 <20090630154110.GD16038@kroah.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=WDH8s2l5CqwnjO0i9rjaUwU8/QSRDA6dZ/nswt8IZXg=;
        b=TDeDAiZTp0rkkcjS5P4oT0GfZAPgshyFukHE7YVerEgDw7gNGAC3dUJedy32pDGm0R
         HeBS5vztrRSLMh4puR7Tw34DQ+LMe5qOA48SYrNWl09vbaejgL29/6hcSDaa6pvg35ba
         TsZxSOjJCaKzN9hrzjehJoX2d0d2/B5BmbXOM=
In-Reply-To: <20090630154110.GD16038-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Greg,

On Wed, Jul 1, 2009 at 1:41 AM, Greg KH<greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org> wrote:
> Shouldn't the userspace just be monitoring the tty line settings (lik=
e
> CTS) to know when to start sending data? =A0I wouldn't recommend addi=
ng a
> new interface to a very old, and standardized, interface.

Does this mean the userspace program would have to continually poll
for the TTY line status?

Instead, I'd like the userspace program to listen (select) on a socket
and receive some sort of notification when the TTY is ready for I/O.

Or, maybe the userspace program can receive some sort of interrupt
from the TTY device when it is ready for I/O.

Perhaps there is another way to avoid continued polling?

Cheers,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
