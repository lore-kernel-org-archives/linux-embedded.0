From: Tom Cooksey <thomas.cooksey@trolltech.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 09:20:28 +0200
Message-ID: <200810130920.28208.thomas.cooksey@trolltech.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <200810130833.26399.thomas.cooksey@trolltech.com> <20081013070017.GH9852@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081013070017.GH9852@pengutronix.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux-embedded mailing list <linux-embedded@vger.kernel.org>, Denis Olvier Kropp <dok@pengutronix.de>

On Monday 13 October 2008 09:00:17 Robert Schwebel wrote:
> Tom,
> 
> [Please configure your mail client to break likes @ column < 80]
Whoops - Sorry!

> On Mon, Oct 13, 2008 at 08:33:25AM +0200, Tom Cooksey wrote:
> > On Friday 10 October 2008 21:12:13 Robert Schwebel wrote:
> > > On Fri, Oct 10, 2008 at 06:15:05PM +0200, Tom Cooksey wrote:
> > > > Is there any way to get the physical address of mlock()'d memory
> > > > from userspace?
> > >
> > > What do you want to do? I don't really see a reason to do such
> > > strange things any more these days.
> >
> > It's quite an annoying problem actually. Basically I have binary
> > drivers for Imagination Technologies's PowerVR graphics drivers. We
> > have tried very hard to get the source code for these drivers and have
> > failed. Eventually ImgTec allowed us to sign an NDA to get the headers
> > for one of their user-space libraries. This library allows us to
> > direct the graphics hardware to render to a specific physical memory
> > region. The problem is that there's no way to find out what the
> > physical addresses are which we need pass to the graphics hardware
> > (via the user-space library). Allthough the library allows us to
> > allocate emory, what I want to do is then blit that memory in a
> > different process. So a client process renders into an off-screen
> > buffer and the server process blits that buffer to the framebuffer. By
> > allowing the server process to do the blit rather than the client
> > process, we can get semi-transparent GL windows.
> >
> > The synchronisation we can do, it's the memory allocation I'm
> > struggling with. If we ask the library to allocate the memory for us,
> > we don't get the physical address to pass to the server process.
> > Instead, we need to allocate memory ourselves and pass the physical
> > address to the library. But like I say, I can't find a way to get the
> > physical address from the kernel.
> >
> > I realise getting round closed-source drivers isn't exactly encoraged,
> > but sadly, we really have no choice. :-(
> 
> We are working on DirectFB [1] support for the PowerVR MBX & SGX chips
> these days, so I know the problem :) Our hardware platform is i.MX31
> with the MBX, MPC5121e also with MBX (both freescale) and a TI OMAP with
> the SGX. The whole NDA and Licensing situation is annoying, but we have
> to live with it; if you ask me as a community person, I'd say "vote with
> your dollars". If manufacturers don't want to open their specs to allow
> people writing driver, it must mean that they don't want to sell chips.
> In reality, there are no real alternatives for accelerates chips.

ImgTec has had the market pretty much to itself for a long time and as you say,
there's pretty much no alternatives for the moment. Hopefully that is about to
change as there are, I beleive, about 3 other companies with competing products
about to come to market. I've no idea if the other companies will open up their
drivers either though. It also doesn't help the current situation. :-(

> Regarding the technical question, dok might have an idea. He's currently
> working on DirectFB drivers ontop of the proprietary drivers in one of
> our projects. Cc'ed him.

> [1] Sidenote: we have Gtk+ and TTFNAQ [2] running on top of DirectFB,
>     with 2D acceleration.
> 
> [2] The-Toolkit-Formerly-Known-As-Qtopia

Gulp - yeah, I'm kinda the maintainer for the Qt/Embedded DirectFB driver now.
(Since the guy who wrote it left a month ago) :-|



Cheers,

Tom

