From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
	bisected
Date: Wed, 27 Aug 2008 10:44:12 +0200
Message-ID: <1219826652.30209.12.camel@spike.firmix.at>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	 <20080826183051.GB10925@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	 <20080826205916.GB11734@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	 <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
	 <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org>
	 <48B4A577.3020303@snapgear.com>
	 <f7848160808261808p3391c99ekfa1d8991bbf73c10@mail.gmail.com>
	 <48B4AE68.4040205@snapgear.com>
	 <f7848160808261916x6e2a3abfj2c28fa665da792b4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <f7848160808261916x6e2a3abfj2c28fa665da792b4@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Parag Warudkar <parag.lkml@gmail.com>
Cc: Greg Ungerer <gerg@snapgear.com>, Linus Torvalds <torvalds@linux-foundation.org>, Adrian Bunk <bunk@stusta.de>, Rusty Russell <rusty@rustcorp.com.au>, "Alan D. Brunelle" <Alan.Brunelle@hp.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>, linux-embedded@vger.kernel.org

On Tue, 2008-08-26 at 22:16 -0400, Parag Warudkar wrote:
[...]
> Well, sure  - but the industry as a whole seems to have gone the other

"The industry as a whole" doesn't exist on that low level. You can't
compare the laptop and/or desktop computer market (where one may buy
today hardware that runs in 3 years with the next generation/release of
the OS and applications) with the e.g. "WLAN router" market where - from
the commercial point of view - every Euro counts (and where the
requirements for the lifetime of the device are long frozen before the
thing gets in a shop).

> way - do more with more at the similar or lower price points!
> By that definition of less is better we should try and make the kernel
> memory pageable (or has someone already done that?) - Windows does it,

That doesn't help as in really small devices (like WLAN routers, cable
modems, etc.) you run without any means of paging/swapping. And even
binaries/read-only files are not necessarily executable in place (but
must be loaded into RAM). So you can't flush these pages.

And pageable kernel memory doesn't come for free - even if one only
counts the increased code and it's complexity.

> by default ;)

Which is more a sign that it is probably a very bad idea.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

