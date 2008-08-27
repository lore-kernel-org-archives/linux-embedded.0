From: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Wed, 27 Aug 2008 14:21:42 +0100
Message-ID: <20080827142142.303cdba8@lxorguk.ukuu.org.uk>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	<alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org>
	<200808261111.19205.rusty@rustcorp.com.au>
	<alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
	<20080826183051.GB10925@cs181140183.pp.htv.fi>
	<alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	<20080826205916.GB11734@cs181140183.pp.htv.fi>
	<alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	<20080826232411.GC11734@cs181140183.pp.htv.fi>
	<20080827092528.780916bd@lxorguk.ukuu.org.uk>
	<f7848160808270552u2ee66167x912a68e0bf8b25bf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f7848160808270552u2ee66167x912a68e0bf8b25bf-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> By your logic though, XFS on x86 should work fine with 4K stacks -
> many will attest that it does not and blows up due to stack issues.
> 
> I have first hand experiences of things blowing up with deep call
> chains when using 4K stacks where 8K worked just fine on same
> workload.
> 
> So there is definitely some other problem with 4K stacks.

Nothing of the sort. If it blows up with a 4K stack it will almost
certainly blow up with an 8K stack *eventually* - when a heavy stack usage
coincides with a heavy stack using IRQ handler.

You won't catch it in simple testing, you won't catch it in trivial
simulation and it'll be incredibly hard to reproduce. Not the kind of bug
you want in a production system really. IRQ stacks make things much more
predictable.

Alan
