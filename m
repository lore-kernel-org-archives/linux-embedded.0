From: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Wed, 27 Aug 2008 18:51:53 +0100
Message-ID: <20080827175152.GA27491@shareable.org>
References: <20080826205916.GB11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org> <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com> <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org> <f7848160808261758q7b84aab1m188c1ebb59304818@mail.gmail.com> <1219827609.30209.29.camel@spike.firmix.at> <f7848160808270556q54c36270ye6a465d2ca123cc@mail.gmail.com> <1219843032.30209.51.camel@spike.firmix.at> <20080827154805.GA25387@shareable.org> <1219855121.30209.112.camel@spike.firmix.at>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1219855121.30209.112.camel-7sPfb3biEqGJZy4MaDjwDw@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Petrovitsch <bernd-GBwJepH+xoVeoWH0uzbU5w@public.gmane.org>
Cc: Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Bernd Petrovitsch wrote:
> > 32MB no-MMU ARM boards which people run new things and attach new
> > devices to rather often - without making new hardware.  Volume's too
> > low per individual application to get new hardware designed and made.
> 
> Yes, you may have several products on the same hardware with somewhat
> differing requirements (or not). But that is much less than a general
> purpose system IMHO.

It is, but the idea that small embedded systems go through a 'all
components are known, drivers are known, test and if it passes it's
shippable' does not always apply.

> > I'm seriously thinking of forwarding porting the 4 year old firmware
> > from 2.4.26 to 2.6.current, just to get new drivers and capabilities.
> 
> That sounds reasonable (and I never meant maintaining the old system
> infinitely.

Sounds reasonable, but it's vetoed for anticipated time and cost,
compared with backporting on demand.  Fair enough, since 2.6.current
doesn't support ARM no-MMU last I heard ('soon'?).

On the other hand, the 2.6 anti-fragmentation patches, including
latest SLUB stuff, ironically meant to help big machines, sound really
appealing for my current problem and totally unrealistic to
backport...

> ACK. We avoid MMU-less hardware too - especially since there is enough
> hardware with a MMU around.

I can't emphasise enough how much difference MMU makes to Linux userspace.

It's practically: MMU = standard Linux (with less RAM), have everything.
No-MMU = lots of familiar 'Linux' things not available or break.

-- Jamie
