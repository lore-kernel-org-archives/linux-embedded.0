From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Avoiding platform-specific callbacks in drivers?
Date: Tue, 09 Nov 2010 19:10:51 -0500 (EST)
Message-ID: <alpine.LFD.2.00.1011091905540.13911@xanadu.home>
References: <AANLkTinG4y_Uxes0CJYMH+uwr1TcWwjQy+4+_ftyrnML@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <AANLkTinG4y_Uxes0CJYMH+uwr1TcWwjQy+4+_ftyrnML@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Tue, 9 Nov 2010, Bill Gatliff wrote:

> Let's say that on a given platform, I need to twiddle with a GPIO pin
> when a chip enters and exits suspend.

What driver?  What platform?  This may depend on those.

> One way to do that is to hack the driver itself; a slightly 
> less-inelegant way is to add a function pointer in the platform data, 
> and have the driver call back in its suspend() and resume() methods.  
> I'm not real keen on either strategy, because they both involve 
> touching driver code that should be platform-agnostic.  They seem... 
> hacky.  :)

Sure.  but if it makes sense for your hardware to do this GPIO 
twiddling, maybe someone else is doing that too.  In which case a driver 
solution might be justifiable.

> I would love to come up with a way that prevents touching the driver
> at all, since the activity is terribly platform-specific. Is there
> such a way?
> 
> One possibility is to set up some sort of parent-child relationship
> between the device and a pseudo-device that deals with the GPIO pin.
> But I'm not sure that will actually work, and it seems a bit
> overly-complicated.

That would still be your best bet.  The pseudo-device could register the 
real device and set itself as the parent.


Nicolas
