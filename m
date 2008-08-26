From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Tue, 26 Aug 2008 16:51:52 -0700 (PDT)
Message-ID: <alpine.LFD.1.10.0808261648140.3363@nehalem.linux-foundation.org>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik> <48B313E0.1000501@hp.com> <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org> <200808261111.19205.rusty@rustcorp.com.au> <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
 <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org> <20080826205916.GB11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
 <20080826232411.GC11734@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080826232411.GC11734-re2QNgSbS3j4D6uPqz5PAwR5/fbUUdgG@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Wed, 27 Aug 2008, Adrian Bunk wrote:
> > 
> > We're much better off with a 1% code-size reduction than forcing big 
> > stacks on people. The 4kB stack option is also a good way of saying "if it 
> > works with this, then 8kB is certainly safe".
> 
> You implicitely assume both would solve the same problem.

I'm just saying that your logic doesn't hold water.

If we can save kernel stack usage, then a 1% increase in kernel size is 
more than worth it.

> While 4kB stacks are something we anyway never got 100% working

What? Don't be silly. 

Linux _historically_ always used 4kB stacks.

No, they are likely not usable on x86-64, but dammit, they should be more 
than usable on x86-32 still.

> But I do not think the problem you'd solve with 
> -fno-inline-functions-called-once is big enough to warrant the size 
> increase it causes.

You continually try to see the inlining as a single solution to one 
problem (debuggability, stack, whatever).

The biggest problem with gcc inlining has always been that it has been 
_unpredictable_. It causes problems in many different ways. It has caused 
stability issues due to gcc versions doing random things. It causes the 
stack expansion. It makes stack traces harder for debugging, etc.

If it was any one thing, I wouldn't care. But it's exactly the fact that 
it causes all these problems in different areas.

			Linus
