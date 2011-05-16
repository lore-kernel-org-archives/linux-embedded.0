From: Alessio Igor Bogani <abogani@kernel.org>
Subject: [PATCH] module: Use binary search in lookup_symbol()
Date: Mon, 16 May 2011 22:23:40 +0200
Message-ID: <1305577420-3685-1-git-send-email-abogani@kernel.org>
References: <BANLkTi=2jW5PHB6QCaddHeZH0P=9PKWosw@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer:in-reply-to:references;
        bh=HFWnEjWjlRuk42+KoDDkQ4qkRFZUssrFQu3WMta9JR4=;
        b=t4dkKSQB447uO9RQCW1+uUMFovR7t79rSL/NEbY8EChCEbq5jbsZXcCib/EPUWDTDl
         RQZ4uyzb6A6P9WA0Q/uqOSolQVsww87pWb/MzlUCZRkXK9Muxenva4tez6YA8Q8wNOAP
         ws3kPBJ1iIPeqWcKYar042WTPTF5ceF1BD2gs=
In-Reply-To: <BANLkTi=2jW5PHB6QCaddHeZH0P=9PKWosw@mail.gmail.com>
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
 kernel/module.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 6a34337..54355c5 100644
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
+	return bsearch(name, start, stop - start,
+			sizeof(struct kernel_symbol), cmp_name);
 }
 
 static int is_exported(const char *name, unsigned long value,
-- 
1.7.4.1
