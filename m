From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Tue, 26 Aug 2008 20:02:13 +0100
Message-ID: <20080826190213.GA30255@shareable.org>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik> <48B313E0.1000501@hp.com> <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org> <200808261111.19205.rusty@rustcorp.com.au> <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org> <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Adrian Bunk <bunk@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, "Alan D. Brunelle" <Alan.Brunelle@hp.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>, linux-embedded@vger.kernel.org

Linus Torvalds wrote:
> The inline-functions-called-once thing is what causes even big functions 
> to be inlined, and that's where you find the big downsides too (eg the 
> stack usage).

That's a bit bizarre, though, isn't it?

A function which is only called from one place should, if everything
made sense, _never_ use more stack through being inlined.  Inlining
should just increase the opportunities that the called function's
local variables can share the same stack slots are the caller's dead
locals.

Whereas not inlining guarantees they occupy separate, immediately
adjacent regions of the stack, and shouldn't be increasing the total
numbers of local variables.

-- Jamie
