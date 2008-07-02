From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: [PATCH 10/23] make section names compatible with -ffunction-sections -fdata-sections: m32r
Date: Wed, 2 Jul 2008 02:37:14 +0200
Message-ID: <200807020237.14092.vda.linux@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:mime-version:content-disposition:content-type
         :content-transfer-encoding:message-id;
        bh=GkgVGoevnJl/lu0Yv5FNSrX/KQ+Me4DulB78Ey+y9c4=;
        b=FLW6eXFYbQCHVfaLfy1mMzoLeLHVMk0LVvcXjBjaLXjWB8ifHi/H21AbDF1RnKjbk/
         lc4SEj66ECEz3nWVY3FCpQAmqDtTOSpaSVVy/+D461R6DpkFT9jfgz+H3XqpuAt4vthr
         4VHUvUJnaTMg74vNXvu67dL9pBsS4mrFlvuB8=
Content-Disposition: inline
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-arch@vger.kernel.org
Cc: Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

The purpose of this patch is to make kernel buildable
with "gcc -ffunction-sections -fdata-sections".
This patch fixes m32r architecture.

Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
--
vda


--- 0.org/arch/m32r/kernel/init_task.c	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/m32r/kernel/init_task.c	Wed Jul  2 00:45:57 2008
@@ -26,7 +26,7 @@
  * "init_task" linker map entry..
  */
 union thread_union init_thread_union
-	__attribute__((__section__(".data.init_task"))) =
+	__attribute__((__section__(".init_task.data"))) =
 		{ INIT_THREAD_INFO(init_task) };
 
 /*
--- 0.org/arch/m32r/kernel/vmlinux.lds.S	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/m32r/kernel/vmlinux.lds.S	Wed Jul  2 00:46:03 2008
@@ -56,17 +56,17 @@
 
   . = ALIGN(4096);
   __nosave_begin = .;
-  .data_nosave : { *(.data.nosave) }
+  .data_nosave : { *(.nosave.data) }
   . = ALIGN(4096);
   __nosave_end = .;
 
   . = ALIGN(32);
-  .data.cacheline_aligned : { *(.data.cacheline_aligned) }
+  .cacheline_aligned.data : { *(.cacheline_aligned.data) }
 
   _edata = .;			/* End of data section */
 
   . = ALIGN(8192);		/* init_task */
-  .data.init_task : { *(.data.init_task) }
+  .init_task.data : { *(.init_task.data) }
 
   /* will be freed after init */
   . = ALIGN(4096);		/* Init code and data */
