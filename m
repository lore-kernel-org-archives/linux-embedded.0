From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 09:00:17 +0200
Message-ID: <20081013070017.GH9852@pengutronix.de>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <20081010191213.GC9852@pengutronix.de> <200810130833.26399.thomas.cooksey@trolltech.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200810130833.26399.thomas.cooksey@trolltech.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Cooksey <thomas.cooksey@trolltech.com>
Cc: linux-embedded mailing list <linux-embedded@vger.kernel.org>, Denis Olvier Kropp <dok@pengutronix.de>

Tom,

[Please configure your mail client to break likes @ column < 80]

On Mon, Oct 13, 2008 at 08:33:25AM +0200, Tom Cooksey wrote:
> On Friday 10 October 2008 21:12:13 Robert Schwebel wrote:
> > On Fri, Oct 10, 2008 at 06:15:05PM +0200, Tom Cooksey wrote:
> > > Is there any way to get the physical address of mlock()'d memory
> > > from userspace?
> >
> > What do you want to do? I don't really see a reason to do such
> > strange things any more these days.
>
> It's quite an annoying problem actually. Basically I have binary
> drivers for Imagination Technologies's PowerVR graphics drivers. We
> have tried very hard to get the source code for these drivers and have
> failed. Eventually ImgTec allowed us to sign an NDA to get the headers
> for one of their user-space libraries. This library allows us to
> direct the graphics hardware to render to a specific physical memory
> region. The problem is that there's no way to find out what the
> physical addresses are which we need pass to the graphics hardware
> (via the user-space library). Allthough the library allows us to
> allocate emory, what I want to do is then blit that memory in a
> different process. So a client process renders into an off-screen
> buffer and the server process blits that buffer to the framebuffer. By
> allowing the server process to do the blit rather than the client
> process, we can get semi-transparent GL windows.
>
> The synchronisation we can do, it's the memory allocation I'm
> struggling with. If we ask the library to allocate the memory for us,
> we don't get the physical address to pass to the server process.
> Instead, we need to allocate memory ourselves and pass the physical
> address to the library. But like I say, I can't find a way to get the
> physical address from the kernel.
>
> I realise getting round closed-source drivers isn't exactly encoraged,
> but sadly, we really have no choice. :-(

We are working on DirectFB [1] support for the PowerVR MBX & SGX chips
these days, so I know the problem :) Our hardware platform is i.MX31
with the MBX, MPC5121e also with MBX (both freescale) and a TI OMAP with
the SGX. The whole NDA and Licensing situation is annoying, but we have
to live with it; if you ask me as a community person, I'd say "vote with
your dollars". If manufacturers don't want to open their specs to allow
people writing driver, it must mean that they don't want to sell chips.
In reality, there are no real alternatives for accelerates chips.

Regarding the technical question, dok might have an idea. He's currently
working on DirectFB drivers ontop of the proprietary drivers in one of
our projects. Cc'ed him.

rsc

[1] Sidenote: we have Gtk+ and TTFNAQ [2] running on top of DirectFB,
    with 2D acceleration.

[2] The-Toolkit-Formerly-Known-As-Qtopia
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
