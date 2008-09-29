From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Re: local_save_flags(flags)
Date: Sun, 28 Sep 2008 23:32:05 -0400
Message-ID: <200809282332.05827.rgetz@blackfin.uclinux.org>
References: <77566.7174.qm@web63401.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <77566.7174.qm@web63401.mail.re1.yahoo.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: Mike Frysinger <vapier.adi@gmail.com>, linux embedded <linux-embedded@vger.kernel.org>

On Wed 24 Sep 2008 13:06, Fundu pondered:
> > >>> what about Non maskable interrupts ? disabling
> > >>> interrupt won't have any effect on that
> > right ?
> > >>
> > >> that really doesnt make sense by definition huh.
> > >> non-maskable means
> > >> they cant be masked.
> > >
> > > yeah thats the point. i should have elaborated more.
> > > then there's no guarantee that your code wont be
> > interrupted ?

Disabling interrupts does not normally mask NMI, reset, exceptions
and emulation. All can interrupt your code. Most do not return (except 
exceptions) - so it is not a big deal.

exceptions - also depend heavily on your processor type/architecture - but can 
range from TLB miss/dirty - to unaligned access fixups.

On Blackfin - we don't do unaligned access fixups - this has the upside of 
when your code does this - it crashes - so you tend to find it early :) The 
downside is that the code which functions (slowly) on other architectures 
does not run on Blackfin...

> > design your system properly and it wont be an issue
> 
> could you elaborate more on this, as to what you mean by good design in
> this context.

If you have something that is timing critical - make sure - by design - that 
you will not cause exception events.

In most Blackfin systems that is done by ensuring that the TLB for the kernel 
is covered and locked. You never get a ITLB miss in kernel code, and a DTLB 
miss only occurs on kmalloced data. (which you shouldn't be acessing)

> > you about the Blackfin processor, but i doubt you're
> > using that.
>
> sure i would like to know. i also have a 537 which i would work on for
> the next project and don't mind more info on it.

It really depends on what you are trying to do.

If you are that timing critical - you want to put things into internal L1 
memory - so you don't take the penalty of cache misses/flushes either...
