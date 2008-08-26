From: Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
	bisected
Date: Tue, 26 Aug 2008 23:59:16 +0300
Message-ID: <20080826205916.GB11734@cs181140183.pp.htv.fi>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik> <48B313E0.1000501@hp.com> <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org> <200808261111.19205.rusty@rustcorp.com.au> <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org> <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0808261144510.3363-nfNrOhbfy2R17+2ddN/4kux8cNe9sq/dYPYVAmT7z5s@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Aug 26, 2008 at 11:47:01AM -0700, Linus Torvalds wrote:
> 
> 
> On Tue, 26 Aug 2008, Adrian Bunk wrote:
> > 
> > I added "-fno-inline-functions-called-once -fno-early-inlining" to 
> > KBUILD_CFLAGS, and (with gcc 4.3) that increased the size of my kernel 
> > image by 2%.
> 
> Btw, did you check with just "-fno-inline-functions-called-once"?
> 
> The -fearly-inlining decisions _should_ be mostly right. If gcc sees early 
> that a function is so small (even without any constant propagation etc) 
> that it can be inlined, it's probably right. 
> 
> The inline-functions-called-once thing is what causes even big functions 
> to be inlined, and that's where you find the big downsides too (eg the 
> stack usage).

-fno-inline-functions-called-once alone costs me nearly 1% in code size.

And I'd expect it to become more with "-fwhole-program --combine".


If you think we have too many stacksize problems I'd suggest to consider 
removing the choice of 4k stacks on i386, sh and m68knommu instead of 
using -fno-inline-functions-called-once:

Now that 32bit x86 is no longer used for extreme highend configurations 
the only serious usecase for 4k stacks are AFAIK space savings on 
embedded archs.

4k stacks have caused us much pain [1], and the cases where gcc inlined 
too much were the easy ones.

I'm not saying that I'd like removing the choice of 4k stacks, but if we 
want to reduce the number of stack related problems that's IMHO the 
better alternative.


> 			Linus

cu
Adrian

[1] AFAIR some callpaths in the kernel are still too big

BTW: In case anyone wonders about why I suggest removing 4k stacks:
     My position is that 4k stacks should either be enabled 
     unconditionally or no longer offered at all.
     And if we remove 4k stacks from 32bit x86 it's no longer 
     realistically maintainable for other architectures.

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
