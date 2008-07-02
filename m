From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: [PATCH 11/23] make section names compatible with -ffunction-sections -fdata-sections: mips
Date: Wed, 2 Jul 2008 02:37:36 +0200
Message-ID: <200807020237.36623.vda.linux@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:mime-version:content-disposition:content-type
         :content-transfer-encoding:message-id;
        bh=DVRzGnZ7DSEl1sJs/qt+9JNUKhoXU9DxVZ7gcqXI7+Y=;
        b=mfsf5SYEG8fAzSjrWyYbLSdmVYCXFnznG3WbKNI0l0DaitvjoSDPyr8XzDBGHHIj99
         x56npYiQHi/Wq7J3OwWdRbnP1CX+C09KgWRqnMwDc+gTv8Y1VTtcat7qqKQWTJ0/M5AT
         cFs/79D0fqMRk0v26+TTGWRDFkBn/38OmCDWw=
Content-Disposition: inline
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-arch@vger.kernel.org
Cc: Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

The purpose of this patch is to make kernel buildable
with "gcc -ffunction-sections -fdata-sections".
This patch fixes mips architecture.

Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
--
vda


--- 0.org/arch/mips/kernel/init_task.c	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/mips/kernel/init_task.c	Wed Jul  2 00:45:57 2008
@@ -27,7 +27,7 @@
  * The things we do for performance..
  */
 union thread_union init_thread_union
-	__attribute__((__section__(".data.init_task"),
+	__attribute__((__section__(".init_task.data"),
 	               __aligned__(THREAD_SIZE))) =
 		{ INIT_THREAD_INFO(init_task) };
 
--- 0.org/arch/mips/kernel/vmlinux.lds.S	Wed Jul  2 00:40:41 2008
+++ 1.fixname/arch/mips/kernel/vmlinux.lds.S	Wed Jul  2 00:46:03 2008
@@ -76,7 +76,7 @@
 		 * object file alignment.  Using 32768
 		 */
 		. = ALIGN(_PAGE_SIZE);
-		*(.data.init_task)
+		*(.init_task.data)
 
 		DATA_DATA
 		CONSTRUCTORS
@@ -98,14 +98,14 @@
 	. = ALIGN(_PAGE_SIZE);
 	.data_nosave : {
 		__nosave_begin = .;
-		*(.data.nosave)
+		*(.nosave.data)
 	}
 	. = ALIGN(_PAGE_SIZE);
 	__nosave_end = .;
 
 	. = ALIGN(32);
-	.data.cacheline_aligned : {
-		*(.data.cacheline_aligned)
+	.cacheline_aligned.data : {
+		*(.cacheline_aligned.data)
 	}
 	_edata =  .;			/* End of data section */
 
--- 0.org/arch/mips/lasat/image/head.S	Wed Jul  2 00:40:41 2008
+++ 1.fixname/arch/mips/lasat/image/head.S	Wed Jul  2 00:44:34 2008
@@ -1,7 +1,7 @@
 #include <asm/lasat/head.h>
 
 	.text
-	.section .text.start, "ax"
+	.section .start.text, "ax"
 	.set noreorder
 	.set mips3
 
--- 0.org/arch/mips/lasat/image/romscript.normal	Wed Jul  2 00:40:41 2008
+++ 1.fixname/arch/mips/lasat/image/romscript.normal	Wed Jul  2 00:44:34 2008
@@ -4,7 +4,7 @@
 {
   .text :
   {
-    *(.text.start)
+    *(.start.text)
   }
 
   /* Data in ROM */
