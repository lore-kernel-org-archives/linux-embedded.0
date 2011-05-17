From: Alessio Igor Bogani <abogani@kernel.org>
Subject: [PATCH] module: Use binary search in lookup_symbol()
Date: Tue, 17 May 2011 22:56:03 +0200
Message-ID: <1305665763-3988-1-git-send-email-abogani@kernel.org>
References: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer:in-reply-to:references;
        bh=TunhZGK5osE+AmQaa+5GetdJxLb8l9MUyxNJZ1wumuc=;
        b=AiU/yOYKXwQv9LadF3rHZniqlcj8+rexUAPxYmoO1T7hKeTsmdzCZTfXC+yduYRrZB
         BfBVyM8mCnTTN0Nd8GSlDialYdsr0qR4Bs+zcEf9NNJ41FY4QcbGyru3YMbx7F67ZI5f
         WL4udv0YmRpvzyqLrPxV6yHjMWFGIlXBmXWgY=
In-Reply-To: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>, Alessio Igor Bogani <abogani@kernel.org>

This work was supported by a hardware donation from the CE Linux Forum.

Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
---
 kernel/module.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 1e2b657..795bdc7 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2055,11 +2055,8 @@ static const struct kernel_symbol *lookup_symbol(const char *name,
 	const struct kernel_symbol *start,
 	const struct kernel_symbol *stop)
 {
-	const struct kernel_symbol *ks = start;
-	for (; ks < stop; ks++)
-		if (strcmp(ks->name, name) == 0)
-			return ks;
-	return NULL;
+	return bsearch(name, start, stop - start,
+			sizeof(struct kernel_symbol), cmp_name);
 }
 
 static int is_exported(const char *name, unsigned long value,
-- 
1.7.4.1
