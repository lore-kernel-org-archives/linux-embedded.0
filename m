From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: [PATCH 4/23] make section names compatible with -ffunction-sections -fdata-sections: avr
Date: Wed, 2 Jul 2008 02:34:38 +0200
Message-ID: <200807020234.38078.vda.linux@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:mime-version:content-disposition:content-type
         :content-transfer-encoding:message-id;
        bh=ld+qU/DsdPORFwjaCsLrqgPsfUu32LfIv4tKRY0hVVY=;
        b=Rk0RLlw37LmNeb9F4crByL8n2jpldLjhl55dL+zwbvV8vWDNnpZf/89NpLTpc1QEau
         a8kfV+WHh/i+eZmnUvVmVeb2FD8SjVuRucqZ6/voiBIprfFftPc2FQqI4+Ie3vr9ix28
         bFO3D819DeP9J7gisnEdEbvLMhHV6EbNAbioI=
Content-Disposition: inline
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-arch@vger.kernel.org
Cc: Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

The purpose of this patch is to make kernel buildable
with "gcc -ffunction-sections -fdata-sections".
This patch fixes avr architecture.

Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
--
vda


--- 0.org/arch/avr32/kernel/init_task.c	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/avr32/kernel/init_task.c	Wed Jul  2 00:45:57 2008
@@ -24,7 +24,7 @@
  * Initial thread structure. Must be aligned on an 8192-byte boundary.
  */
 union thread_union init_thread_union
-	__attribute__((__section__(".data.init_task"))) =
+	__attribute__((__section__(".init_task.data"))) =
 		{ INIT_THREAD_INFO(init_task) };
 
 /*
--- 0.org/arch/avr32/kernel/vmlinux.lds.S	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/avr32/kernel/vmlinux.lds.S	Wed Jul  2 00:45:57 2008
@@ -105,11 +105,11 @@
 		/*
 		 * First, the init task union, aligned to an 8K boundary.
 		 */
-		*(.data.init_task)
+		*(.init_task.data)
 
 		/* Then, the cacheline aligned data */
 		. = ALIGN(L1_CACHE_BYTES);
-		*(.data.cacheline_aligned)
+		*(.cacheline_aligned.data)
 
 		/* And the rest... */
 		*(.data.rel*)
