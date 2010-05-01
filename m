From: Samo Pogacnik <samo_pogacnik@t-2.net>
Subject: Re: [PATCH] console logging detour via printk
Date: Sun, 02 May 2010 00:45:48 +0200
Message-ID: <1272753948.2147.262.camel@itpsd6lap>
References: <1272664980.10241.77.camel@itpsd6lap>
	 <20100501120418.6fca2aad@lxorguk.ukuu.org.uk>
	 <1272739689.2147.156.camel@itpsd6lap>
	 <20100501204131.4c7aeae4@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100501204131.4c7aeae4@lxorguk.ukuu.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Dne 01.05.2010 (sob) ob 20:41 +0100 je Alan Cox zapisal(a):
> > The distros have no problem logging complete console output into log
> > files or over the network, because they simply do not do it at least for
> > the initrd part of the boot process (i'd be glad, if i'm wrong). 
> 
> I'd have to double check - but its trivial to move the log if so.
> 
> > > I suspect what you actually need for such logging might be to write a
> > > very simple tty driver whose write method is implemented as printk. That
> > > works in the general case and doesn't require hacking up the code
> > > everywhere else.
> > 
> > Looks to me that some kernel code is welcome:)?
> 
> I really don't see the point but if you must do it then doing it as its
> own driver would at least avoid making a mess in the rest of the kernel,
> at which point it becomes less of a problem
> 
> > > However given your init stuff can trivially use openpty to set up a logged
> > > console I am not sure I see the point in doing this in kernel in the
> > > first place.
> > > 
> > 
> > As said above, how to bridge kernel boot start and logging daemon
> > start-up without kernel help, especially when initrd is in the way? imho
> > it would be too complicated.
> 
> Put the logging start up in the initrd, its just a ramdisk its not
> special in any way at all.
I understand and can agree with everything you said, however providing
an additional mechanism might not hurt. Funny enough by generalizing the
patch for any console type, the essential code change is made at the
same place where initial console redirection mechanism has been
implemented. And again, console redirection can not log anything that
has been output to console prior to redirection activation.  

regards, Samo
