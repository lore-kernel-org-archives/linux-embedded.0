From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 14(16] pramfs: memory protection
Date: Sun, 10 Oct 2010 18:36:50 +0200
Message-ID: <4CB1EBA2.8090409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=2kRM2BA/yMONyqD2y9PibuxEHxKe+VpaK18vETE+SH0=;
        b=J3xOwzfvQij0K3++67RCs1hMT8SybD6MOiKnHCNmkIJWV/QoSNmyyfx1w+XYa0xwb6
         sUhbofBkPkLZ2/+JGmZpAiodMG2ZDUf+i2enITNzgJJ1M2/1GekIwkIYFFY2i4fTCZf0
         sJACtW/27Jg2IKDoKiSeYrMo5TThYHLzQvhvw=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, linux-mm@kvack.org

From: Marco Stornelli <marco.stornelli@gmail.com>

Memory write protection.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---
diff -Nurp linux-2.6.36-orig/fs/pramfs/wprotect.c linux-2.6.36/fs/pramfs/wprotect.c
--- linux-2.6.36-orig/fs/pramfs/wprotect.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.36/fs/pramfs/wprotect.c	2010-09-26 18:04:07.000000000 +0200
@@ -0,0 +1,31 @@
+/*
+ * FILE NAME fs/pramfs/wprotect.c
+ *
+ * BRIEF DESCRIPTION
+ *
+ * Write protection for the filesystem pages.
+ *
+ * Copyright 2009-2010 Marco Stornelli <marco.stornelli@gmail.com>
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
+#include <linux/io.h>
+#include "pram.h"
+
+void pram_writeable(void *vaddr, unsigned long size, int rw)
+{
+	int ret = 0;
+
+	ret = rw ? write_on_kernel_pte_range((unsigned long)vaddr, size) :
+		    write_off_kernel_pte_range((unsigned long)vaddr, size);
+
+	BUG_ON(ret);
+}
diff -Nurp linux-2.6.36-orig/include/linux/mm.h linux-2.6.36/include/linux/mm.h
--- linux-2.6.36-orig/include/linux/mm.h	2010-09-13 01:07:37.000000000 +0200
+++ linux-2.6.36/include/linux/mm.h	2010-09-14 18:49:52.000000000 +0200
@@ -811,6 +811,11 @@ int follow_phys(struct vm_area_struct *v
 		unsigned int flags, unsigned long *prot, resource_size_t *phys);
 int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
 			void *buf, int len, int write);
+int writeable_kernel_pte_range(unsigned long address, unsigned long size,
+				unsigned int rw);
+
+#define write_on_kernel_pte_range(addr, size) writeable_kernel_pte_range(addr, size, 1)
+#define write_off_kernel_pte_range(addr, size) writeable_kernel_pte_range(addr, size, 0)
  static inline void unmap_shared_mapping_range(struct address_space *mapping,
 		loff_t const holebegin, loff_t const holelen)
diff -Nurp linux-2.6.36-orig/mm/memory.c linux-2.6.36/mm/memory.c
--- linux-2.6.36-orig/mm/memory.c	2010-09-13 01:07:37.000000000 +0200
+++ linux-2.6.36/mm/memory.c	2010-09-14 18:49:52.000000000 +0200
@@ -3587,3 +3587,49 @@ void might_fault(void)
 }
 EXPORT_SYMBOL(might_fault);
 #endif
+
+int writeable_kernel_pte_range(unsigned long address, unsigned long size,
+							      unsigned int rw)
+{
+
+	unsigned long addr = address & PAGE_MASK;
+	unsigned long end = address + size;
+	unsigned long start = addr;
+	int ret = -EINVAL;
+	pgd_t *pgd;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *ptep, pte;
+
+	spin_lock_irq(&init_mm.page_table_lock);
+
+	do {
+		pgd = pgd_offset(&init_mm, address);
+		if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
+			goto out;
+
+		pud = pud_offset(pgd, address);
+		if (pud_none(*pud) || unlikely(pud_bad(*pud)))
+			goto out;
+
+		pmd = pmd_offset(pud, address);
+		if (pmd_none(*pmd) || unlikely(pmd_bad(*pmd)))
+			goto out;
+
+		ptep = pte_offset_kernel(pmd, addr);
+		pte = *ptep;
+		if (pte_present(pte)) {
+			  pte = rw ? pte_mkwrite(pte) : pte_wrprotect(pte);
+			  *ptep = pte;
+		}
+		addr += PAGE_SIZE;
+	} while (addr && (addr < end));
+
+	ret = 0;
+
+out:
+	flush_tlb_kernel_range(start, end);
+	spin_unlock_irq(&init_mm.page_table_lock);
+	return ret;
+}
+EXPORT_SYMBOL(writeable_kernel_pte_range);
 
