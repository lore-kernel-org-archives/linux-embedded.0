From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] Use pr_crit() instead of long fancy messages
Date: Wed, 31 Mar 2021 11:31:01 +0200
Message-ID: <20210331093104.383705-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, John Ogness <john.ogness@linutronix.de>, Gary R Hook <gary.hook@amd.com>, Marco Elver <elver@google.com>, Randy Dunlap <rdunlap@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi all,

While long fancy messages have a higher probability of being seen than
small messages, they may scroll of the screen fast, if visible at all,
and may still be missed.  In addition, they increase boot time and
kernel size.

The correct mechanism to increase importance of a kernel message is not
to draw fancy boxes with more text, but to shout louder, i.e. increase
the message's reporting level.  Making sure the administrator of the
system is aware of such a message is a system policy, and is the
responsability of a user-space log daemon.

This series increases the reporting level of such messages from
KERN_WARNING to KERN_CRIT, and removes irrelevant text and graphics.
It was made against linux-next, but applies to v5.12-rc5 with an offset
for the last patch.

Each of these patches reduces kernel size by ca. 0.5 KiB.

Thanks for your comments!

Geert Uytterhoeven (3):
  iommu: Use pr_crit() instead of long fancy messages
  tracing: Use pr_crit() instead of long fancy messages
  lib/vsprintf: Use pr_crit() instead of long fancy messages

 drivers/iommu/iommu-debugfs.c | 19 ++++---------------
 kernel/trace/trace.c          | 17 +++--------------
 lib/vsprintf.c                | 17 +++--------------
 3 files changed, 10 insertions(+), 43 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
