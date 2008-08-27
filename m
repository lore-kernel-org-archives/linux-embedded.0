From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
	bisected
Date: Wed, 27 Aug 2008 14:58:47 +0300
Message-ID: <20080827115847.GG11734@cs181140183.pp.htv.fi>
References: <200808261111.19205.rusty@rustcorp.com.au> <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org> <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org> <20080826205916.GB11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org> <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com> <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org> <f7848160808261758q7b84aab1m188c1ebb59304818@mail.gmail.com> <alpine.LFD.1.10.0808261837530.3363@nehalem.linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756059AbYH0L7w@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0808261837530.3363@nehalem.linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Parag Warudkar <parag.lkml@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, "Alan D. Brunelle" <Alan.Brunelle@hp.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>, linux-embedded@vger.kernel.org

On Tue, Aug 26, 2008 at 06:49:19PM -0700, Linus Torvalds wrote:
>...
> But part of it is definitely gcc. Some versions of gcc used to be 
> absolutely _horrid_ when it came to stack usage, especially with some 
> flags, and especially with the crazy inlining that module-at-a-time 
> caused.
>...

That was gcc 3.4.

And due to that we disable unit-at-a-time for gcc 3.4 on 32bit x86.

> 			Linus

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
