From: Ben Nizette <bn@niasdigital.com>
Subject: Re: UIO not working on ppc405 onchip registers
Date: Tue, 22 Jul 2008 17:52:50 +1000
Message-ID: <1216713170.4004.243.camel@moss.renham>
References: <200807212152.16080.super.firetwister@gmail.com>
	 <20080722061730.GB12576@digi.com> <1216708967.4004.238.camel@moss.renham>
	 <200807220948.51053.super.firetwister@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200807220948.51053.super.firetwister@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: super.firetwister@googlemail.com
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>


On Tue, 2008-07-22 at 09:48 +0200, super.firetwister@googlemail.com
wrote:
> On Tuesday 22 July 2008, Ben Nizette wrote:
> 
> > As an aside, you sure you want to do this anyway?  
> 
> No ;)
> 
> 
> > I'd suggest that you 
> > just do a gpio chip driver for this, tie it in to gpiolib and use the
> > gpiolib user interface (which IIRC has only made it as far as -mm but is
> > on the way up).  This gives kernel internals nice access to the pins as
> > well through the standard gpio framework.
> 
> This was just an example to make it others easier to reproduce my problem. My 
> goal is to have a soft spi driver in userspace, which would probably be 
> slower if it uses gpiolib. This driver is integrated in the application I 
> want to port to Linux. 

Ah right, cool.  I donno what the speed would be like, but both David
Brownell and Michael Buesch both have spi-over-gpio patches floating
around (eg [1]).  That, plus the spidev interface, might at least be
worth a try..?

But I'll let you get back to solving the UIO problem at hand :-D

	--Ben.

[1] http://lwn.net/Articles/290066/

