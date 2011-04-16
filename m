From: Alessio Igor Bogani <abogani@kernel.org>
Subject: [PATCH 4/4] module: Use the binary search for symbols resolution
Date: Sat, 16 Apr 2011 15:26:13 +0200
Message-ID: <1302960373-5309-5-git-send-email-abogani@kernel.org>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer:in-reply-to:references;
        bh=+7ocbRKA+Oec5vhoXi/ntjmtvuvfzSFjVajd+MNTCss=;
        b=FM/hRrlvYBNqHmZe9T3xX8iPj7wCiECDCwOyetO5WNhUygWu6Cp3E3R/5SdqZx8ToN
         YKCE+zhQ1NwiOwlvtI0vCMDoqFs9cYs5pTqc9smX0np81dLFtTLACVprGJ6oybp8rPj+
         IJFkp47fxPqx9ieKLBXQLD8mQiF7YInvGoTUY=
In-Reply-To: <1302960373-5309-1-git-send-email-abogani@kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Alessio Igor Bogani <abogani@kernel.org>

Takes advantage of the order and locates symbols using binary search.

This work was supported by a hardware donation from the CE Linux Forum.

Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
---
 kernel/module.c |   23 ++++++++++++++++-------
 1 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index b438b25..74a57c1 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -57,6 +57,7 @@
 #include <linux/kmemleak.h>
 #include <linux/jump_label.h>
 #include <linux/pfn.h>
+#include <linux/bsearch.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/module.h>
@@ -351,22 +352,30 @@ struct find_symbol_arg {
 	const struct kernel_symbol *sym;
 };
 
+static int cmp_name(const void *va, const void *vb)
+{
+	const char *a;
+	const struct kernel_symbol *b;
+	a = va; b = vb;
+	return strcmp(a, b->name);
+}
+
 static bool find_symbol_in_symsearch(const struct symsearch *syms,
 				     struct module *owner,
 				     void *data)
 {
 	struct find_symbol_arg *fsa = data;
+	struct kernel_symbol *sym;
 	unsigned int symnum;
-	int result;
 
-	for (symnum = 0; symnum < syms->stop - syms->start; symnum++) {
-		result = strcmp(fsa->name, syms->start[symnum].name);
-		if (result == 0)
-			break;
-	}
-	if (symnum >= syms->stop - syms->start)
+	sym = bsearch(fsa->name, syms->start, syms->stop - syms->start,
+		sizeof(struct kernel_symbol), cmp_name);
+
+	if (sym == NULL)
 		return false;
 
+	symnum = sym - syms->start;
+
 	if (!fsa->gplok) {
 		if (syms->licence == GPL_ONLY)
 			return false;
-- 
1.7.4.1
