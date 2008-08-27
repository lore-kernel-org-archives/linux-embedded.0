From: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Wed, 27 Aug 2008 09:25:28 +0100
Message-ID: <20080827092528.780916bd@lxorguk.ukuu.org.uk>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	<48B313E0.1000501@hp.com>
	<alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org>
	<200808261111.19205.rusty@rustcorp.com.au>
	<alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
	<20080826183051.GB10925@cs181140183.pp.htv.fi>
	<alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	<20080826205916.GB11734@cs181140183.pp.htv.fi>
	<alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	<20080826232411.GC11734@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080826232411.GC11734-re2QNgSbS3j4D6uPqz5PAwR5/fbUUdgG@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> You have a good point that aiming at 4kB makes 8kB a very safe choice.

Not really no - we use separate IRQ stacks in 4K but not 8K mode on
x86-32. That means you've actually got no more space if you are unlucky
with the timing of events. The 8K mode is merely harder to debug.

If 4K stacks really are not safe then x86-32 really really needs to
switch to using IRQ stacks in 8K stack mode as well.

Alan
