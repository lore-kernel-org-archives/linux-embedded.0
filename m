From: Tom Cooksey <thomas.cooksey@trolltech.com>
Subject: Getting physical addresses of mmap'd pages from userspace
Date: Fri, 10 Oct 2008 18:15:05 +0200
Message-ID: <200810101815.06249.thomas.cooksey@trolltech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded mailing list <linux-embedded@vger.kernel.org>

Is there any way to get the physical address of mlock()'d memory from userspace?

I want to avoid writing a kernel module to do it if possible, but I can't see any API which will give me the address? I'm not sure if doing mlock() will even pin the physical address (although I can't see why the physical location would change other than when the page is swapped out and back in again). Is there a syscall I've overlooked somewhere?

The only way I can see to do it would be to pass a kernel parameter in uBoot and tell the kernel not to use e.g. the top 2MB of physical memory. I think I could then mmap /dev/mem to access the physical memory from my application, but pass the physical address to my device which reads from the memory my application has written. Does anyone think this would work?


Cheers,

Tom
