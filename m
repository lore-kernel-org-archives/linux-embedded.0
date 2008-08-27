From: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Wed, 27 Aug 2008 16:48:05 +0100
Message-ID: <20080827154805.GA25387@shareable.org>
References: <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org> <20080826205916.GB11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org> <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com> <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org> <f7848160808261758q7b84aab1m188c1ebb59304818@mail.gmail.com> <1219827609.30209.29.camel@spike.firmix.at> <f7848160808270556q54c36270ye6a465d2ca123cc@mail.gmail.com> <1219843032.30209.51.camel@spike.firmix.at>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1219843032.30209.51.camel-7sPfb3biEqGJZy4MaDjwDw@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Petrovitsch <bernd-GBwJepH+xoVeoWH0uzbU5w@public.gmane.org>
Cc: Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Bernd Petrovitsch wrote:
> If you "develop" an embedded system (which is partly system integration
> of existing apps) to be installed in the field, you don't have that many
> conceivable work loads compared to a desktop/server system. And you have
> a fixed list of drivers and applications.

Hah!  Not in my line of embedded device.

32MB no-MMU ARM boards which people run new things and attach new
devices to rather often - without making new hardware.  Volume's too
low per individual application to get new hardware designed and made.

I'm seriously thinking of forwarding porting the 4 year old firmware
from 2.4.26 to 2.6.current, just to get new drivers and capabilities.
Backporting is tedious, so's feeling wretchedly far from the mainline
world.

> A usual approach is to run stress tests on several (or all)
> subsystems/services/... in parallel and if the device survives it
> functioning correctly, it is at least good enough.

Per application.

Some little devices run hundreds of different applications and
customers expect to customise, script themselves, and attach different
devices (over USB).  The next customer in the chain expects the bits
you supplied to work in a variety of unexpected situations, even when
you advise that it probably won't do that.

Much like desktop/server Linux, but on a small device where silly
little things like 'create a process' are a stress for the dear little
thing.

(My biggest lesson: insist on an MMU next time!)

-- Jamie
