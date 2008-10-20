From: Ben Nizette <bn@niasdigital.com>
Subject: Re: UIO - interrupt performance
Date: Mon, 20 Oct 2008 21:28:21 +1100
Message-ID: <1224498501.3954.50.camel@moss.renham>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Douglas, Jim (Jim)" <jdouglas@avaya.com>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>


On Mon, 2008-10-20 at 10:55 +0100, Douglas, Jim (Jim) wrote:
> We are contemplating porting a large number of device drivers to Linux.
> The pragmatic solution is to keep them in user mode (using the UIO
> framework) where possible ... they are written in C++ for a start.  
> 
> The obvious disadvantages of user mode device drivers are security /
> isolation.  The main benefit is ease of development.  
> 
> Do you know what the *technical* disadvantages of this approach might
> be? I am most concerned about possible impact on interrupt handling. 
> 
> For example, I assume the context switching overhead is higher, and that
> interrupt latency is more difficult to predict?  

Userspace drivers certainly aren't first class citizens; uio and kernel
mode drivers generally aren't really interchangeable.

The technical disadvantages of userspace drivers are that you don't have
access to kernel subsystems, you can't run any userspace content in irq
context so everything needs to be scheduled before it can be dealt with.
A UIO driver still needs a kernel component to do acknowledge the
interrupt.  As such when you say "interrupt latency" you need to define
the end point.  A UIO driver will have it's in-kernel handler called
just as quickly as any other driver but the userspace app will need to
be scheduled before it receives notification that the IRQ has fired.

The technical advantage of a UIO driver is that devices which only need
to shift data don't have to double-handle it.  e.g. an ADC card doesn't
need to move ADC results from hardware to kernel, kernel to userspace,
it's just one fluid movement.

What kind of device drivers are you talking about?  They have to be of a
fairly specific flavour to fit in to a UIO model.  Linux isn't a
microkernel, userspace drivers are quite restricted in their power.

FWIW there is some (out of tree) kernel code written in C++, it can be
done but you have to avoid the standard c++ library which unfortunately
includes things like 'new'.

	--Ben.
