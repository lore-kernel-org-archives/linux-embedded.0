From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 16:26:27 +0200
Message-ID: <20090421142627.GA18129@elte.hu>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net> <20090421064346.GB8020@elte.hu> <20090421063549.3b71881d@infradead.org> <20090421135034.GA30114@elte.hu> <20090421140533.GA6375@shareable.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090421140533.GA6375@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Arjan van de Ven <arjan@infradead.org>, David VomLehn <dvomlehn@cisco.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>


* Jamie Lokier <jamie@shareable.org> wrote:

> Ingo Molnar wrote:
> > * Arjan van de Ven <arjan@infradead.org> wrote:
> > > But more importantly... USB *CANNOT* do this fundamental 
> > > operation. USB does not have the capability to know when you have 
> > > seen all devices that are connected. Devices just show up a random 
> > > amount of time after you turn the power on for the bus.... there's 
> > > no "and now we've seen all" operation.
> > 
> > Yes - and this is fundamentally true of any hotplug bus design.
> 
> It's not fundamental, for devices you know are plugged in at boot. 
> All it takes is for the bus to support a synchronous "enumerate 
> all" procedure.  That _could_ involve a timeout, but there are 
> better ways. But not for USB.
> 
> > What i'm saying is: instead of "wait 2000 msecs, maybe it works 
> > out" hack, there should be a proper sleep+event based approach 
> > to the same. With perhaps a _timeout_ for the "no console 
> > arrived" negative case as well. (which timeout can be set to 
> > zero in the "I _know_ there's no console around".)
> 
> Isn't the proposed code doing exactly that?  It sleeps waiting for 
> a console, with a timeout of X msecs.  If a console arrives before 
> that, doesn't it wake immediately?

Yes - except that the timeout is aspecific. I.e. we'll time out even 
if the delay happens not due to a device arriving too late (or not 
arriving at all), but due to some earlier init step taking an 
unexpectedly long time.

> > Do you see the fundamental design difference between the two 
> > solutions?
> 
> The only difference I see is: If you asked for a USB console, the 
> timeout should begin relative to when the USB host driver kicks 
> the bus, not the first /dev/console open.
> 
> Conceptually the timeout is a USB characteristic, not a generic 
> console one.
> 
> For other (non-USB) devices which might take a while to 
> initialise, it should work as you describe.  E.g. an ethernet TCP 
> console should register ("i'm trying to give you a console") 
> followed by ("got it") or ("failed, carry on without me").

I guess we could live with this one too but still it feels wrong to 
me. It would be much better to push the decision to time out into 
individual console drivers.

Also, if we end up doing this - the patch, as proposed right now, 
appears to add a default 1000 msecs sleep to every __tty_open() 
call:

+config PRINTK_CONSOLE_WAIT
+       int "Default number of milliseconds to wait for console device"
+       default 1000

Does this only delay init during a console-less bootup - or are 
there other later apps that might trigger the delay?

	Ingo
