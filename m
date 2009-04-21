From: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 20:25:01 +0100
Message-ID: <20090421202501.26a44f9d@lxorguk.ukuu.org.uk>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net>
	<20090421064346.GB8020@elte.hu>
	<200904210013.48551.david-b@pacbell.net>
	<1240333871.3632.70.camel@macbook.infradead.org>
	<alpine.LFD.2.00.0904211016190.2199@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.0904211016190.2199-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

> > failing to open it, why can't we make __tty_open() give you a dummy tty
> > driver which is basically equivalent to /dev/null? And then 'replace' it
> > with the real console driver if/when that later gets registered? The
> > latter will be a high-caffeine job, but surely not impossible?
> 
> This sounds like a good option. 

Don't confuse "/dev/console" and "the console device" in printk terms.
The two are not the same thing and the latter is subject to stuff like
redirection.

> thing, but it should be possible to just do something like
> 
> 	static struct tty_driver console_driver;

No - a console device can fail to open so you need to try the next one in
that situation. Some platforms use this feature.

> Anybody want to try it? Just make it ignore any IO if there are no 
> registered consoles. The patch shouldn't even be all that big, I suspect.

It will work, but on its own it won't actually fix the problem people
have, which is wanting to wait for a real console to appear. Extending it
to sleep (if not O_NDELAY) and loop back through the list when the list
changes would however do the trick, that or a tty device that buffers
then spews into the real device when it appears.

Definitely the right path, and we almost have every tty device in
existance containing a struct tty_port, at which point it gets even
cleaner.

The printk() console needs to buffer up data and replay it but we already
pretty much do what is needed even for vt consoles because the fb isn't
ready before the first printk.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
