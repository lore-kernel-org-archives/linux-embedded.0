From: Alessio Igor Bogani <abogani@kernel.org>
Subject: [PATCH] module: Use binary search in lookup_symbol()
Date: Tue,  3 May 2011 22:42:10 +0200
Message-ID: <1304455330-2728-1-git-send-email-abogani@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer;
        bh=kxPSNuxDvZ7l19np/nHLCQ7H87eswCQtatDSCusceaU=;
        b=gmbLHStBSla8We2M27q2vJPc/uh3xjz5XZNiK/B15dNCIH30MCpNFBRAiwYvxplzzH
         f6mQUcjlbf28YSF9BXQIyxmMOaWjHwQvMiLgizngGnc0Fwjtp9lKvL3nFqsigAI6Tat9
         k4f10XJX7PkVrRg+AJJ40ko3dS0MY7nJP0D3Y=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Alessio Igor Bogani <abogani@kernel.org>

This work was supported by a hardware donation from the CE Linux Forum.

Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
---
 kernel/module.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 6a34337..a1f841e 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2055,10 +2055,8 @@ static const struct kernel_symbol *lookup_symbol(const char *name,
 	const struct kernel_symbol *stop)
 {
 	const struct kernel_symbol *ks = start;
-	for (; ks < stop; ks++)
-		if (strcmp(ks->name, name) == 0)
-			return ks;
-	return NULL;
+	return bsearch(ks->name, start, stop - start,
+			sizeof(struct kernel_symbol), cmp_name);
 }
 
 static int is_exported(const char *name, unsigned long value,
-- 
1.7.4.1
