From: Alessio Igor Bogani <abogani@kernel.org>
Subject: [PATCH] module: Use binary search in lookup_symbol()
Date: Wed, 18 May 2011 22:35:59 +0200
Message-ID: <1305750959-3018-1-git-send-email-abogani@kernel.org>
References: <BANLkTim2DBkrFbdR=0a=wGqFPX1O7d+C7g@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer:in-reply-to:references;
        bh=OrWavEIHDuWDekLZlpcGiDVdm5oz9xUc/UDw5UoWdlw=;
        b=fgzveBUszFuHddXMEvDX10Urcy3G3p7VimMyq3D7x3vNAjmciAAaCbYVRkx0Dj0cQx
         uAUSoNf8crsHQud985DcHp5/7wva1odkZ8Rw++uWbYL3cAOafinTFu6uR1zQKInh5Ery
         jlEqZzDM0WXNbIxJA6/In/BzOq+S6hiYQa6cI=
In-Reply-To: <BANLkTim2DBkrFbdR=0a=wGqFPX1O7d+C7g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Greg KH <greg@kroah.com>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>, Christoph Hellwig <hch@infradead.org>, Alessio Igor Bogani <abogani@kernel.org>

The function is_exported() with its helper function lookup_symbol() are used to
verify if a provided symbol is effectively exported by the kernel or by the
modules. Now that both have their symbols sorted we can replace a linear search
with a binary search which provide a considerably speed-up.

This work was supported by a hardware donation from the CE Linux Forum.

Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
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
