From: Nicolas Pitre <nico@fluxnic.net>
Subject: RE: Why is the deferred initcall patch not mainline?
Date: Thu, 23 Oct 2014 13:56:44 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1410231334250.6969@knanqh.ubzr>
References: <5441F592.6090807@gmail.com>
 <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
 <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
 <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr> <5447C7BE.60506@landley.net>
 <alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: Rob Landley <rob@landley.net>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "challinan@gmail.com" <challinan@gmail.com>

On Thu, 23 Oct 2014, Bird, Tim wrote:

> I'm not sure why this attention to reading the status.  The salient feature
> here is that the initializations are deferred until user space tells the kernel
> to proceed.  It's the initiation of the trigger from user-space that matters.
> The whole purpose of this feature is to defer some driver initializations until
> the product can get into a state where it is already ready to perform it's primary
> function.  Only user space knows when that is.

This is still a rather restrictive view of the problem IMHO.

Let's step back a bit. Your concern is that some initcalls are taking 
too long and preventing user space from executing early, right?  I'm 
suggesting that they no longer prevent user space from executing 
earlier.  Why would you then still want an explicit trigger from user 
space?

> There seems to be a desire to have an automatic mechanism for triggering
> the deferred initializations.  I'm OK with this, as long as there's some reasonable
> use case for it.  There are lots of possible trigger mechanisms, including just
> a simple timer, but I think it's important that the primary use case of 
> 'trigger-when-user-space-says-to' is still supported.

Why a trigger?  I'm suggesting no trigger at all is needed.

Let all initcalls start initializing whenever they can.  Simply that 
they shouldn't prevent user space from running early.

Because initcalls are running in parallel, then they must be using 
separate kernel threads.  It may be possible to adjust their priority so 
if one of them is actually using a lot of CPU cycles then it will run 
only when all the other threads (including user space) are no longer 
running.

> This code is really intended for a very specialized kernel configuration, where all
> the modules are statically linked, and indeed module loading itself is turned off. 
> I think that's a minority of Linux deployments out there.  This configuration
> implies some other attributes, like configuration for very small size and/or very
> fast boot, where KALLSYMS may not be present, and other kernel features may
> not be available as well.  Indeed, in the smallest systems /proc or /sys may not
> be there, so an alternative (maybe a sysctl or even a new syscall) might be
> appropriate. 
> 
> Quite frankly, the hacky way this is often done is to make stuff like this a
> one-time side effect of a rarely called syscall (like sync).  Please note I'm not
> recommending this for mainline, just pointing out there are interesting ways
> that embedded developers just make the existing code work for their weird
> cases.

Agreed.  However if you're looking for a solution that may go into 
mainline, it just can't be hackish like that.  There might be generic 
solutions that meet your goal while still being useful to others.  
Focussing on the best way to implement a particular solution while there 
might be other solutions to explore is a bad approach.


Nicolas
