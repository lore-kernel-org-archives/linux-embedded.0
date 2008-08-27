From: Greg Ungerer <gerg-XXXsiaCtIV5Wk0Htik3J/w@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Wed, 27 Aug 2008 10:53:11 +1000
Message-ID: <48B4A577.3020303@snapgear.com>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik> <48B313E0.1000501@hp.com>  <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org>  <200808261111.19205.rusty@rustcorp.com.au>  <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>  <20080826183051.GB10925@cs181140183.pp.htv.fi>  <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>  <20080826205916.GB11734@cs181140183.pp.htv.fi>  <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org> <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com> <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.1.10.0808261644260.3363-nfNrOhbfy2R17+2ddN/4kux8cNe9sq/dYPYVAmT7z5s@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


Linus Torvalds wrote:
> On Tue, 26 Aug 2008, Parag Warudkar wrote:
>> This is something I never understood - embedded devices are not going
>> to run more than a few processes and 4K*(Few Processes)
>>  IMHO is not worth a saving now a days even in embedded world given
>> falling memory prices. Or do I misunderstand?
> 
> Well, by that argument, 1% of kernel size doesn't matter either..
> 
> 1% of a kernel for an embedded device is roughly 10-30kB or so depending 
> on how small you make the configuration. 
> 
> If that matters, then so should the difference of 3-8 processes' kernel 
> stack usage when you have a 4k/8k stack choice.
> 
> And they _all_ will have at least 3-8 processes on them. Even the simplest 
> ones will tend to have many more.

I have some simple devices (network access/routers) with 8MB of RAM,
at power up not really being configured to do anything running 25
processes. (Heck there is over 10 kernel processes running!). Configure
some interfaces and services and that will easily push past 40.
I'd be happy with a 160k saving :-)

The init memory being freed at the end of the kernel boot is 88k,
4k stacks could save more than that.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg-XXXsiaCtIV5Wk0Htik3J/w@public.gmane.org
Secure Computing Corporation                PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
