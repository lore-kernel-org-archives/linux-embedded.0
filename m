From: Tom Cooksey <thomas.cooksey@trolltech.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 16:45:31 +0200
Message-ID: <200810131645.32805.thomas.cooksey@trolltech.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <200810130833.26399.thomas.cooksey@trolltech.com> <48F34386.8040205@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48F34386.8040205@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded mailing list <linux-embedded@vger.kernel.org>

On Monday 13 October 2008 14:48:06 Bill Gatliff wrote:
> Tom Cooksey wrote:
> > On Friday 10 October 2008 21:12:13 Robert Schwebel wrote:
> >> On Fri, Oct 10, 2008 at 06:15:05PM +0200, Tom Cooksey wrote:
> >>> Is there any way to get the physical address of mlock()'d memory from
> >>> userspace?
> >> What do you want to do? I don't really see a reason to do such strange
> >> things any more these days.
> > 
> > It's quite an annoying problem actually. Basically I have binary drivers for Imagination Technologies's PowerVR graphics drivers. We have tried very hard to get the source code for these drivers and have failed. Eventually ImgTec allowed us to sign an NDA to get the headers for one of their user-space libraries. This library allows us to direct the graphics hardware to render to a specific physical memory region. The problem is that there's no way to find out what the physical addresses are which we need pass to the graphics hardware (via the user-space library). Allthough the library allows us to allocate emory, what I want to do is then blit that memory in a different process. So a client process renders into an off-screen buffer and the server process blits that buffer to the frameb
 uffer. By allowing the server process to do the blit rather than the client process, we can get semi-transparent GL windows. 
> > 
> > The synchronisation we can do, it's the memory allocation I'm struggling with. If we ask the library to allocate the memory for us, we don't get the physical address to pass to the server process. Instead, we need to allocate memory ourselves and pass the physical address to the library. But like I say, I can't find a way to get the physical address from the kernel.
> > 
> > I realise getting round closed-source drivers isn't exactly encoraged, but sadly, we really have no choice. :-(
> 
> Not that this would help, but what if the blitting process was working with a
> shared memory area with the, er, main process?  Could the allocation be done in
> the library, then?
> 
> Reading your post carefully, it sounds like either the library in question is
> designed to run in kernel space (where you can get the physical address), isn't
> a Linux library, or there's some more code somewhere that can do the address
> translation--- you said that "This library allows us to direct the graphics
> hardware to render to a specific physical memory region".  How are other users
> of the library getting the parameters that the library needs?

The other user is more closed source OpenGL library code. The problem is that
the drivers are designed to blit from the client process, where the library
does the allocation & the blits (which means opaque-only blits). If we want
transparent windows or fancy window composition effects we have to blit from a
central server process and have clients render into off-screen buffers.

Also, you're right - The library seems to not be Linux-specific but targeted at
other OSes (Which ones I can't say without breaking the NDA I had to sign!).

> What about writing a hacky little module that just does virtual-to-physical
> translation, and returns the result?
> 
> Ugh, I think I need to shower.  :)

Yup, I think that's what I'm going to end up having to do. Even if I can get
the physical address, I need some way to flush the CPU cache to RAM before I
ask the GPU to blit. I doubt there's any way to do that from userspace. :-( I'm
not even sure of the kernel API to do it. Any ideas?


Cheers,

Tom
