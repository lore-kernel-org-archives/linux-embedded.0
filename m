From: Nicolas Pitre <nico@cam.org>
Subject: Re: Can I run an application compiled with gcc ABI 2.95 on a kernel
 compiled with gcc ABI 3.4?
Date: Fri, 15 May 2009 12:31:01 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.0905151219421.6741@xanadu.home>
References: <20090515115009.110740@gmx.net>
 <1242390699.4201.3.camel@macbook.infradead.org>
 <20090515135105.GC8235@shareable.org>
 <1242395765.4201.94.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <1242395765.4201.94.camel@macbook.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jamie Lokier <jamie@shareable.org>, muzungu@gmx.net, linux-embedded@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

On Fri, 15 May 2009, David Woodhouse wrote:

> On Fri, 2009-05-15 at 14:51 +0100, Jamie Lokier wrote:
> > 
> > Eek, can you say a bit more about the ARM EABI mismatch?
> > 
> > I would like to run a shiny modern ARM EABI kernel and userspace, but
> > also need to run one or two OABI binaries (from the gcc 2.95 era) on
> > the same kernel which I cannot recompile because they're built with
> > closed source libraries only supplied as OABI.
> > 
> > Does that not work at all?
> > 
> > If it does work, which part of userspace must be EABI to work?
> 
> It was just a note of caution that sometimes we _do_ change the ABI.
> 
> I'm not 100% sure offhand whether the EABI kernel can support OABI
> userspace; I didn't think so though.

Yes it can, for basic stuff.  That means basic system calls with issues 
are fixed up when necessary. This does not include things like ioctls 
though, and in this case your mileage may vary.  Notably, ALSA is known 
to fail, some features of iptables too.  See documentation at the top of 
arch/arm/kernel/sys_oabi-compat.c to get an idea of what to watch for.

It is also possible to extend on what is already there for specific 
needs that are not covered by the current set of fixups (and contribute 
it back).  But complete coverage is almost impossible to achieve and 
pointless.


Nicolas
