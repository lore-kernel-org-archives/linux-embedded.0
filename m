From: "Bird, Tim" <Tim.Bird@sonymobile.com>
Subject: RE: Why is the deferred initcall patch not mainline?
Date: Thu, 23 Oct 2014 22:10:42 +0200
Message-ID: <F5184659D418E34EA12B1903EE5EF5FD01BCD433E68C@seldmbx02.corpusers.net>
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
 <20141023181336.GC10477@piout.net>,<alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Rob Landley <rob@landley.net>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On Thursday, October 23, 2014 12:05 PM, Nicolas Pitre wrote:
>
> On Thu, 23 Oct 2014, Alexandre Belloni wrote:
>
> > On 23/10/2014 at 13:56:44 -0400, Nicolas Pitre wrote :
> > > On Thu, 23 Oct 2014, Bird, Tim wrote:
> > >
> > > > I'm not sure why this attention to reading the status.  The salient feature
> > > > here is that the initializations are deferred until user space tells the kernel
> > > > to proceed.  It's the initiation of the trigger from user-space that matters.
> > > > The whole purpose of this feature is to defer some driver initializations until
> > > > the product can get into a state where it is already ready to perform it's primary
> > > > function.  Only user space knows when that is.
> > >
> > > This is still a rather restrictive view of the problem IMHO.
> > >
> > > Let's step back a bit. Your concern is that some initcalls are taking
> > > too long and preventing user space from executing early, right?
Well,  not exactly.

That is not the exact problem we're trying to solve, although it is close.
The problem is not that users-space doesn't start early enough, per se,
it's that there are a set of drivers statically linked to the kernel that are
not needed until after (possibly well after) user space starts.
Any cycles whatsoever being spent on those drivers (either in their
initialization routines, or in processing them or scheduling them)
impairs the primary function of the device.  On a very old presentation
I gave on this, the use case I gave was getting a picture of a baby's smile.
USB drivers are NOT needed for this, but they *are* needed for full
product operation.

In some cases, the system may want to defer initialization of some drivers
until explicit action through the user interface.  So the trigger may not be
called until well after boot is "completed".

> > > I'm suggesting that they no longer prevent user space from executing
> > > earlier.  Why would you then still want an explicit trigger from user
> > > space?
Because only the user space knows when it is now OK to initialize those
drivers, and begin using CPU cycles on them.

> > >
> > > > There seems to be a desire to have an automatic mechanism for triggering
> > > > the deferred initializations.  I'm OK with this, as long as there's some reasonable
> > > > use case for it.  There are lots of possible trigger mechanisms, including just
> > > > a simple timer, but I think it's important that the primary use case of
> > > > 'trigger-when-user-space-says-to' is still supported.
> > >
> > > Why a trigger?  I'm suggesting no trigger at all is needed.
> > >
> > > Let all initcalls start initializing whenever they can.  Simply that
> > > they shouldn't prevent user space from running early.
> > >
> > > Because initcalls are running in parallel, then they must be using
> > > separate kernel threads.  It may be possible to adjust their priority so
> > > if one of them is actually using a lot of CPU cycles then it will run
> > > only when all the other threads (including user space) are no longer
> > > running.
> > >
> >
> > You probably can't do that without introducing race conditions. A number
> > of userspace libraries and script are actually expecting init and probe
> > to be synchronous.
>
> They already have to cope with the fact that most things can be
> available through not-yet-loaded modules, or may never be there at all.
> If not then they should be fixed.
>
> And if you do rely on such a feature for your small embedded
> system then you won't have that many libs and scripts to fix.
>
> > I will refer to the async probe discussion and the
> > following thread:
> >
> > http://thread.gmane.org/gmane.linux.kernel/1781529
>
> I still don't think that is a good idea at all.  This async probe
> concept requires a trigger from user space and that opens many cans of
> worms as user space now has to be aware of specific kernel driver
> modules, their ordering dependencies, etc.
>
> My point is simply not to defer any initialization at all.  This way you
> don't have to select which module or initcall to send a trigger for
> later on.

If you are going to avoid having a sub-set of modules consume
CPU cycles in early boot, you're going to have to identify them somehow.
How do you propose to enumerate the modules to defer (or
de-prioritize, as the case may be)?

Note that this solution should work on UP systems, were there is
essentially a zero-sum game on using CPU cycles at boot.

>
> Once again, what is the actual problem you want to solve?  If it is
> about making sure user space can execute ASAP then _that_ should be the
> topic, not figuring out how to implement a particular solution.

See above.  The actual problem is that we want some sub-set of statically
linked drivers to not consume any cycles during a period of time defined
by user space.  This is rather trivial to accomplish with modules, and the
proposed implementation tries to provide similar functionality for a statically
linked kernel.  I'm open to discussing solutions other than the particular
implementation proposed, just not ones that don't actually solve that problem.

> > Anyway, your userspace will have to have a way to know what has been
> > initialized.
>
> Hotplug notifications via dbus.

In the original code, it was return from a write system call.  No dbus required.

I hope I'm clarifying the desired functionality here, and not just appearing
obstinate and unwilling to discuss alternate solutions.
 -- Tim


