From: Chris <chris@2net.co.uk>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 18:29:54 +0100
Message-ID: <48F38592.4030207@2net.co.uk>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <20081010191213.GC9852@pengutronix.de> <200810130833.26399.thomas.cooksey@trolltech.com>
Reply-To: chris@2net.co.uk
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
> On Friday 10 October 2008 21:12:13 Robert Schwebel wrote:
>> On Fri, Oct 10, 2008 at 06:15:05PM +0200, Tom Cooksey wrote:
>>> Is there any way to get the physical address of mlock()'d memory from
>>> userspace?
>> What do you want to do? I don't really see a reason to do such strange
>> things any more these days.
> 
> It's quite an annoying problem actually. Basically I have binary drivers for Imagination Technologies's PowerVR graphics drivers. We have tried very hard to get the source code for these drivers and have failed. Eventually ImgTec allowed us to sign an NDA to get the headers for one of their user-space libraries. This library allows us to direct the graphics hardware to render to a specific physical memory region. The problem is that there's no way to find out what the physical addresses are which we need pass to the graphics hardware (via the user-space library). Allthough the library allows us to allocate emory, what I want to do is then blit that memory in a different process. So a client process renders into an off-screen buffer and the server process blits that buffer to the framebuf
 fer. By allowing the server process to do the blit rather than the client process, we can get semi-transparent GL windows. 
> 
> The synchronisation we can do, it's the memory allocation I'm struggling with. If we ask the library to allocate the memory for us, we don't get the physical address to pass to the server process. Instead, we need to allocate memory ourselves and pass the physical address to the library. But like I say, I can't find a way to get the physical address from the kernel.
> 
> I realise getting round closed-source drivers isn't exactly encoraged, but sadly, we really have no choice. :-(
> 
> 
> 
> Cheers,
> 
> Tom
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Hi,

Could you reserve memory for the intermediate blit buffer at the end of 
system memory by passing a mem=xxx in the kernel command line and then 
use mmap /dev/mem to read it back? One advantage is that mmapping 
/dev/mem disables the processor cache on those pages (by calling
pgprot_noncached(), see drivers/char/mem.c).

Or, if you are going to write a small driver anyhoe, why not have it 
allocate memory using __get_free_pages and pass the physical address 
back via an ioctl or similar. Once again you can mmap /dev/mem to read 
the buffer from user space.

HTH,
Chris.

-- 
Chris Simmonds                   2net Limited
chris@2net.co.uk                 http://www.2net.co.uk/
