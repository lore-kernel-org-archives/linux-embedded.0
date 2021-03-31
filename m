From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] tracing: Use pr_crit() instead of long fancy messages
Date: Wed, 31 Mar 2021 11:31:03 +0200
Message-ID: <20210331093104.383705-3-geert+renesas@glider.be>
References: <20210331093104.383705-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210331093104.383705-1-geert+renesas@glider.be>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, John Ogness <john.ogness@linutronix.de>, Gary R Hook <gary.hook@amd.com>, Marco Elver <elver@google.com>, Randy Dunlap <rdunlap@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

While long fancy messages have a higher probability of being seen than
small messages, they may scroll of the screen fast, if visible at all,
and may still be missed.  In addition, they increase boot time and
kernel size.

The correct mechanism to increase importance of a kernel message is not
to draw fancy boxes with more text, but to shout louder, i.e. increase
the message's reporting level.  Making sure the administrator of the
system is aware of such a message is a system policy, and is the
responsability of a user-space log daemon.

Fix this by increasing the reporting level from KERN_WARNING to
KERN_CRIT, and removing irrelevant text and graphics.

This reduces kernel size by ca. 0.5 KiB.

Fixes: 2184db46e425c2b8 ("tracing: Print nasty banner when trace_printk() is in use")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 kernel/trace/trace.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index eccb4e1187cc788e..b3a93aff01045923 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3175,20 +3175,9 @@ void trace_printk_init_buffers(void)
 
 	/* trace_printk() is for debug use only. Don't use it in production. */
 
-	pr_warn("\n");
-	pr_warn("**********************************************************\n");
-	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("** trace_printk() being used. Allocating extra memory.  **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("** This means that this is a DEBUG kernel and it is     **\n");
-	pr_warn("** unsafe for production use.                           **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("** If you see this message and you are not debugging    **\n");
-	pr_warn("** the kernel, report this immediately to your vendor!  **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
-	pr_warn("**********************************************************\n");
+	pr_crit("trace_printk() being used. Allocating extra memory.\n");
+	pr_crit("This means that this is a DEBUG kernel and it is\n");
+	pr_crit("unsafe for production use.\n");
 
 	/* Expand the buffers to set size */
 	tracing_update_buffers();
-- 
2.25.1

