From: Gilad Ben-Yossef <gilad@codefidence.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 11:37:09 +0200
Message-ID: <48F316C5.1070905@codefidence.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <20081010191213.GC9852@pengutronix.de> <200810130833.26399.thomas.cooksey@trolltech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200810130833.26399.thomas.cooksey@trolltech.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Cooksey <thomas.cooksey@trolltech.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded mailing list <linux-embedded@vger.kernel.org>

Tom Cooksey wrote:

> ...
>  This library allows us to direct the graphics hardware to render to a specific physical memory region. The problem is that there's no way to find out what the physical addresses are which we need pass to the graphics hardware (via the user-space library). Allthough the library allows us to allocate emory, what I want to do is then blit that memory in a different process. So a client process renders into an off-screen buffer and the server process blits that buffer to the framebuffer. By allowing the server process to do the blit rather than the client process, we can get semi-transparent GL windows. 
>
> The synchronisation we can do, it's the memory allocation I'm struggling with. If we ask the library to allocate the memory for us, we don't get the physical address to pass to the server process. Instead, we need to allocate memory ourselves and pass the physical address to the library. But like I say, I can't find a way to get the physical address from the kernel.
>
>   
You lost me on why you can't have the library allocate the memory - I 
understand the library needs the physical address to render into, but 
why does your server needs the physical address to blit to the frame 
buffer? I assume it access the frame buffer in host memory so needs the 
virtual address, not the physical one...

Anyways, ignoring that, it's pretty trivial to write  a character driver 
with an IOCTL that will get an mlocked virtual address of the processes, 
call virt_to_phys on it and return the result. Yes, it's an ugly as hell 
solution, but then again so is the problem (proprietary libraries etc.)

You do realize that the mlocked memory isn't contiguous in physical 
memory, right? unless your graphics engine has something like AGP GART 
or an IOMMU I think you might find that problematic.

Gilad


-- 
Gilad Ben-Yossef 
Chief Coffee Drinker

Codefidence Ltd.
The code is free, your time isn't.(TM)

Web:    http://codefidence.com
Email:  gilad@codefidence.com
Office: +972-8-9316883 ext. 201
Fax:    +972-8-9316885
Mobile: +972-52-8260388

	The Doctor: Don't worry, Reinette, just a nightmare. 
	Everyone has nightmares. Even monsters from under the 
	bed have nightmares, don't you, monster?
	Reinette: What do monsters have nightmares about?
	The Doctor: Me! 
