From: David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 00:13:48 -0700
Message-ID: <200904210013.48551.david-b@pacbell.net>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net> <20090421064346.GB8020@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090421064346.GB8020-X9Un+BFzKDI@public.gmane.org>
Content-Disposition: inline
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Cc: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

On Monday 20 April 2009, Ingo Molnar wrote:
> The proper approach would be to use one of the async_synchronize*() 
> facilities in kernel/async.c to properly order the opening of the 
> console with device init.

Stepping back a moment from "how" to make sure "what" is agreed on.

I think I see three scenarios here:

 - Classic PC or server, where there's a meaningful console;

 - Deeply embedded systems, where there isn't;

 - Development stages of "deeply embedded", where there *may* be one.

If that's correct, then async_synchronize() isn't a full answer...

I think a fair number of cases can be papered over with a serial
console with no hardware flow control, which isn't hooked up to
anything.  Maybe the board needs a test/development jig to get one;
without it, the "console" bits spill out into the aether.  Linux
can dump bits to ttyS0, which will act like /dev/null.

But the problem case here seems to be one where such un-hooked-up
serial ports are not realistic options.  Which is why the regression
in USB console functionality has been troublesome.


Is that correct?

- Dave
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
