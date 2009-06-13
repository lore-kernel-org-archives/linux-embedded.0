From: Marco <marco.stornelli@gmail.com>
Subject: [PATCH 13/14] Pramfs: Write protection
Date: Sat, 13 Jun 2009 15:23:01 +0200
Message-ID: <4A33A835.901@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=gd9tOIEuRgcpAiLnS/1HIv9wETYcrP8RVSl7ujAFgOQ=;
        b=Ku5MVVaRw/SPTBb6JJacMS9FonsM269rJofA5oYyKsZfQul8EsZX68U++xLLtYiCZE
         NQ7eEK8ElZnccYAYK3UrzwTsgtmbLBVG1/TTLUGT4zF5otcts7cM50RTyXQkjs9xBPKN
         pD0aTz9pDGGaKrHxQtMuctk71+ccqqxwkGGjM=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS Devel <linux-fsdevel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

From: Marco Stornelli <marco.stornelli@gmail.com>

Write protection.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---

diff -uprN linux-2.6.30-orig/fs/pramfs/wprotect.c linux-2.6.30/fs/pramfs/wprotect.c
--- linux-2.6.30-orig/fs/pramfs/wprotect.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.30/fs/pramfs/wprotect.c	2009-06-13 12:54:16.000000000 +0200
@@ -0,0 +1,84 @@
+/*
+ * FILE NAME fs/pramfs/wprotect.c
+ *
+ * BRIEF DESCRIPTION
+ *
+ * Write protection for the filesystem pages.
+ *
+ * Copyright 2009 Marco Stornelli <marco.stornelli@gmail.com>
+ * Copyright 2003 Sony Corporation
+ * Copyright 2003 Matsushita Electric Industrial Co., Ltd.
+ * 2003-2004 (c) MontaVista Software, Inc. , Steve Longerbeam
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/module.h>
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <asm/pgtable.h>
+#include <asm/pgalloc.h>
+#include <asm/tlbflush.h>
+#include "pram_fs.h"
+
+/* init_mm.page_table_lock must be held before calling! */
+static void pram_page_writeable(unsigned long addr, int rw)
+{
+	pgd_t *pgdp;
+	pud_t *pudp;
+	pmd_t *pmdp;
+	pte_t *ptep;
+
+	pgdp = pgd_offset_k(addr);
+	if (!pgd_none(*pgdp)) {
+		pudp = pud_offset(pgdp, addr);
+		if (!pud_none(*pudp)) {
+			pmdp = pmd_offset(pudp, addr);
+			if (!pmd_none(*pmdp)) {
+				pte_t pte;
+				ptep = pte_offset_kernel(pmdp, addr);
+				pte = *ptep;
+				if (pte_present(pte)) {
+					pte = rw ? pte_mkwrite(pte) :
+						pte_wrprotect(pte);
+					set_pte(ptep, pte);
+				}
+			}
+		}
+	}
+}
+
+/* init_mm.page_table_lock must be held before calling! */
+void pram_writeable(void *vaddr, unsigned long size, int rw)
+{
+	unsigned long addr = (unsigned long)vaddr & PAGE_MASK;
+	unsigned long end = (unsigned long)vaddr + size;
+	unsigned long start = addr;
+
+	do {
+		pram_page_writeable(addr, rw);
+		addr += PAGE_SIZE;
+	} while (addr && (addr < end));
+
+
+	/*
+	 * NOTE: we will always flush just one page (one TLB
+	 * entry) except possibly in one case: when a new
+	 * filesystem is initialized at mount time, when pram_read_super
+	 * calls pram_lock_range to make the super block, inode
+	 * table, and bitmap writeable.
+	 */
+#if defined(CONFIG_ARM) || defined(CONFIG_M68K) || defined(CONFIG_H8300) || \
+	defined(CONFIG_BLACKFIN)
+	/*
+	 * FIXME: so far only these archs have flush_tlb_kernel_page(),
+	 * for the rest just use flush_tlb_kernel_range(). Not ideal
+	 * to use _range() because many archs just flush the whole TLB.
+	 */
+	if (end <= start + PAGE_SIZE)
+		flush_tlb_kernel_page(start);
+	else
+#endif
+		flush_tlb_kernel_range(start, end);
+}

