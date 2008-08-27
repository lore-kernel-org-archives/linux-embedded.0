From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Tue, 26 Aug 2008 17:28:37 -0700 (PDT)
Message-ID: <alpine.LFD.1.10.0808261726560.3363@nehalem.linux-foundation.org>
References: <48B313E0.1000501@hp.com> <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org> <200808261111.19205.rusty@rustcorp.com.au> <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org> <20080826183051.GB10925@cs181140183.pp.htv.fi>
 <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org> <20080826205916.GB11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org> <20080826232411.GC11734@cs181140183.pp.htv.fi>
 <alpine.LFD.1.10.0808261648140.3363@nehalem.linux-foundation.org> <20080827002316.GE11734@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080827002316.GE11734@cs181140183.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, "Alan D. Brunelle" <Alan.Brunelle@hp.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>, linux-embedded@vger.kernel.org



On Wed, 27 Aug 2008, Adrian Bunk wrote:
> 
> When did we get callpaths like like nfs+xfs+md+scsi reliably 
> working with 4kB stacks on x86-32?

XFS may never have been usable, but the rest, sure.

And you seem to be making this whole argument an excuse to SUCK, adn an 
excuse to let gcc crap even more on our stack space.

Why?

Why aren't you saying that we should be able to do better? Instead, you 
seem to asking us to do even worse than we do now?

			Linus
