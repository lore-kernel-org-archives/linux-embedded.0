From: "Bird, Tim" <Tim.Bird@sonymobile.com>
Subject: RE: Why is the deferred initcall patch not mainline?
Date: Tue, 21 Oct 2014 21:37:34 +0200
Message-ID: <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
References: <5441F592.6090807@gmail.com>
 <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
 <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>,<alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "tim.bird@am.sony.com" <tim.bird@am.sony.com>

I'm going to respond to several comments in this one message (sorry for the likely confusion)

On Tuesday, October 21, 2014 9:31 AM, Nicolas Pitre [nico@fluxnic.net] wrote:
>
> On Tue, 21 Oct 2014, Grant Likely wrote:
>
> > On Sat, Oct 18, 2014 at 9:11 AM, Bird, Tim <Tim.Bird@sonymobile.com> wrote:
>>> The answer is pretty easy, I think.  I tried to mainline it once but failed, and didn't really
>>> try again. If it is being found useful,  we should try to mainline it again,  this time with
>>> more persistence.  The reason it got rejected before IIRC was that you can accomplish
>>> a similar thing with modules, with no changes to the kernel. But that doesn't cover
>>> the case where the loadable modules feature of the kernel is turned off, which is
>>> common in very small systems.
> >
> > It is a rather clumsy approach though since it requires changes to
> > modules and it makes the configuration static per build. Could it
> > instead be done by the kernel accepting a list of initcalls that
> > should be deferred? It would depend I suppose on the cost of finding
> > the initcalls to defer at boot time.

Yeah, I'm not a big fan of having to change kernel code in order to
use the feature.  I am quite intrigued by Geert Uytterhoeven's idea
to add a 'D' option to the config system, so that the record of which
modules to defer could be stored there.  This is much better than
hand-altering code.  I don't know how difficult this would be to add
to the kbuild system, but the mechanism for altering the macro would
be, IMHO, very straightforward.

I should say that it's been quite some time since I worked on this,
so some of my recollections may be fuzzy.

With regards to doing it dynamically, I'd have to think about how
to do that.  Having text-based lists of things to do at runtime seems
to fit with how we're using device tree these days, but I'm not sure
how that would work.

The code as it stands now is quite simple, just creating a new linker section
to hold the list of deferred function pointers, re-using all existing
routines for processing such lists, doing a few code changes to handle 
actually deferring the initialization and memory free-ing, and finally
creating a /proc entry to trigger the whole thing. 

In a modern kernel, the /proc trigger should definitely be moved to
/sys.  Other than this, though, if you move to some other system of
processing the list, you will have to create new infrastructure for
working through the deferred module list, or make a change in the
way the items are handled in the generic init function pointer processing.
A simple solution would be to just compare each item from each ...initcall.init
section with a list of deferred functions, and not process them, until doing
the deferred init.

Note that the current technique uses the compiler and linker do some of
the work for list aggregation and processing, so that would have to be replaced
with something else if  you do it differently.

> >
> > I missed the session unfortunately, are there some measurements
> > available that I could look at? Which subsystems are typically the
> > problem?
>
> I, too, would like to know more about the problem.  Any pointers?

Here is the elinux wiki page with some historical measurements:
http://elinux.org/Deferred_Initcalls

The example on the wiki page defers 2 USB modules, and it
saved 530 milliseconds on an x86 system.

This is consistent with what we saw on cameras at Sony.
This patch predated Arjan Van de Ven's fastboot work.  I don't
know if some of his parallelization (asynchronous module loading), and
optimizations for USB loading made things substantially better than this.
The USB spec makes in impossible to avoid a certain amount of delay
in probing the USB busses

USB was the main culprit, but we sometimes deferred other modules, if they
were not in the fastpath for taking a picture. Sony cameras had a goal of
booting in .5 seconds, but I think the best we ever achieved was about 1.1
seconds, using deferred initcalls and a variety of other techniques.

 -- Tim
