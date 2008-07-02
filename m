From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: [PATCH 6/23] make section names compatible with -ffunction-sections -fdata-sections: cris
Date: Wed, 2 Jul 2008 02:35:33 +0200
Message-ID: <200807020235.33533.vda.linux@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:mime-version:content-disposition:content-type
         :content-transfer-encoding:message-id;
        bh=JokZkMmab0AVbyp+U8berxC7jh+wqZcnljkjfdahRd0=;
        b=cWnXJKJD01uMsm9YG7CBmS05nYSyyW4cruK+5B0VHqWNvWVXHjwNKo2nV68LrQi6+d
         BLlbfHxaS1IufA4UisCOatMMdv38g6weeA06dkHzWBtl+k7hRozWTVG4dNoXSpV8oXhM
         P7WDoYJvfwEaDU1pURNGKHcfAkjeXIBpRmJeA=
Content-Disposition: inline
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-arch@vger.kernel.org
Cc: Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

The purpose of this patch is to make kernel buildable
with "gcc -ffunction-sections -fdata-sections".
This patch fixes cris architecture.

Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
--
vda


--- 0.org/arch/cris/arch-v10/vmlinux.lds.S	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/cris/arch-v10/vmlinux.lds.S	Wed Jul  2 00:45:57 2008
@@ -51,7 +51,7 @@
 	_edata = . ;
 
 	. = ALIGN(PAGE_SIZE);	/* init_task and stack, must be aligned */
-  	.data.init_task : { *(.data.init_task) }
+  	.init_task.data : { *(.init_task.data) }
 
 	. = ALIGN(PAGE_SIZE);	/* Init code and data */
   	__init_begin = .;
--- 0.org/arch/cris/arch-v32/vmlinux.lds.S	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/cris/arch-v32/vmlinux.lds.S	Wed Jul  2 00:45:57 2008
@@ -63,7 +63,7 @@
 	_edata = . ;
 
 	. = ALIGN(PAGE_SIZE);	/* init_task and stack, must be aligned. */
-	.data.init_task : { *(.data.init_task) }
+	.init_task.data : { *(.init_task.data) }
 
 	. = ALIGN(PAGE_SIZE);	/* Init code and data. */
 	__init_begin = .;
--- 0.org/arch/cris/kernel/process.c	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/cris/kernel/process.c	Wed Jul  2 00:45:57 2008
@@ -52,7 +52,7 @@
  * "init_task" linker map entry..
  */
 union thread_union init_thread_union 
-	__attribute__((__section__(".data.init_task"))) =
+	__attribute__((__section__(".init_task.data"))) =
 		{ INIT_THREAD_INFO(init_task) };
 
 /*
