From: Nicolas Pitre <nico@fluxnic.net>
Subject: RE: Why is the deferred initcall patch not mainline?
Date: Thu, 23 Oct 2014 16:50:16 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1410231616570.6969@knanqh.ubzr>
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
 <alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E68C@seldmbx02.corpusers.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <F5184659D418E34EA12B1903EE5EF5FD01BCD433E68C@seldmbx02.corpusers.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On Thu, 23 Oct 2014, Bird, Tim wrote:

> On Thursday, October 23, 2014 12:05 PM, Nicolas Pitre wrote:
> >
> > On Thu, 23 Oct 2014, Alexandre Belloni wrote:
> >
> > > On 23/10/2014 at 13:56:44 -0400, Nicolas Pitre wrote :
> > > > On Thu, 23 Oct 2014, Bird, Tim wrote:
> > > >
> > > > > I'm not sure why this attention to reading the status.  The salient feature
> > > > > here is that the initializations are deferred until user space tells the kernel
> > > > > to proceed.  It's the initiation of the trigger from user-space that matters.
> > > > > The whole purpose of this feature is to defer some driver initializations until
> > > > > the product can get into a state where it is already ready to perform it's primary
> > > > > function.  Only user space knows when that is.
> > > >
> > > > This is still a rather restrictive view of the problem IMHO.
> > > >
> > > > Let's step back a bit. Your concern is that some initcalls are taking
> > > > too long and preventing user space from executing early, right?
> Well,  not exactly.
> 
> That is not the exact problem we're trying to solve, although it is close.
> The problem is not that users-space doesn't start early enough, per se,
> it's that there are a set of drivers statically linked to the kernel that are
> not needed until after (possibly well after) user space starts.
> Any cycles whatsoever being spent on those drivers (either in their
> initialization routines, or in processing them or scheduling them)
> impairs the primary function of the device.  On a very old presentation
> I gave on this, the use case I gave was getting a picture of a baby's smile.
> USB drivers are NOT needed for this, but they *are* needed for full
> product operation.

As I suggested earlier, those cycles spent on those drivers may be 
deferred to a moment when the CPU has nothing else to do anyway by 
giving a lower priority to the threads handling them.

> In some cases, the system may want to defer initialization of some drivers
> until explicit action through the user interface.  So the trigger may not be
> called until well after boot is "completed".

In that case the "trigger" for initializing those drivers should be the 
first time they're accessed from user space.  That could be the very 
first time libusb or similar tries to enumerate available USB devices 
for example.  No special interface needed.

> > > > I'm suggesting that they no longer prevent user space from executing
> > > > earlier.  Why would you then still want an explicit trigger from user
> > > > space?
> Because only the user space knows when it is now OK to initialize those
> drivers, and begin using CPU cycles on them.

So what?  That is still not a good answer.

User space shouldn't have to care as long as it has all the CPU cycles 
it wants in priority.  But as soon as user space relinquishes the CPU 
then there is no reason why driver initialization couldn't take over 
until user space is made runnable again.

[...]
> > My point is simply not to defer any initialization at all.  This way you
> > don't have to select which module or initcall to send a trigger for
> > later on.
> 
> If you are going to avoid having a sub-set of modules consume
> CPU cycles in early boot, you're going to have to identify them somehow.
> How do you propose to enumerate the modules to defer (or
> de-prioritize, as the case may be)?

Anything that is not involved with making the root fs available.

> Note that this solution should work on UP systems, were there is
> essentially a zero-sum game on using CPU cycles at boot.

The scheduler knows how to prioritize things on UP as well.  The top 
priority thread will always go to sleep at some point allowing other 
threads to run. But I'm sure you know all that.

> > Once again, what is the actual problem you want to solve?  If it is
> > about making sure user space can execute ASAP then _that_ should be the
> > topic, not figuring out how to implement a particular solution.
> 
> See above.  The actual problem is that we want some sub-set of statically
> linked drivers to not consume any cycles during a period of time defined
> by user space. 

Once again you're defining a solution (i.e. not consume any cycles ...) 
rather than the problem motivating this particular solution. That's not 
how you're going to have something merged upstream.

And I'm not saying your solution is completely bad either if you're 
looking for the simplest way and willing to keep it to yourself.  What 
I'm saying is that there are other possible solutions that could solve 
your initial problem _and_ be acceptable to mainline... but they're 
unlikely to look like what you have now.


Nicolas
