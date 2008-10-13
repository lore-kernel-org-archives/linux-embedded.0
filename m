From: "George G. Davis" <gdavis@mvista.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 13:21:24 -0400
Message-ID: <20081013172124.GF2556@mvista.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <200810130833.26399.thomas.cooksey@trolltech.com> <48F34386.8040205@billgatliff.com> <200810131645.32805.thomas.cooksey@trolltech.com> <48F364B0.2060407@st.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48F364B0.2060407@st.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel THOMPSON <daniel.thompson@st.com>
Cc: Tom Cooksey <thomas.cooksey@trolltech.com>, Bill Gatliff <bgat@billgatliff.com>, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded mailing list <linux-embedded@vger.kernel.org>

On Mon, Oct 13, 2008 at 04:09:36PM +0100, Daniel THOMPSON wrote:
> Tom Cooksey wrote:
> > Yup, I think that's what I'm going to end up having to do. Even if I can get
> > the physical address, I need some way to flush the CPU cache to RAM before I
> > ask the GPU to blit. I doubt there's any way to do that from userspace. :-( I'm
> > not even sure of the kernel API to do it. Any ideas?
> 
> MIPS has it: http://www.linux-mips.org/wiki/Cacheflush_Syscall
> and so does SH. I'm afraid I don't know about ARM though.

ARM also implements sys_cacheflush(start, end /* exclusive */, 0) but
does not provide separate methods for I or D cache as in the MIPS docs
above, ARM sys_cacheflush'es both I+D caches.

--
Regards,
George
> 
> -- 
> Daniel Thompson (STMicroelectronics) <daniel.thompson@st.com>
> 1000 Aztec West, Almondsbury, Bristol, BS32 4SQ. 01454 462659
> 
> If a car is a horseless carriage then is a motorcycle a horseless horse?
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
