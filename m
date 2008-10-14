From: Tom Cooksey <thomas.cooksey@trolltech.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Tue, 14 Oct 2008 11:03:06 +0200
Message-ID: <200810141103.06994.thomas.cooksey@trolltech.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <200810130833.26399.thomas.cooksey@trolltech.com> <C13DBBE85AD6974B85C118C35890CA5F13B1B2F0AB@EU1RDCRDC1WX029.exi.nxp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F13B1B2F0AB@EU1RDCRDC1WX029.exi.nxp.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel J Laird <daniel.j.laird@nxp.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded mailing list <linux-embedded@vger.kernel.org>

On Tuesday 14 October 2008 09:31:51 Daniel J Laird wrote:
> We have a 2D chip on board with our silicon.
> It too had a driver in kernel space and a queue in user space that allowed us to post jobs to it like Blit/Fill etc.
> 
> We run DirectFB on the platform and we too needed to get Physical addresses etc.
> 
> In the end what we did was use Linux FB device to allocate our memory.
> 
> We allocate more than we need in the FB device when it is created.
> The Double buffered FB comes first and what is left over we use as scratch memory.
> This allows us to create surfaces etc in this 'scratch' memory.
> When we need the physical address we use the offset from FB base in virtual memory (user space) and add that the physical base address of FB device.
> This then allows us to post the job to the 2D hardware.
> 
> This approach has worked on 2 different chips now.  Maybe this might help for you?

This is something I hadn't concidered - I'd forgotton that fbdev lets you query
the physical address of the framebuffer. I'm not sure it's possible to ask the
framebuffer device to use more memory however. The amount of memory is returned
in the fb_fix_screeninfo struct. I guess you must have implemented your own 
fbdev driver?

On a side note, I'm also tracking the DRM discussions on an in-kernel memory
manager for graphics. It seems a lot of what I'm trying to do is exactly what
the new memory manager is supposed to do. It sounds like this is also what you
needed? I'm asking because the DRM+GEM+modesetting API looks like a good API
for basic hardware as well as the more advanced desktop hardware it's intended
for. It would be really good if one day kernel graphics APIs could be unified.


Cheers,

Tom
