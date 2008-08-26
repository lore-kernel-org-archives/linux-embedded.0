From: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
	bisected
Date: Tue, 26 Aug 2008 23:21:34 +0300
Message-ID: <20080826202134.GA11734@cs181140183.pp.htv.fi>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik> <48B313E0.1000501@hp.com> <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org> <200808261111.19205.rusty@rustcorp.com.au> <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org> <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261134530.3363@nehalem.linux-foundation.org>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0808261134530.3363-nfNrOhbfy2R17+2ddN/4kux8cNe9sq/dYPYVAmT7z5s@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Aug 26, 2008 at 11:40:10AM -0700, Linus Torvalds wrote:
> 
> 
> On Tue, 26 Aug 2008, Adrian Bunk wrote:
> > 
> > A debugging option (for better traces) to disallow gcc some inlining 
> > might make sense (and might even make sense for distributions to 
> > enable in their kernels), but when you go to use cases that require
> > really small kernels the cost is too high.
> 
> You ignore the fact that it's really not just about debugging.

I had in mind that we anyway have to support it for tiny kernels.

I simply don't see that we add kconfig options for 5kB of code for
tiny kernels but remove something like this that can cause size
increases > 1%.

> Inlining really isn't the great tool some people think it is. Especially 
> not since gcc stack allocation is so horrid that it won't re-use stack 
> slots etc (which I don't disagree with per se - it's _hard_ to re-use 
> stack slots while still allowing code scheduling).

gcc's stack allocation has become better
(that's why we disable unit-at-a-time only for gcc 3.4 on i386).

> NOTE! I also would never claim that _our_ choices of "inline" are all that 
> great, and we've often inlined too much or not inlined things that really 
> could be inlined. But at least when a developer says "inline" (or forgets 
> to say it), we have somebody to blame. When the compiler does insane 
> things that doesn't suit us, we're just screwed.

Most LOCs of the kernel are not written by people like you or Al Viro or 
David Miller, and the average kernel developer is unlikely to do it as 
good as gcc.

For the average driver the choice is realistically between
"inline's randomly sprinkled across the driver" and
"no inline's, leave it to gcc".

And code evolves during the years from tiny with 1 caller to huge with 
many callers.

BTW:
I just ran checkstack on a (roughly) allyesconfig kernel, and we have a 
new driver that allocates "unsigned char recvbuf[1500];" on the stack...

> > But if you don't trust gcc's inlining you should revert
> > commit 3f9b5cc018566ad9562df0648395649aebdbc5e0 that increases gcc's 
> > freedom regarding what to inline in 2.6.27
> 
> Actually, that just allows gcc to _not_ inline. Which is probably ok.
> 
> (Well, it would be ok if gcc did it well enough, it obviously has some 
> problems at times).

With the "gcc inline's static functions" you complain about we have
4-5 years of experience.

Suddenly allowing 4 release series of gcc to ignore any inline's is a 
completely new area for us. I'd generally agree with giving gcc more 
freedom here, but I'd rather do it right by removing tons of wrong 
inline's than doing one global change hoping that it will make things 
better.

And whether the "optimized inlining" actually makes the kernel bigger or 
smaller depends in my experience on the .config and the gcc version.

> 			Linus

cu
Adrian

[1] there are some rare exceptions

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
