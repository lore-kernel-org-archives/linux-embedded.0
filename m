From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: [PATCH 5/23] make section names compatible with -ffunction-sections -fdata-sections: blackfin
Date: Wed, 2 Jul 2008 02:35:07 +0200
Message-ID: <200807020235.08025.vda.linux@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:mime-version:content-disposition:content-type
         :content-transfer-encoding:message-id;
        bh=3sNp+LX13NDbZ7tEXYuWuTvu8Z9Gi9vNgijcTK0HcMI=;
        b=EqxGhtLPxHRnMBgeWzwQWpHizmB6qchLXKkGPtvfcs0tSb/59pn2YYuUdAHX849qjy
         DTiebGdShgO/TKppA2D44mSF3bcjVZ7Pni0xNabaIT1cKbYoqp6DKTtIgfJCqf4iPVmA
         pSU4ilvHxtxUfjcz9iEHcT/Cn9NgVXDipHHAs=
Content-Disposition: inline
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-arch@vger.kernel.org
Cc: Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

The purpose of this patch is to make kernel buildable
with "gcc -ffunction-sections -fdata-sections".
This patch fixes blackfin architecture.

Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
--
vda


--- 0.org/arch/blackfin/kernel/vmlinux.lds.S	Wed Jul  2 00:40:40 2008
+++ 1.fixname/arch/blackfin/kernel/vmlinux.lds.S	Wed Jul  2 00:45:51 2008
@@ -91,7 +91,7 @@
 		__sdata = .;
 		/* This gets done first, so the glob doesn't suck it in */
 		. = ALIGN(32);
-		*(.data.cacheline_aligned)
+		*(.cacheline_aligned.data)
 
 #if !L1_DATA_A_LENGTH
 		. = ALIGN(32);
