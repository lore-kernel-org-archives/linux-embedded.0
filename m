From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
	bisected
Date: Wed, 27 Aug 2008 15:17:12 +0200
Message-ID: <1219843032.30209.51.camel@spike.firmix.at>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	 <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
	 <20080826183051.GB10925@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	 <20080826205916.GB11734@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	 <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
	 <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org>
	 <f7848160808261758q7b84aab1m188c1ebb59304818@mail.gmail.com>
	 <1219827609.30209.29.camel@spike.firmix.at>
	 <f7848160808270556q54c36270ye6a465d2ca123cc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <f7848160808270556q54c36270ye6a465d2ca123cc@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Parag Warudkar <parag.lkml@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Adrian Bunk <bunk@stusta.de>, Rusty Russell <rusty@rustcorp.com.au>, "Alan D. Brunelle" <Alan.Brunelle@hp.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>, linux-embedded@vger.kernel.org


On Wed, 2008-08-27 at 08:56 -0400, Parag Warudkar wrote:
> On Wed, Aug 27, 2008 at 5:00 AM, Bernd Petrovitsch <bernd@firmix.at> wrote:
> > They probably gave the idea pretty soon because you need to
> > rework/improve large parts of the kernel + drivers (and that has two
> > major problems - it consumes a lot of man power for "no new features and
> > everything must be completely tested again"[0] and it adds new risks).
> > And that is practically impossible if one sells "stable driver APIs" for
> > 3rd party (commercial) drivers because these must be changed too.
> 
> But not many embedded Linux arches support 4K stacks like Adrian

What is an "embedded Linux arch"?
Personally I encountered i386, ARM, MIPS and PPC in the embedded world.

> pointed out earlier.
> So the same (lot of man power requirement) would apply to Linux.

Of course. Look at the amount of work done by lots of people in that
area (including stack frame size reductions) and on-going discussions.

> Sure it will be good - but how reasonable it is to attempt it and how
> reliably it will work under all conceived loads - those are the
> questions.

If you "develop" an embedded system (which is partly system integration
of existing apps) to be installed in the field, you don't have that many
conceivable work loads compared to a desktop/server system. And you have
a fixed list of drivers and applications.
A usual approach is to run stress tests on several (or all)
subsystems/services/... in parallel and if the device survives it
functioning correctly, it is at least good enough.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

