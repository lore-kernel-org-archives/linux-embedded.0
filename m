From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Tue, 26 Aug 2008 12:18:53 -0700 (PDT)
Message-ID: <alpine.LFD.1.10.0808261212530.3363@nehalem.linux-foundation.org>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik> <48B313E0.1000501@hp.com> <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org> <200808261111.19205.rusty@rustcorp.com.au> <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
 <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org> <20080826190213.GA30255@shareable.org>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080826190213.GA30255-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Tue, 26 Aug 2008, Jamie Lokier wrote:
> 
> A function which is only called from one place should, if everything
> made sense, _never_ use more stack through being inlined.

But that's simply not true.

See the whole discussion.

The problem is that if you inline that function, the stack usage of the 
newly inlined function is now added to ALL THE OTHER paths too!

So the case we had in module loading was that yes, we had a function with 
a big stack footprint, but it was NOT in the deep path.

But by inlining it, it now moved the stack footprint "up" one level to 
another function, and now the big stack footprint really _was_ in the deep 
path, because the caller was involved in a much deeper chain. 

So inlining moves the code up the callchain, and that is a problem for the 
backtrace, but that's "just" a debugging issue. But it also moves the 
stack footprint up the callchain, and that can actually be a correctness 
issue.

Of course, a compiler doesn't _have_ to do that. A compiler _could_ have 
multiple different stack footprints for a single function, and do liveness 
analysis etc. But no sane compiler probably does that, because it's very 
painful indeed, and it's not even an issue if you aren't stack-limited 
(and being stack-limited is really just a kernel thing).

(Yeah, it can be an issue even if you have a big stack, in that you get 
worse cache behaviour, so a dense stack footprint _would_ help. But the 
complexity of stack liveness analysis is almost certainly not worth the 
relatively small gains it would get on some odd cases).

			Linus
