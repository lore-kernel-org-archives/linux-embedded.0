From: Daniel J Laird <daniel.j.laird@nxp.com>
Subject: RE: Getting physical addresses of mmap'd pages from userspace
Date: Tue, 14 Oct 2008 09:31:51 +0200
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F13B1B2F0AB@EU1RDCRDC1WX029.exi.nxp.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com>
 <20081010191213.GC9852@pengutronix.de>
 <200810130833.26399.thomas.cooksey@trolltech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200810130833.26399.thomas.cooksey@trolltech.com>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Tom Cooksey <thomas.cooksey@trolltech.com>, Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux-embedded mailing list <linux-embedded@vger.kernel.org>

We have a 2D chip on board with our silicon.
It too had a driver in kernel space and a queue in user space that allowed us to post jobs to it like Blit/Fill etc.

We run DirectFB on the platform and we too needed to get Physical addresses etc.

In the end what we did was use Linux FB device to allocate our memory.

We allocate more than we need in the FB device when it is created.
The Double buffered FB comes first and what is left over we use as scratch memory.
This allows us to create surfaces etc in this 'scratch' memory.
When we need the physical address we use the offset from FB base in virtual memory (user space) and add that the physical base address of FB device.
This then allows us to post the job to the 2D hardware.

This approach has worked on 2 different chips now.  Maybe this might help for you?
Daniel Laird

-----Original Message-----
From: linux-embedded-owner@vger.kernel.org [mailto:linux-embedded-owner@vger.kernel.org] On Behalf Of Tom Cooksey
Sent: 2008 Oct 13 07:33
To: Robert Schwebel
Cc: linux-embedded mailing list
Subject: Re: Getting physical addresses of mmap'd pages from userspace

On Friday 10 October 2008 21:12:13 Robert Schwebel wrote:
> On Fri, Oct 10, 2008 at 06:15:05PM +0200, Tom Cooksey wrote:
> > Is there any way to get the physical address of mlock()'d memory from
> > userspace?
>
> What do you want to do? I don't really see a reason to do such strange
> things any more these days.

It's quite an annoying problem actually. Basically I have binary drivers for Imagination Technologies's PowerVR graphics drivers. We have tried very hard to get the source code for these drivers and have failed. Eventually ImgTec allowed us to sign an NDA to get the headers for one of their user-space libraries. This library allows us to direct the graphics hardware to render to a specific physical memory region. The problem is that there's no way to find out what the physical addresses are which we need pass to the graphics hardware (via the user-space library). Allthough the library allows us to allocate emory, what I want to do is then blit that memory in a different process. So a client process renders into an off-screen buffer and the server process blits that buffer to the framebuffe
 r. By allowing the server process to do the blit rather than the client process, we can get semi-transparent GL windows.

The synchronisation we can do, it's the memory allocation I'm struggling with. If we ask the library to allocate the memory for us, we don't get the physical address to pass to the server process. Instead, we need to allocate memory ourselves and pass the physical address to the library. But like I say, I can't find a way to get the physical address from the kernel.

I realise getting round closed-source drivers isn't exactly encoraged, but sadly, we really have no choice. :-(



Cheers,

Tom
