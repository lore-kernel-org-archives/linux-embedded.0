From: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 15:50:34 +0200
Message-ID: <20090421135034.GA30114@elte.hu>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net> <20090421064346.GB8020@elte.hu> <20090421063549.3b71881d@infradead.org>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090421063549.3b71881d-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>


* Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:

> On Tue, 21 Apr 2009 08:43:46 +0200
> Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org> wrote:
> 
> > The proper approach would be to use one of the async_synchronize*() 
> > facilities in kernel/async.c to properly order the opening of the 
> > console with device init.
> 
> Unfortunately this is not the answer.
> 
> First of all, USB does not use the async_* infrastructure, so it does
> not do anything.

[ Of course it does not. Two kernel cycles ago nothing had any async 
  infrastructure ;-) We barely have any use of it today. But cases 
  like this are the way to extend its use. ]

> But more importantly... USB *CANNOT* do this fundamental 
> operation. USB does not have the capability to know when you have 
> seen all devices that are connected. Devices just show up a random 
> amount of time after you turn the power on for the bus.... there's 
> no "and now we've seen all" operation.

Yes - and this is fundamentally true of any hotplug bus design.

Nevertheless the wish has been expressed to wait for such a device 
to become available, in this very thread we are discussing.

What i'm saying is: instead of "wait 2000 msecs, maybe it works out" 
hack, there should be a proper sleep+event based approach to the 
same. With perhaps a _timeout_ for the "no console arrived" negative 
case as well. (which timeout can be set to zero in the "I _know_ 
there's no console around".)

Do you see the fundamental design difference between the two 
solutions?

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
