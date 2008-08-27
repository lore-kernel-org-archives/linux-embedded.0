From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Tue, 26 Aug 2008 18:49:19 -0700 (PDT)
Message-ID: <alpine.LFD.1.10.0808261837530.3363@nehalem.linux-foundation.org>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>  <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org>  <200808261111.19205.rusty@rustcorp.com.au>  <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>  <20080826183051.GB10925@cs181140183.pp.htv.fi>
  <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>  <20080826205916.GB11734@cs181140183.pp.htv.fi>  <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>  <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com> 
 <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org> <f7848160808261758q7b84aab1m188c1ebb59304818@mail.gmail.com>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f7848160808261758q7b84aab1m188c1ebb59304818-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Tue, 26 Aug 2008, Parag Warudkar wrote:
>
> And although you said in your later reply that Linux x86 with 4K
> stacks should be more than usable - my experiences running a untainted
> desktop/file server with 4K stack have been always disastrous XFS or
> not.  It _might_ work for some well defined workloads but you would
> not want to risk 4K stacks otherwise.

Umm. How long?

4kB used to be the _only_ choice. And no, there weren't even irq stacks. 
So that 4kB was not just the whole kernel call-chain, it was also all the 
irq nesting above it.

And yes, we've gotten much worse over time, and no, I can't really suggest 
going back to that in general. The code bloat has certainly been 
accompanied by a stack bloat too.

But part of it is definitely gcc. Some versions of gcc used to be 
absolutely _horrid_ when it came to stack usage, especially with some 
flags, and especially with the crazy inlining that module-at-a-time 
caused.

But I'd be really happy if some embedded people tried to take some of that 
bloat back, and aim for 4kB stacks. Because it's definitely not 
unrealistic. At least it _shouldn't_ be. And a lot of the cases of us 
having structures on the stack is actually not worth it, and tends to be 
about being lazy rather than anything else.

			Linus
