From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Tue, 26 Aug 2008 16:00:33 -0700
Message-ID: <48B48B11.8050000@cisco.com>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik> <48B313E0.1000501@hp.com>	 <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org>	 <200808261111.19205.rusty@rustcorp.com.au>	 <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>	 <20080826183051.GB10925@cs181140183.pp.htv.fi>	 <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>	 <20080826205916.GB11734@cs181140183.pp.htv.fi>	 <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org> <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=927; t=1219791631; x=1220655631;
	c=relaxed/simple; s=sjdkim1004;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20[Bug=20#11342]=20Linux=202.6.27-rc3=3A=
	20kernel=20BUG=20at=20mm/vmalloc.c=20-=20bisected
	|Sender:=20;
	bh=xrI4KEPFlaVuXASDf2GMuo6RZJ8wwQuODFTmQK0SRtI=;
	b=FCgDyijBXNa0/5YT2Z8pi5lUmnwrV2N7SjeNPBpeICuUgo5+LEQvR2LZbZ
	5gEhJhUIxXvCmGBrh3rdCVomz6/H0EukyVDzu7UxQAVjUqXT6MRIT7r6SpSc
	Zq1aditz68sZFuzwbJ1YISpuUtM4j7NU7TlWbiWfDwvyQBew4AtVY=;
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Parag Warudkar wrote:
> On Tue, Aug 26, 2008 at 5:04 PM, Linus Torvalds
> <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> wrote:
> 
>> And embedded people (the ones that might care about 1% code size) are the
>> ones that would also want smaller stacks even more!
> 
> This is something I never understood - embedded devices are not going
> to run more than a few processes and 4K*(Few Processes)
>  IMHO is not worth a saving now a days even in embedded world given
> falling memory prices. Or do I misunderstand?

Embedded applications span a huge range of sizes, from the very small devices to 
which you refer, to quite complex devices. The cable settop boxes we develop have 
over a hundred interrupt sources, typically run 250-300 threads, and have 192+ 
MiB of memory. For all that, we are very cost sensitive and are under constant 
pressure to come up with reliable ways to save memory.

> Parag
--
David VomLehn

