From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] lib/vsprintf: Use pr_crit() instead of long fancy messages
Date: Wed, 31 Mar 2021 11:31:04 +0200
Message-ID: <20210331093104.383705-4-geert+renesas@glider.be>
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

Fixes: 5ead723a20e0447b ("lib/vsprintf: no_hash_pointers prints all addresses as unhashed")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 lib/vsprintf.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 9b423359bb6433d3..0293f1b89064b287 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2193,20 +2193,9 @@ static int __init no_hash_pointers_enable(char *str)
 
 	no_hash_pointers = true;
 
-	pr_warn("**********************************************************\n");
-	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("** This system shows unhashed kernel memory addresses   **\n");
-	pr_warn("** via the console, logs, and other interfaces. This    **\n");
-	pr_warn("** might reduce the security of your system.            **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("** If you see this message and you are not debugging    **\n");
-	pr_warn("** the kernel, report this immediately to your system   **\n");
-	pr_warn("** administrator!                                       **\n");
-	pr_warn("**                                                      **\n");
-	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
-	pr_warn("**********************************************************\n");
-
+	pr_crit("This system shows unhashed kernel memory addresses\n");
+	pr_crit("via the console, logs, and other interfaces. This\n");
+	pr_crit("might reduce the security of your system.\n");
 	return 0;
 }
 early_param("no_hash_pointers", no_hash_pointers_enable);
-- 
2.25.1

