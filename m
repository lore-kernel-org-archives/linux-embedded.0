From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Tue, 26 Aug 2008 14:04:57 -0700 (PDT)
Message-ID: <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik> <48B313E0.1000501@hp.com> <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org> <200808261111.19205.rusty@rustcorp.com.au> <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
 <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org> <20080826205916.GB11734@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080826205916.GB11734@cs181140183.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: Rusty Russell <rusty@rustcorp.com.au>, "Alan D. Brunelle" <Alan.Brunelle@hp.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>, linux-embedded@vger.kernel.org



On Tue, 26 Aug 2008, Adrian Bunk wrote:
> 
> If you think we have too many stacksize problems I'd suggest to consider 
> removing the choice of 4k stacks on i386, sh and m68knommu instead of 
> using -fno-inline-functions-called-once:

Don't be silly. That makes the problem _worse_.

We're much better off with a 1% code-size reduction than forcing big 
stacks on people. The 4kB stack option is also a good way of saying "if it 
works with this, then 8kB is certainly safe".

And embedded people (the ones that might care about 1% code size) are the 
ones that would also want smaller stacks even more!

		Linus
