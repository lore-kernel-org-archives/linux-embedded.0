From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH RFC 2/5] extable: Skip sorting if sorted at build time.
Date: Fri, 18 Nov 2011 11:37:45 -0800
Message-ID: <1321645068-20475-3-git-send-email-ddaney.cavm@gmail.com>
References: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=JAZFN0rrR5RwoS38mMQQ6FuAa7XM8IRQfDR5QS02QSQ=;
        b=iYUpo6+72huDT5qtAwpzEjy6py0yce4ARKIV5qiSGt10jFuAjvTXtspt0CRn+QxphX
         UBSyHO7vqBpU8+8MRJ+ZbybwGtbmJM27YxEV0BF5zMMVnKGgaWH7MkPQclSMCbF+FkxI
         OHGIt5RStDWF/UHWv1QMMVvsUqN4wt6uAqRXQ=
In-Reply-To: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-embedded@vger.kernel.org, x86@kernel.org
Cc: David Daney <david.daney@cavium.com>

From: David Daney <david.daney@cavium.com>

If the build program sortextable has already sorted the exception
table, don't sort it again.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 kernel/extable.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/kernel/extable.c b/kernel/extable.c
index 5339705..fe35a63 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -35,10 +35,16 @@ DEFINE_MUTEX(text_mutex);
 extern struct exception_table_entry __start___ex_table[];
 extern struct exception_table_entry __stop___ex_table[];
 
+/* Cleared by build time tools if the table is already sorted. */
+u32 __initdata main_extable_sort_needed = 1;
+
 /* Sort the kernel's built-in exception table */
 void __init sort_main_extable(void)
 {
-	sort_extable(__start___ex_table, __stop___ex_table);
+	if (main_extable_sort_needed)
+		sort_extable(__start___ex_table, __stop___ex_table);
+	else
+		pr_notice("__ex_table already sorted, skipping sort\n");
 }
 
 /* Given an address, look for it in the exception tables. */
-- 
1.7.2.3
