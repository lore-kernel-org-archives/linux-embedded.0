From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Thu, 23 Oct 2014 20:13:36 +0200
Message-ID: <20141023181336.GC10477@piout.net>
References: <5441F592.6090807@gmail.com>
 <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
 <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
 <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr>
 <5447C7BE.60506@landley.net>
 <alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410231334250.6969@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.11.1410231334250.6969@knanqh.ubzr>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nico@fluxnic.net>
Cc: "Bird, Tim" <Tim.Bird@sonymobile.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On 23/10/2014 at 13:56:44 -0400, Nicolas Pitre wrote :
> On Thu, 23 Oct 2014, Bird, Tim wrote:
> 
> > I'm not sure why this attention to reading the status.  The salient feature
> > here is that the initializations are deferred until user space tells the kernel
> > to proceed.  It's the initiation of the trigger from user-space that matters.
> > The whole purpose of this feature is to defer some driver initializations until
> > the product can get into a state where it is already ready to perform it's primary
> > function.  Only user space knows when that is.
> 
> This is still a rather restrictive view of the problem IMHO.
> 
> Let's step back a bit. Your concern is that some initcalls are taking 
> too long and preventing user space from executing early, right?  I'm 
> suggesting that they no longer prevent user space from executing 
> earlier.  Why would you then still want an explicit trigger from user 
> space?
> 
> > There seems to be a desire to have an automatic mechanism for triggering
> > the deferred initializations.  I'm OK with this, as long as there's some reasonable
> > use case for it.  There are lots of possible trigger mechanisms, including just
> > a simple timer, but I think it's important that the primary use case of 
> > 'trigger-when-user-space-says-to' is still supported.
> 
> Why a trigger?  I'm suggesting no trigger at all is needed.
> 
> Let all initcalls start initializing whenever they can.  Simply that 
> they shouldn't prevent user space from running early.
> 
> Because initcalls are running in parallel, then they must be using 
> separate kernel threads.  It may be possible to adjust their priority so 
> if one of them is actually using a lot of CPU cycles then it will run 
> only when all the other threads (including user space) are no longer 
> running.
> 

You probably can't do that without introducing race conditions. A number
of userspace libraries and script are actually expecting init and probe
to be synchronous. I will refer to the async probe discussion and the
following thread:

http://thread.gmane.org/gmane.linux.kernel/1781529

Anyway, your userspace will have to have a way to know what has been
initialized. On my side, I was also using that mechanism to delay the
network stack init but I still want to know when my dhcp client can
start for example.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
