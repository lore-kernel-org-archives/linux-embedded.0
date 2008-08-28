From: David Miller <davem@davemloft.net>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Wed, 27 Aug 2008 17:46:05 -0700 (PDT)
Message-ID: <20080827.174605.85608276.davem@davemloft.net>
References: <20080827160052.GA15968@linux-sh.org>
	<20080827173544.GH11734@cs181140183.pp.htv.fi>
	<20080828003211.GA18893@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080828003211.GA18893@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: lethal@linux-sh.org
Cc: bunk@kernel.org, torvalds@linux-foundation.org, rusty@rustcorp.com.au, Alan.Brunelle@hp.com, rjw@sisk.pl, linux-kernel@vger.kernel.org, kernel-testers@vger.kernel.org, akpm@linux-foundation.org, arjan@linux.intel.com, mingo@elte.hu, linux-embedded@vger.kernel.org

From: Paul Mundt <lethal@linux-sh.org>
Date: Thu, 28 Aug 2008 09:32:13 +0900

> On Wed, Aug 27, 2008 at 08:35:44PM +0300, Adrian Bunk wrote:
> > CONFIG_DEBUG_STACKOVERFLOW should give you the same information, and if
> > wanted with an arbitrary limit.
>
> In some cases, yes. In the CONFIG_DEBUG_STACKOVERFLOW case the check is
> only performed from do_IRQ(), which is sporadic at best, especially on
> tickless. While it catches some things, it's not a complete solution in
> and of iteslf.

BTW, on sparc64 we have a stack overflow checker that runs via
the profiling _mcount hook.  So every function call we check
if the stack is getting overused.

If so, we jump onto a special static debugging stack and print
the stack overflow message.

And yes it works with IRQ stacks which is all that sparc64 uses
nowadays.

Perhaps this is useful enough to make generic.
