From: "Bird, Tim" <Tim.Bird@sonymobile.com>
Subject: RE: Why is the deferred initcall patch not mainline?
Date: Thu, 23 Oct 2014 19:21:56 +0200
Message-ID: <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net>
References: <5441F592.6090807@gmail.com>
 <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
 <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
 <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr>
 <5447C7BE.60506@landley.net>,<alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>, Rob Landley <rob@landley.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "challinan@gmail.com" <challinan@gmail.com>

On Wednesday, October 22, 2014 8:49 AM, Nicolas Pitre [nico@fluxnic.net] wrote:
> On Wed, 22 Oct 2014, Rob Landley wrote:
> > On 10/21/14 14:58, Nicolas Pitre wrote:
> > > On Tue, 21 Oct 2014, Bird, Tim wrote:
> > >
> > >> I'm going to respond to several comments in this one message (sorry for the likely confusion)
> > >>
> > >> On Tuesday, October 21, 2014 9:31 AM, Nicolas Pitre [nico@fluxnic.net] wrote:
> > >>>
> > >>> On Tue, 21 Oct 2014, Grant Likely wrote:
> > >>>
> > >>>> On Sat, Oct 18, 2014 at 9:11 AM, Bird, Tim <Tim.Bird@sonymobile.com> wrote:
> > >>>>> The answer is pretty easy, I think.  I tried to mainline it once but failed, and didn't really
> > >>>>> try again. If it is being found useful,  we should try to mainline it again,  this time with
> > >>>>> more persistence.  The reason it got rejected before IIRC was that you can accomplish
> > >>>>> a similar thing with modules, with no changes to the kernel. But that doesn't cover
> > >>>>> the case where the loadable modules feature of the kernel is turned off, which is
> > >>>>> common in very small systems.
> > >>>>
> > >>>> It is a rather clumsy approach though since it requires changes to
> > >>>> modules and it makes the configuration static per build. Could it
> > >>>> instead be done by the kernel accepting a list of initcalls that
> > >>>> should be deferred? It would depend I suppose on the cost of finding
> > >>>> the initcalls to defer at boot time.
> > >>
> > >> Yeah, I'm not a big fan of having to change kernel code in order to
> > >> use the feature.  I am quite intrigued by Geert Uytterhoeven's idea
> > >> to add a 'D' option to the config system, so that the record of which
> > >> modules to defer could be stored there.  This is much better than
> > >> hand-altering code.  I don't know how difficult this would be to add
> > >> to the kbuild system, but the mechanism for altering the macro would
> > >> be, IMHO, very straightforward.
> > >
> > > Straight forward but IMHO rather suboptimal. Sure it might be good
> > > enough if all you want is to ship products out the door, but for
> > > mainline something better should be done.
> > >
> > >> This patch predated Arjan Van de Ven's fastboot work.  I don't
> > >> know if some of his parallelization (asynchronous module loading), and
> > >> optimizations for USB loading made things substantially better than this.
> > >> The USB spec makes in impossible to avoid a certain amount of delay
> > >> in probing the USB busses
> > >>
> > >> USB was the main culprit, but we sometimes deferred other modules, if they
> > >> were not in the fastpath for taking a picture. Sony cameras had a goal of
> > >> booting in .5 seconds, but I think the best we ever achieved was about 1.1
> > >> seconds, using deferred initcalls and a variety of other techniques.
> > >
> > > Some initcalls can be executed in parallel, but they currently all have
> > > to complete before user space is started.  It should be possible to
> > > still do the parallel initcall thing, and let user space run before they
> > > are done as well.  Only waiting for the root fs to be available should
> > > be sufficient.  That would be completely generic, and help embedded as
> > > well as desktop systems.
> >
> > What would actually be nice is if initramfs could read something out of
> > /proc or /sys to check the status of initcalls. (Or maybe get
> > notification through the hotplug netlink mechanism.)
> >
> > Since initramfs is _already_ up really early, before needing any
> > particular drivers and way before the real root filesystem, we can
> > trivially punt this sort of synchronization to userspace if userspace
> > can just get the information about when kernel deferred processing is done.
> >
> > Possibly we already have this: /sys/module has directories for all the
> > kernel modules including the ones built static, so possibly userspace
> > can just wait for "/sys/module/zlib_delfate/initstate" to say "live". It
> > would just be nice to have a way to notice that's happened without
> > spinning reading a file.
>
> Again, not generic enough. Instead, the reading of that file could be
> suspended by the kernel until all initcalls have completed and then
> return an appropriate error code if the corresponding resource is
> actually not there.
>
> Otherwise the standard hotplug notification mechanism is already
> available.

I'm not sure why this attention to reading the status.  The salient feature
here is that the initializations are deferred until user space tells the kernel
to proceed.  It's the initiation of the trigger from user-space that matters.
The whole purpose of this feature is to defer some driver initializations until
the product can get into a state where it is already ready to perform it's primary
function.  Only user space knows when that is.

There seems to be a desire to have an automatic mechanism for triggering
the deferred initializations.  I'm OK with this, as long as there's some reasonable
use case for it.  There are lots of possible trigger mechanisms, including just
a simple timer, but I think it's important that the primary use case of 
'trigger-when-user-space-says-to' is still supported.

This code is really intended for a very specialized kernel configuration, where all
the modules are statically linked, and indeed module loading itself is turned off. 
I think that's a minority of Linux deployments out there.  This configuration
implies some other attributes, like configuration for very small size and/or very
fast boot, where KALLSYMS may not be present, and other kernel features may
not be available as well.  Indeed, in the smallest systems /proc or /sys may not
be there, so an alternative (maybe a sysctl or even a new syscall) might be
appropriate. 

Quite frankly, the hacky way this is often done is to make stuff like this a
one-time side effect of a rarely called syscall (like sync).  Please note I'm not
recommending this for mainline, just pointing out there are interesting ways
that embedded developers just make the existing code work for their weird
cases.

Maybe there are some use cases for doing deferred initializations, particularly
automatically, for systems that do have modules turned on (i.e. for modules
that are, in that case, still statically linked to the kernel for whatever reason).
I would welcome some discussion of these, to select an appropriate trigger
mechanism for those cases.  But we should not let the primary purpose of this
feature get lost in that discussion.
  -- Tim