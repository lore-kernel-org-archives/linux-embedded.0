From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Thu, 23 Oct 2014 15:05:54 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr>
References: <5441F592.6090807@gmail.com>
 <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
 <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
 <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr> <5447C7BE.60506@landley.net>
 <alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410231334250.6969@knanqh.ubzr>
 <20141023181336.GC10477@piout.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <20141023181336.GC10477@piout.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: "Bird, Tim" <Tim.Bird@sonymobile.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On Thu, 23 Oct 2014, Alexandre Belloni wrote:

> On 23/10/2014 at 13:56:44 -0400, Nicolas Pitre wrote :
> > On Thu, 23 Oct 2014, Bird, Tim wrote:
> > 
> > > I'm not sure why this attention to reading the status.  The salient feature
> > > here is that the initializations are deferred until user space tells the kernel
> > > to proceed.  It's the initiation of the trigger from user-space that matters.
> > > The whole purpose of this feature is to defer some driver initializations until
> > > the product can get into a state where it is already ready to perform it's primary
> > > function.  Only user space knows when that is.
> > 
> > This is still a rather restrictive view of the problem IMHO.
> > 
> > Let's step back a bit. Your concern is that some initcalls are taking 
> > too long and preventing user space from executing early, right?  I'm 
> > suggesting that they no longer prevent user space from executing 
> > earlier.  Why would you then still want an explicit trigger from user 
> > space?
> > 
> > > There seems to be a desire to have an automatic mechanism for triggering
> > > the deferred initializations.  I'm OK with this, as long as there's some reasonable
> > > use case for it.  There are lots of possible trigger mechanisms, including just
> > > a simple timer, but I think it's important that the primary use case of 
> > > 'trigger-when-user-space-says-to' is still supported.
> > 
> > Why a trigger?  I'm suggesting no trigger at all is needed.
> > 
> > Let all initcalls start initializing whenever they can.  Simply that 
> > they shouldn't prevent user space from running early.
> > 
> > Because initcalls are running in parallel, then they must be using 
> > separate kernel threads.  It may be possible to adjust their priority so 
> > if one of them is actually using a lot of CPU cycles then it will run 
> > only when all the other threads (including user space) are no longer 
> > running.
> > 
> 
> You probably can't do that without introducing race conditions. A number
> of userspace libraries and script are actually expecting init and probe
> to be synchronous.

They already have to cope with the fact that most things can be 
available through not-yet-loaded modules, or may never be there at all. 
If not then they should be fixed.

And if you do rely on such a feature for your small embedded 
system then you won't have that many libs and scripts to fix.

> I will refer to the async probe discussion and the
> following thread:
> 
> http://thread.gmane.org/gmane.linux.kernel/1781529

I still don't think that is a good idea at all.  This async probe 
concept requires a trigger from user space and that opens many cans of 
worms as user space now has to be aware of specific kernel driver 
modules, their ordering dependencies, etc.

My point is simply not to defer any initialization at all.  This way you 
don't have to select which module or initcall to send a trigger for 
later on.

Once again, what is the actual problem you want to solve?  If it is 
about making sure user space can execute ASAP then _that_ should be the 
topic, not figuring out how to implement a particular solution.

> Anyway, your userspace will have to have a way to know what has been
> initialized.

Hotplug notifications via dbus.

> On my side, I was also using that mechanism to delay the network stack 
> init but I still want to know when my dhcp client can start for 
> example.

Ditto.  And not only do you want to know when the network stack is 
initialized, but you also need to wait for a link to be established 
before DHCP can work.


Nicolas
