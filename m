From: Nicolas Pitre <nico@fluxnic.net>
Subject: RE: Why is the deferred initcall patch not mainline?
Date: Tue, 21 Oct 2014 15:58:04 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr>
References: <5441F592.6090807@gmail.com>
 <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
 <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
 <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "tim.bird@am.sony.com" <tim.bird@am.sony.com>

On Tue, 21 Oct 2014, Bird, Tim wrote:

> I'm going to respond to several comments in this one message (sorry for the likely confusion)
> 
> On Tuesday, October 21, 2014 9:31 AM, Nicolas Pitre [nico@fluxnic.net] wrote:
> >
> > On Tue, 21 Oct 2014, Grant Likely wrote:
> >
> > > On Sat, Oct 18, 2014 at 9:11 AM, Bird, Tim <Tim.Bird@sonymobile.com> wrote:
> >>> The answer is pretty easy, I think.  I tried to mainline it once but failed, and didn't really
> >>> try again. If it is being found useful,  we should try to mainline it again,  this time with
> >>> more persistence.  The reason it got rejected before IIRC was that you can accomplish
> >>> a similar thing with modules, with no changes to the kernel. But that doesn't cover
> >>> the case where the loadable modules feature of the kernel is turned off, which is
> >>> common in very small systems.
> > >
> > > It is a rather clumsy approach though since it requires changes to
> > > modules and it makes the configuration static per build. Could it
> > > instead be done by the kernel accepting a list of initcalls that
> > > should be deferred? It would depend I suppose on the cost of finding
> > > the initcalls to defer at boot time.
> 
> Yeah, I'm not a big fan of having to change kernel code in order to
> use the feature.  I am quite intrigued by Geert Uytterhoeven's idea
> to add a 'D' option to the config system, so that the record of which
> modules to defer could be stored there.  This is much better than
> hand-altering code.  I don't know how difficult this would be to add
> to the kbuild system, but the mechanism for altering the macro would
> be, IMHO, very straightforward.

Straight forward but IMHO rather suboptimal. Sure it might be good 
enough if all you want is to ship products out the door, but for 
mainline something better should be done.

> This patch predated Arjan Van de Ven's fastboot work.  I don't
> know if some of his parallelization (asynchronous module loading), and
> optimizations for USB loading made things substantially better than this.
> The USB spec makes in impossible to avoid a certain amount of delay
> in probing the USB busses
> 
> USB was the main culprit, but we sometimes deferred other modules, if they
> were not in the fastpath for taking a picture. Sony cameras had a goal of
> booting in .5 seconds, but I think the best we ever achieved was about 1.1
> seconds, using deferred initcalls and a variety of other techniques.

Some initcalls can be executed in parallel, but they currently all have 
to complete before user space is started.  It should be possible to 
still do the parallel initcall thing, and let user space run before they 
are done as well.  Only waiting for the root fs to be available should 
be sufficient.  That would be completely generic, and help embedded as 
well as desktop systems.


Nicolas
