From: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Wed, 27 Aug 2008 16:01:50 +1000
Message-ID: <18612.60878.887716.452936@drongo.ozlabs.ibm.com>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	<alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org>
	<200808261111.19205.rusty@rustcorp.com.au>
	<alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
	<20080826183051.GB10925@cs181140183.pp.htv.fi>
	<alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	<20080826205916.GB11734@cs181140183.pp.htv.fi>
	<alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	<f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
	<alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org>
	<f7848160808261758q7b84aab1m188c1ebb59304818@mail.gmail.com>
	<alpine.LFD.1.10.0808261837530.3363@nehalem.linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.1.10.0808261837530.3363-nfNrOhbfy2R17+2ddN/4kux8cNe9sq/dYPYVAmT7z5s@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Linus Torvalds writes:

> 4kB used to be the _only_ choice. And no, there weren't even irq stacks. 
> So that 4kB was not just the whole kernel call-chain, it was also all the 
> irq nesting above it.

I think your memory is failing you.  In 2.4 and earlier, the kernel
stack was 8kB minus the size of the task_struct, which sat at the
start of the 8kB.  For instance, from include/asm-i386/processor.h for
2.4.29:

#define THREAD_SIZE (2*PAGE_SIZE)
#define alloc_task_struct() ((struct task_struct *) __get_free_pages(GFP_KERNEL,1))
#define free_task_struct(p) free_pages((unsigned long) (p), 1)

Paul.
