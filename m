From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Thu, 23 Oct 2014 20:31:57 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1410231900430.6969@knanqh.ubzr>
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
 <alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr> <54497AB8.10609@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <54497AB8.10609@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, "Bird, Tim" <Tim.Bird@sonymobile.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On Thu, 23 Oct 2014, Rob Landley wrote:

> On 10/23/14 14:05, Nicolas Pitre wrote:
> > On Thu, 23 Oct 2014, Alexandre Belloni wrote:
> > 
> >> On 23/10/2014 at 13:56:44 -0400, Nicolas Pitre wrote :
> >>> On Thu, 23 Oct 2014, Bird, Tim wrote:
> >>> Why a trigger?  I'm suggesting no trigger at all is needed.
> >>>
> >>> Let all initcalls start initializing whenever they can.  Simply that 
> >>> they shouldn't prevent user space from running early.
> >>>
> >>> Because initcalls are running in parallel, then they must be using 
> >>> separate kernel threads.  It may be possible to adjust their priority so 
> >>> if one of them is actually using a lot of CPU cycles then it will run 
> >>> only when all the other threads (including user space) are no longer 
> >>> running.
> >>>
> >>
> >> You probably can't do that without introducing race conditions. A number
> >> of userspace libraries and script are actually expecting init and probe
> >> to be synchronous.
> > 
> > They already have to cope with the fact that most things can be 
> > available through not-yet-loaded modules, or may never be there at all. 
> > If not then they should be fixed.
> > 
> > And if you do rely on such a feature for your small embedded 
> > system then you won't have that many libs and scripts to fix.
> 
> There are userspace libraries distinguishing between init and probe?
> I.E. treating them as two separate things already?

Why not?

> So how were they accessing them as two separate things before this patch
> set?

Before engaging a conversation with a device, you verify if it exists 
first?

> >> I will refer to the async probe discussion and the
> >> following thread:
> >>
> >> http://thread.gmane.org/gmane.linux.kernel/1781529
> > 
> > I still don't think that is a good idea at all.  This async probe 
> > concept requires a trigger from user space and that opens many cans of 
> > worms as user space now has to be aware of specific kernel driver 
> > modules, their ordering dependencies, etc.
> > 
> > My point is simply not to defer any initialization at all.  This way you 
> > don't have to select which module or initcall to send a trigger for 
> > later on.
> 
> Why would this be hard?
> 
> for i in $(find /sys/module -name initstate)
> do
>   [ "$(cat $i)" != live ] && echo "kick" > $i
> done

You should have a look at /sys/bus/*/*probe then.  Maybe it does what 
you need already.

> And I'm confused that you're concerned about init order so your solution
> is to do nothing, thereby preserving the existing init order which could
> not _possibly_ be exposed verbatim to userspace...

The kernel already has the deferred probe mechanism to cope with the 
init ordering which, as experience has shown, may only be dealt with at 
run time.  All attempts to create that ordering statically in the past 
have failed.  So what do you want exposed verbatim to user space again?

> > Once again, what is the actual problem you want to solve?  If it is 
> > about making sure user space can execute ASAP then _that_ should be the 
> > topic, not figuring out how to implement a particular solution.
> > 
> >> Anyway, your userspace will have to have a way to know what has been
> >> initialized.
> > 
> > Hotplug notifications via dbus.
> 
> Wait, we need a _third_ mechanism for hotplug notifications now? (The
> /proc/sys/kernel/hotplug helper, netlink, and you want another one?)

No, I actually meant hotplug and netlink.  My bad.

> >> On my side, I was also using that mechanism to delay the network stack 
> >> init but I still want to know when my dhcp client can start for 
> >> example.
> > 
> > Ditto.  And not only do you want to know when the network stack is 
> > initialized, but you also need to wait for a link to be established 
> > before DHCP can work.
> 
> Um, doesn't the existing hotplug mechanism _already_ give us
> notification that eth0 and similar showed up? (Pretty sure I hit that
> while poking at mdev, although it was a while ago...)

Indeed it does. So no new user space notification mechanisms are needed 
which is my point.


Nicolas
