From: Tom Cooksey <thomas.cooksey@trolltech.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 11:38:38 +0200
Message-ID: <200810131138.40092.thomas.cooksey@trolltech.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <200810130833.26399.thomas.cooksey@trolltech.com> <48F31155.6090603@codefidence.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48F31155.6090603@codefidence.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilad Ben-Yossef <gilad@codefidence.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded mailing list <linux-embedded@vger.kernel.org>

On Monday 13 October 2008 11:13:57 Gilad Ben-Yossef wrote:
> Tom Cooksey wrote:
> 
> 
> > This library allows us to direct the graphics hardware to render to a specific physical memory region. The problem is that there's no way to find out what the physical addresses are which we need pass to the graphics hardware (via the user-space library). Allthough the library allows us to allocate emory, what I want to do is then blit that memory in a different process. So a client process renders into an off-screen buffer and the server process blits that buffer to the framebuffer. By allowing the server process to do the blit rather than the client process, we can get semi-transparent GL windows. 
> >
> > The synchronisation we can do, it's the memory allocation I'm struggling with. If we ask the library to allocate the memory for us, we don't get the physical address to pass to the server process. Instead, we need to allocate memory ourselves and pass the physical address to the library. But like I say, I can't find a way to get the physical address from the kernel.
> >
> >   
> You lost me on why you can't have the library allocate the memory - I 
> understand the library needs the physical address to render into, but 
> why does your server needs the physical address to blit to the frame 
> buffer? I assume it access the frame buffer in host memory so needs the 
> virtual address, not the physical one...

The reason is that the hardware blitter is exposed via the user-space library,
but because the blit is done by hardware, it too needs the physical address of
both the source and the destination of the blit. The destination is easy - the
library provides an API to get the address of the framebuffer. It's the source
that's the problem.

> Anyways, ignoring that, it's pretty trivial to write  a character driver 
> with an IOCTL that will get an mlocked virtual address of the processes, 
> call virt_to_phys on it and return the result. Yes, it's an ugly as hell 
> solution, but then again so is the problem (proprietary libraries etc.)

I realise this is possible, but I'm trying to find a solution which doesn't
require me to write a kernel driver. If I can't find a solution, I will follow
your suggestion of using virt_to_phys - thanks!

> You do realize do that the mlocked memory isn't contiguous in physical 
> memory, right? unless your graphics engine has something like AGP GART 
> or an IOMMU I think you might find that problematic.

I had assumed that. Fortunatly the user-space library's API takes an array of
physical page addresses. The hardware actually has it's own MMU (I guess
that's an IOMMU?) with enough entries to address quite a lot of memory. I'm
assuming the library programs the GPU's MMU with the addresses I pass in.

I also think that I need to be careful with caching. The CPU (OMAP3) has both
an L1 and L2 cache. I doubt there's any cache coherency logic in the hardware
to make sure the CPU's cache is flushed before the GPU startsreading from it.

The last thing I need is to write to the memory I want to blit (using a 
software renderer running on the CPU), only to find the data I've written is
sitting around in the CPU cache and has not been flushed to RAM (in which case
I'll get garbage on the screen).

I guess I'm going to need a way to not only get the physical address of the
pages, but also set the cache policy or (ideally) have a way to flush the pages
to RAM.



Cheers,

Tom

