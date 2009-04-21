From: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 15:05:33 +0100
Message-ID: <20090421140533.GA6375@shareable.org>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net> <20090421064346.GB8020@elte.hu> <20090421063549.3b71881d@infradead.org> <20090421135034.GA30114@elte.hu>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090421135034.GA30114-X9Un+BFzKDI@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Cc: Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

Ingo Molnar wrote:
> * Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> > But more importantly... USB *CANNOT* do this fundamental 
> > operation. USB does not have the capability to know when you have 
> > seen all devices that are connected. Devices just show up a random 
> > amount of time after you turn the power on for the bus.... there's 
> > no "and now we've seen all" operation.
> 
> Yes - and this is fundamentally true of any hotplug bus design.

It's not fundamental, for devices you know are plugged in at boot.
All it takes is for the bus to support a synchronous "enumerate all"
procedure.  That _could_ involve a timeout, but there are better ways.
But not for USB.

> What i'm saying is: instead of "wait 2000 msecs, maybe it works out" 
> hack, there should be a proper sleep+event based approach to the 
> same. With perhaps a _timeout_ for the "no console arrived" negative 
> case as well. (which timeout can be set to zero in the "I _know_ 
> there's no console around".)

Isn't the proposed code doing exactly that?  It sleeps waiting for a
console, with a timeout of X msecs.  If a console arrives before that,
doesn't it wake immediately?

> Do you see the fundamental design difference between the two 
> solutions?

The only difference I see is: If you asked for a USB console, the
timeout should begin relative to when the USB host driver kicks the
bus, not the first /dev/console open.

Conceptually the timeout is a USB characteristic, not a generic
console one.

For other (non-USB) devices which might take a while to initialise, it
should work as you describe.  E.g. an ethernet TCP console should
register ("i'm trying to give you a console") followed by ("got it")
or ("failed, carry on without me").

-- Jamie
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
