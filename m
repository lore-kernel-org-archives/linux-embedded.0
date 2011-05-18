From: Alessio Igor Bogani <abogani@kernel.org>
Subject: (unknown)
Date: Wed, 18 May 2011 20:55:25 +0200
Message-ID: <1305744925-8162-1-git-send-email-abogani@kernel.org>
References: <4DD305B3.3000707@am.sony.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer:in-reply-to:references;
        bh=6LhrhXfTMn1/1ibfz2IW94IHrEGAvUDirfze25I5I2Y=;
        b=K4A+IePJmyH0R/hZGSKY6Rn7a+MOOVx3JAPtjdLh0D/6FRVnewnPD0c1ArVzohawkn
         ThfRaDrU1fCcKFCuBK0VynK2hhyL2iPYno5lPtjtEeaC+t4EApFA1oAoXLgxKSSobNuj
         Fk5Yo53cuoJoAOVYo0/VmO9pO2T6I8TlZ2hG4=
Subject: 
In-Reply-To: <4DD305B3.3000707@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>, Rusty Russell <rusty@rustcorp.com.au>, Tim Bird <tim.bird@am.sony.com>, Christoph Hellwig <hch@infradead.org>
Cc: Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>, Alessio Igor Bogani <abogani@kernel.org>

Dear Mr. Bird, Dear Mr. Kroah-Hartman,

Sorry for my very bad English.

2011/5/18 Tim Bird <tim.bird@am.sony.com>:
[...]
> Alessio - do you have any timings you can share for the speedup?

You can find a little benchmark using ftrace at end of this email:
https://lkml.org/lkml/2011/4/5/341

> On 05/17/2011 04:22 PM, Greg KH wrote:
>> On Tue, May 17, 2011 at 10:56:03PM +0200, Alessio Igor Bogani wrote:
>>> This work was supported by a hardware donation from the CE Linux Forum.
[...]
>> Please explain why you make a change, not just who sponsored the change,
>> that's not very interesting to developers.

You are right. I apologize.

This patch is a missing piece (not essential it is only a further little
optimization) of this little patchset:
https://lkml.org/lkml/2011/4/16/48

Unfortunately I forgot to include this patch in the series (my first error)
then I avoided explaining the changes because I had thought that those were
already enough explained in the cover-letter of the patchset (my second error).

Sorry for my mistakes.

Is this better?

Subject: [PATCH] module: Use binary search in lookup_symbol()

The function is_exported() with its helper function lookup_symbol() are used to
verify if a provided symbol is effectively exported by the kernel or by the
modules. Now that both have their symbols sorted we can replace a linear search
with a binary search which provide a considerably speed-up.

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

Thank you very much!

Ciao,
Alessio
