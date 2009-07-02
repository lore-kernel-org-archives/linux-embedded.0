From: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: 2.6.27- Sending uevent from a driver
Date: Thu, 2 Jul 2009 11:11:07 +0100
Message-ID: <20090702111107.08332a4b@lxorguk.ukuu.org.uk>
References: <547eba1b0906300130r6b704e9ft408c63d2c1e6f4a@mail.gmail.com>
	<20090630154110.GD16038@kroah.com>
	<547eba1b0907012139l6b406191p1fc1bdbe3ebc0737@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547eba1b0907012139l6b406191p1fc1bdbe3ebc0737-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Ng <daniel.ng1234-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> Or, maybe the userspace program can receive some sort of interrupt
> from the TTY device when it is ready for I/O.
> 
> Perhaps there is another way to avoid continued polling?

TIOCMIWAIT ioctl for modem signals, and just using poll/select() on the
tty for I/O.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
