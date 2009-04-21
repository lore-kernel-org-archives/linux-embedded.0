From: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 18:41:05 +0100
Message-ID: <1240335665.3632.71.camel@macbook.infradead.org>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net>
	 <20090421064346.GB8020@elte.hu> <200904210013.48551.david-b@pacbell.net>
	 <1240333871.3632.70.camel@macbook.infradead.org>
	 <20090421172929.GC8251@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090421172929.GC8251-CFZJ1or75eBPWxJt6d6B6bQa8qPdvLwY@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

On Tue, 2009-04-21 at 10:29 -0700, David VomLehn wrote:
> On Tue, Apr 21, 2009 at 06:11:11PM +0100, David Woodhouse wrote:
> ...
> > The kernel output is going to be spewed when a console registers with
> > CON_PRINTBUFFER anyway, and if we printk a warning about userspace
> > console output being lost, that ought to be good enough to notify the
> > user that something may have been lost. For bonus points, we could even
> > make that 'dummy' tty driver buffer a limited amount of userspace
> > output, maybe.
> 
> What in the world are users going to do when they see a message about
> output being lost? There is no way to recover the data and no way to
> prevent it in the future. I don't think this is a good approach.
> 
> Remember, even though the previous functionality of USB consoles was, in
> theory, less reliable than it appeared, it actually has been working well
> for years. Thus, tossing output will count as a regression for most of the
> world.

So implement a small amount of buffering, as I suggested, and it should
be sufficient to cover the cases that were only working before by blind
luck anyway.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org                              Intel Corporation

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
