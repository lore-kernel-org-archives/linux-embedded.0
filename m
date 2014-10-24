From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Thu, 23 Oct 2014 20:36:25 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1410231847400.6969@knanqh.ubzr>
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
 <alpine.LFD.2.11.1410231616570.6969@knanqh.ubzr> <54498344.8080507@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <54498344.8080507@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: "Bird, Tim" <Tim.Bird@sonymobile.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On Thu, 23 Oct 2014, Rob Landley wrote:

> Doing hardware probing at low priorities can cause really _fun_ latency
> spikes in the system as something grabs a lock and then sleeps. (And
> doing this at the realtime scheduling where it won't do that translates
> those latency spikes into the aforementioned hard lockup, so not
> actually a solution per se.)
> 
> Trying to fix this in the general case is the priority inheritance
> problem, and last I heard was really hard. Maybe it's been fixed in the
> past few years and I hadn't noticed. (The rise of SMP made it a less
> pressing issue, but system bringup is its own little world.)
> 
I know you're a smart *ss.  But:

1) All this is not about fixing the RT scheduler for the general case.

2) System bring-up being its own world may have special scheduling 
   treatment that doesn't necessarily have to be RT.

3) You, too, conveniently avoided to define the initial problem so far.
   That makes for rather sterile conversations about alternative 
   solutions that could score higher on the mainline acceptance scale.

> >> In some cases, the system may want to defer initialization of some drivers
> >> until explicit action through the user interface.  So the trigger may not be
> >> called until well after boot is "completed".
> > 
> > In that case the "trigger" for initializing those drivers should be the 
> > first time they're accessed from user space.
> 
> Which gets us back to one of the big reasons <strike>systemd</strike>
> devfsd failed years ago: you have to probe the hardware in order to know
> which /dev nodes to create, so you can't have accessing the /dev node
> probe the hardware. (There's no /dev node for a usb controller...)

There is /sys/bus/usb/devices that could be accessed in order to trigger 
the initial setup and probe.  It is most likely that libusb does that, 
but this could be made to work with a simple 'cat' or 'touch' invocation 
as well.

> > That could be the very first time libusb or similar tries to 
> > enumerate available USB devices for example.  No special interface 
> > needed.
> 
> So now you're requiring libusb enumerating usb devices, when before this
> you could just reach out and open /dev/ttyUSB0 and it would be there.

You can't just "reach out" with the deferred initcall scheme either, do 
you?

> This is an embedded solution?
> 
> >>>>> I'm suggesting that they no longer prevent user space from executing
> >>>>> earlier.  Why would you then still want an explicit trigger from user
> >>>>> space?
> >> Because only the user space knows when it is now OK to initialize those
> >> drivers, and begin using CPU cycles on them.
> > 
> > So what?  That is still not a good answer.
> 
> Why?
> 
> I believe Tim's proposal was to take a category of existing device
> probing, one already done on a background thread, and wait to start it
> until userspace says "go". That's about as nonintrusive a change as you get.

You might still be able to do better.

If you really want to be non intrusive, you could e.g. make those 
background threads into SIGSTOP and let user space SIGCONT them as it 
sees fit.  No new special interfaces needed.

> You're talking about requiring weird arbitrary things to have side effects.

Like if stalling arbitrary initcalls wouldn't have side effects?

What I'm suggesting is to let the system do its thing the most efficient 
way while giving a strong bias to running user space first.  How 
arbitrarily weird can that be?

> If you're running in initramfs we haven't necessarily done _any_ driver
> probing yet. That's what initramfs is for. You can put device firmware
> in there so static drivers can make hotplug firmware loading requests to
> userspce during their device programming. (It's one of those usermode
> helper callback things.)

True if you need firmware, or if you want to actually load modules to 
get to the root fs device.  Otherwise all built-in driver init functions 
have been called and waited for at that point.

> >> Note that this solution should work on UP systems, were there is
> >> essentially a zero-sum game on using CPU cycles at boot.
> > 
> > The scheduler knows how to prioritize things on UP as well.  The top 
> > priority thread will always go to sleep at some point allowing other 
> > threads to run. But I'm sure you know all that.
> 
> The top priority threads will get preempted.
> 
> (Did you follow any of the work Con Kolivas and company were doing a few
> years ago?)

Yeah... and I also notice it is still maintained, still out of mainline.

As you know already, you can do anything you want on your own.  That's 
granted by the GPL.


Nicolas
