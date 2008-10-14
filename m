From: Tom Cooksey <thomas.cooksey@trolltech.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Tue, 14 Oct 2008 08:46:11 +0200
Message-ID: <200810140846.11121.thomas.cooksey@trolltech.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <200810130833.26399.thomas.cooksey@trolltech.com> <48F38592.4030207@2net.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48F38592.4030207@2net.co.uk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded mailing list <linux-embedded@vger.kernel.org>

On Monday 13 October 2008 19:29:54 Chris wrote:
> Could you reserve memory for the intermediate blit buffer at the end of 
> system memory by passing a mem=xxx in the kernel command line and then 
> use mmap /dev/mem to read it back? One advantage is that mmapping 
> /dev/mem disables the processor cache on those pages (by calling
> pgprot_noncached(), see drivers/char/mem.c).

I'm not sure if disabling the processor cache completely is what I want to do.
Although if I think about it, I doubt I'll end up using our software rasterizer
too much. In which case, I guess it's only the GPU which will ever be rendering
so the cache problem goes away.

I think I might try a little test application and see if I can get away with
the mem= trick. It's just feels a shame to "reserve" memory & potentially not
use it when it's such a precious resource. I guess it's that or write a kernel
module.


Thanks for everyone's help.



Cheers,

Tom
