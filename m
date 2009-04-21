From: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 15:37:45 +0100
Message-ID: <20090421153745.2d8964c7@lxorguk.ukuu.org.uk>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net>
	<20090421064346.GB8020@elte.hu>
	<20090421063549.3b71881d@infradead.org>
	<20090421135034.GA30114@elte.hu>
	<20090421140533.GA6375@shareable.org>
	<20090421142627.GA18129@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090421142627.GA18129-X9Un+BFzKDI@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Cc: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

> +config PRINTK_CONSOLE_WAIT
> +       int "Default number of milliseconds to wait for console device"
> +       default 1000
> 
> Does this only delay init during a console-less bootup - or are 
> there other later apps that might trigger the delay?

The console proper needs to be event based not timeout hacks. Can we
please fix this stuff properly ? To start with there is no reason that the
USB console can't implement a "maybe we have hardware, maybe I buffer 64K
until it shows up" behaviour and bind to hardware as and when USB serial
devices get inserted. We do much of this for the VT drivers so we save
messages before PCI and fb come up.

The timeout wait proposed is also wrong I agree. Take a timestamp at the
point we are ready to mount the root fs, any delays on root mount, console
appearance etc should then be tested against this timestamp not as delays
versus some undefined later event.

Alan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
