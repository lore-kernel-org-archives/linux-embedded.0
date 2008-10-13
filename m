From: Daniel THOMPSON <daniel.thompson@st.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 16:09:36 +0100
Message-ID: <48F364B0.2060407@st.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <200810130833.26399.thomas.cooksey@trolltech.com> <48F34386.8040205@billgatliff.com> <200810131645.32805.thomas.cooksey@trolltech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200810131645.32805.thomas.cooksey@trolltech.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Cooksey <thomas.cooksey@trolltech.com>
Cc: Bill Gatliff <bgat@billgatliff.com>, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded mailing list <linux-embedded@vger.kernel.org>

Tom Cooksey wrote:
> Yup, I think that's what I'm going to end up having to do. Even if I can get
> the physical address, I need some way to flush the CPU cache to RAM before I
> ask the GPU to blit. I doubt there's any way to do that from userspace. :-( I'm
> not even sure of the kernel API to do it. Any ideas?

MIPS has it: http://www.linux-mips.org/wiki/Cacheflush_Syscall
and so does SH. I'm afraid I don't know about ARM though.

-- 
Daniel Thompson (STMicroelectronics) <daniel.thompson@st.com>
1000 Aztec West, Almondsbury, Bristol, BS32 4SQ. 01454 462659

If a car is a horseless carriage then is a motorcycle a horseless horse?
