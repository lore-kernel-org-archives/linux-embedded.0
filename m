From: Alessio Igor Bogani <abogani@kernel.org>
Subject: Re: [PATCH 0/4] Speed up the symbols' resolution process V4
Date: Wed, 11 May 2011 15:44:41 +0200
Message-ID: <BANLkTimxJNOpwQVZDZ8Vv8rqcDh28v9i6Q@mail.gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
	<BANLkTi=y60Jt3-OMzbxQJzGkvzCzNJfJtA@mail.gmail.com>
	<BANLkTimfFEv+vZ8dYvhG0oj2Q4g+KnG4aA@mail.gmail.com>
	<BANLkTinDiGCaKPtS+ZpKf2swJpParJ4eew@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=5llAT7W04q/Cw05qoFVJhMMq/wMajqIgZsP+u8zrl+E=;
        b=ZQnopr13Wq6Sq6Qp3qiBeJ+cKbViRL3ujU7gdYH4JSPZMRi1rlr5HMFZCsa/bL8l2K
         U3jkkpPY2fqy3L69gqZw74IoP0QgP1FdgYVQ/Id4wTIgpuwxD9nM6sYKDcHLgzgzrKJj
         9i+nCWkNHTo5MomroBYdp6tFxiNFLRPhrjgFU=
In-Reply-To: <BANLkTinDiGCaKPtS+ZpKf2swJpParJ4eew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Dear Mr. Frysinger,

2011/5/11 Alessio Igor Bogani <abogani@kernel.org>:
[...]
>>> this breaks symbol prefixed arches (like Blackfin):
>>> =C2=A0CC =C2=A0 =C2=A0 =C2=A0kernel/softirq.o
>>> /tmp/ccp3A6LU.s: Assembler messages:
>>> /tmp/ccp3A6LU.s:3734: Error: symbol `___ksymtab__local_bh_enable' i=
s
>>> already defined
[...]
>>> name. =C2=A0so rather than "__", use "+".
>
> Sorry I don't think that is a good choice from a long term point of
> view. What do you think to add MODULE_SYMBOL_PREFIX to section names
> instead? In this way symbol and section names should always be
> different also on symbol prefixed archs (which are blackfin and
> h8300).

I'm thinking to something like this:

diff --git a/include/linux/module.h b/include/linux/module.h
index 98ddaf0..c4aa266 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -223,7 +223,7 @@ struct module_use {
 	extern void *__crc_##sym __attribute__((weak));		\
 	static const unsigned long __kcrctab_##sym		\
 	__used							\
-	__attribute__((section("___kcrctab" sec "__"#sym), unused))	\
+	__attribute__((section("___kcrctab" sec "___" MODULE_SYMBOL_PREFIX
#sym), unused))	\
 	=3D (unsigned long) &__crc_##sym;
 #else
 #define __CRC_SYMBOL(sym, sec)
@@ -238,7 +238,7 @@ struct module_use {
 	=3D MODULE_SYMBOL_PREFIX #sym;                    	\
 	static const struct kernel_symbol __ksymtab_##sym	\
 	__used							\
-	__attribute__((section("___ksymtab" sec "__"#sym), unused))	\

+	__attribute__((section("___ksymtab" sec "___" MODULE_SYMBOL_PREFIX
#sym), unused))	\
 	=3D { (unsigned long)&sym, __kstrtab_##sym }

 #define EXPORT_SYMBOL(sym)					\

Could you try this, please?

Thank you very much!

Ciao,
Alessio
