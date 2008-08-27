From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
	bisected
Date: Wed, 27 Aug 2008 10:34:08 +0200
Message-ID: <1219826048.30209.2.camel@spike.firmix.at>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik> <48B313E0.1000501@hp.com>
	 <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org>
	 <200808261111.19205.rusty@rustcorp.com.au>
	 <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
	 <20080826183051.GB10925@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	 <20080826205916.GB11734@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	 <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Parag Warudkar <parag.lkml@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Adrian Bunk <bunk@stusta.de>, Rusty Russell <rusty@rustcorp.com.au>, "Alan D. Brunelle" <Alan.Brunelle@hp.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>, linux-embedded@vger.kernel.org

On Tue, 2008-08-26 at 18:54 -0400, Parag Warudkar wrote:
> On Tue, Aug 26, 2008 at 5:04 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> 
> > And embedded people (the ones that might care about 1% code size) are the
> > ones that would also want smaller stacks even more!
> 
> This is something I never understood - embedded devices are not going
> to run more than a few processes and 4K*(Few Processes)
>  IMHO is not worth a saving now a days even in embedded world given
> falling memory prices. Or do I misunderstand?

Falling prices are no reason to increase the amount of available RAM (or
other hardware).
Especially if you (intend to) build >1E5 devices - where every Euro
counts.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

