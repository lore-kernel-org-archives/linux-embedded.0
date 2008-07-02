From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: [PATCH 8/23] make section names compatible with -ffunction-sections -fdata-sections: h8300
Date: Wed, 2 Jul 2008 02:36:22 +0200
Message-ID: <200807020236.22585.vda.linux@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:mime-version:content-disposition:content-type
         :content-transfer-encoding:message-id;
        bh=R7P+bX6hdZqrGFpVwzAJosOSTQOHMvmu8/wHXZ8RPFo=;
        b=EJiriHgqzrWq99bRQpyI9Ygt8dL11zofGmOKde3dSwGXfQcbfbk2F2ASSamRST4bt0
         zOXKYfGCMWA7JS8SoxCc9xfSYmssHBF8f2iqGBLKpEvjIyEEMaSD5rJlXxEkj3neh7c+
         /MGiXcIgNvN0StNCm71DXyKqjYKGQDcCSkVQE=
Content-Disposition: inline
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-arch@vger.kernel.org
Cc: Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

The purpose of this patch is to make kernel buildable
with "gcc -ffunction-sections -fdata-sections".
This patch fixes h8300 architecture.

Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
--
vda


--- 0.org/arch/h8300/boot/compressed/head.S	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/h8300/boot/compressed/head.S	Wed Jul  2 00:44:34 2008
@@ -9,7 +9,7 @@
 
 #define SRAM_START 0xff4000
 
-	.section	.text.startup
+	.section	.startup.text
 	.global	startup
 startup:
 	mov.l	#SRAM_START+0x8000, sp
--- 0.org/arch/h8300/boot/compressed/vmlinux.lds	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/h8300/boot/compressed/vmlinux.lds	Wed Jul  2 00:44:34 2008
@@ -4,7 +4,7 @@
         {
         __stext = . ;
 	__text = .;
-	       *(.text.startup)
+	       *(.startup.text)
 	       *(.text)
         __etext = . ;
         }
--- 0.org/arch/h8300/kernel/init_task.c	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/h8300/kernel/init_task.c	Wed Jul  2 00:45:57 2008
@@ -37,6 +37,6 @@
  * "init_task" linker map entry..
  */
 union thread_union init_thread_union
-	__attribute__((__section__(".data.init_task"))) =
+	__attribute__((__section__(".init_task.data"))) =
 		{ INIT_THREAD_INFO(init_task) };
 
--- 0.org/arch/h8300/kernel/vmlinux.lds.S	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/h8300/kernel/vmlinux.lds.S	Wed Jul  2 00:45:57 2008
@@ -101,7 +101,7 @@
 	___data_start = . ;
 
 	. = ALIGN(0x2000) ;
-		*(.data.init_task)
+		*(.init_task.data)
 	. = ALIGN(0x4) ;
 		DATA_DATA
 	. = ALIGN(0x4) ;
