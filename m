From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: [PATCH 21/23] make section names compatible with -ffunction-sections -fdata-sections: v850
Date: Wed, 2 Jul 2008 02:42:21 +0200
Message-ID: <200807020242.21960.vda.linux@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:mime-version:content-disposition:content-type
         :content-transfer-encoding:message-id;
        bh=qfOmq35L2AjHBOAQU+j4JMO8cjRi7FxeJDfPygCSG0Y=;
        b=cnjvF6sGFg83ET8AC+gv4GiAKShbzQMqEuh9Q4GyzRTr7fQB+naBO44esE7LNogiN+
         XNqcyDSEM0Vy5g3/lAw5V1a79yU6jXniFBM0sKn91nC9oCQV51QbjIpcYNhepFt+A1IA
         eJu42bF9WUKGelmuoPeL5bVBneSr2E8POQ1Rg=
Content-Disposition: inline
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-arch@vger.kernel.org
Cc: Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

The purpose of this patch is to make kernel buildable
with "gcc -ffunction-sections -fdata-sections".
This patch fixes v850 architecture.

Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
--
vda


--- 0.org/arch/v850/kernel/init_task.c	Wed Jul  2 00:40:42 2008
+++ 1.fixname/arch/v850/kernel/init_task.c	Wed Jul  2 00:45:57 2008
@@ -44,5 +44,5 @@
  * "init_task" linker map entry.
  */
 union thread_union init_thread_union 
-	__attribute__((__section__(".data.init_task"))) =
+	__attribute__((__section__(".init_task.data"))) =
 		{ INIT_THREAD_INFO(init_task) };
--- 0.org/arch/v850/kernel/vmlinux.lds.S	Wed Jul  2 00:40:42 2008
+++ 1.fixname/arch/v850/kernel/vmlinux.lds.S	Wed Jul  2 00:46:26 2008
@@ -95,8 +95,8 @@
 		TEXT_TEXT						      \
 		SCHED_TEXT						      \
 			*(.exit.text)	/* 2.5 convention */		      \
-			*(.text.exit)	/* 2.4 convention */		      \
-			*(.text.lock)					      \
+			*(.exit.text)	/* 2.4 convention */		      \
+			*(.lock.text)					      \
 			*(.exitcall.exit)				      \
 		__real_etext = . ;	/* There may be data after here.  */  \
 		RODATA_CONTENTS						      \
@@ -115,11 +115,11 @@
 		__sdata = . ;						      \
 		DATA_DATA						      \
 			EXIT_DATA	/* 2.5 convention */		      \
-			*(.data.exit)	/* 2.4 convention */		      \
+			*(.exit.data)	/* 2.4 convention */		      \
 		. = ALIGN (16) ;					      \
-		*(.data.cacheline_aligned)				      \
+		*(.cacheline_aligned.data)				      \
 		. = ALIGN (0x2000) ;					      \
-        	*(.data.init_task)					      \
+        	*(.init_task.data)					      \
 		. = ALIGN (0x2000) ;					      \
 		__edata = . ;
 
@@ -160,8 +160,8 @@
 			INIT_TEXT	/* 2.5 convention */		      \
 			__einittext = .;				      \
 			INIT_DATA					      \
-			*(.text.init)	/* 2.4 convention */		      \
-			*(.data.init)					      \
+			*(.init.text)	/* 2.4 convention */		      \
+			*(.init.data)					      \
 		INITCALL_CONTENTS					      \
 		INITRAMFS_CONTENTS
 
@@ -171,7 +171,7 @@
 		. = ALIGN (4096) ;					      \
 		__init_start = . ;					      \
 			INIT_DATA	/* 2.5 convention */		      \
-			*(.data.init)	/* 2.4 convention */		      \
+			*(.init.data)	/* 2.4 convention */		      \
 		__init_end = . ;					      \
 		. = ALIGN (4096) ;
 
@@ -181,7 +181,7 @@
 			_sinittext = .;					      \
 			INIT_TEXT	/* 2.5 convention */		      \
 			_einittext = .;					      \
-			*(.text.init)	/* 2.4 convention */		      \
+			*(.init.text)	/* 2.4 convention */		      \
 		INITCALL_CONTENTS					      \
 		INITRAMFS_CONTENTS
 
