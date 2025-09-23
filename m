Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6B23B609
	for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637430; cv=none; b=qdn9PD8qe8IC94tJmcYQtCldI98nUJ+CghhteefZQwY1ss2tU7tmy4d9ZkcFk4LzU958WbdHugO/qOyCd/C52WIgJ2LOgoXQ9DLKWpvQTN4m29QteZBfkKRE6O/mjj0FYUlC7QnyGHKxnkqrL8o9qzHj8eusw3FaultVNXPE/d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637430; c=relaxed/simple;
	bh=Atquv6v1GznurFUOZEiu7cSXEVZdKycLyvSnCfi1aoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=AdOnBhudN1TAqbsaO6g6XC3vdw/6QHo9sZxYGhbpqAXyQlWPxYSC4weSxBvuwtQ4KhIr8J23KsnoENfsy4wpqWxBs6iTBP6L2EaBCZwQA1l//V+qkmuPeYoAMR30EJb9bPjnQoLLlvcoGczL2E/ax9ltqg/TekDaiWp5Bys2C20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=pw3i/Iyv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="pw3i/Iyv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46c889b310dso26933565e9.0
        for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758637427; x=1759242227; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pVRChFYFqYHbJOQMEkb+zuLKRe+pJwPy9uuGcujkYc=;
        b=pw3i/Iyv7U905UtLgYhsrDpW3VPvj1Lxmtbhg6TCwPuJw1FnZghTY6Sh9qnTVInTLd
         dAMSeD6aSE6QBj0QvIvrINgRijYWiZH0+XBwTQOGPHLKAD68QI7Nn4aOXtjGHDQTy0px
         tBeTwsMbZMYjsvFk9xE0UxX6W+P/ZdRYjcnitBIzebP/EUok6hJaFQt4K34qD8x8h9KF
         8A4jR/z29JT52Jn7kKwFAjzenx3zyiXC5k3vpP16pJlwvHlx3X2++GpFWOFC7VjjU+Ls
         ngKKwMyEfFG/nAdmlYF1kHvaRRxVVet2k/fkv/6fJxKMLH7mtcjyN+q/2gcvCdzgNvYy
         70uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637427; x=1759242227;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pVRChFYFqYHbJOQMEkb+zuLKRe+pJwPy9uuGcujkYc=;
        b=l9RGyfHNmTo7CKK9uq0ILVYWNZECfL1rX8pUp92tzZA8GOBMbLTan+J+CmdC9f4M5H
         WdrYC7r8UnJd/S5Ntv+bnTfBKFV4lf/ACcxkuexSvPwrSJmgKwgYnW17UOjwwe8F7O1v
         lo3k48Lt+DRavKSQ1IoHXgOd2d5JIukKtMP4nwbmIHbM+kzFHykkDz2Nh4tTAMKxoHl8
         p1c8l9OIgtkOa7SgM0395w/SJd3pnA1REHM3z5QPOqKBuon/hG2SnQ/YUC8ldzJI9uhb
         721lU8fKUviUwO4tTkuHn45Mnvsnz5wJKFmc+mOZEzBsFOjeF4lf3zKTzamsv/WNvxLZ
         Ty0Q==
X-Gm-Message-State: AOJu0YwNANrmA7eRIfwNtwvnEPfPMfK9sKRqAVpHsw1JA84oinmiE2hO
	091fBFcRrT+K4uy5fs7XhgyIR/KUVV+cDjSJYR/rC+d4DKjwG5z6gVIZH2b65LBXWrvwW1/LAFA
	b+rHwc9g=
X-Gm-Gg: ASbGncv2HRtlTTMDqj3k6Q0SkDj17x9/HIGNZtckzGg6ygQnxKmY8GzV0GxHmmuL7JH
	oPu9n803doBQ5idawbJsHff4b74NS4jvhLjyzKyuBz2hpCbczLejz4vgQ8OeMf8ZYNYEzODiEO/
	2aA+y4s1AudkAVxEytxIXNKPRv1yKItZ6LmSYCpUmfAl4eHijCIC3lzTghX3dcpl/R2yCX4gVum
	Q1g+mVlZRGRQ/+lEjl1jA5cH8tQTc3nGJhizzQkAm5NX9TtkPBiPj9Kn1p9pUuzDj+GLDnJQ4vD
	fNpxAePlUXom7SXQIATFqFOkOLEVGE6DAYTsoN2g2XAieUK3ZsbP6jyXhhB9cc8i04tDVaROJA5
	L8AY0/Pe7AYLOp3/N/bFXTGJP8bXpYxMIXwonxW2cvbXFehT0pNllWar5F6PTlyn6Zef1lJbD8T
	FIOBKgr4jQax+jvdbb2Gc=
X-Google-Smtp-Source: AGHT+IFvpsgmY2wOjeoywRFbr4gqVfCLvqmmP8DsT1bbmXHlYUwNnefY6oCzR5aJGQ1iUjJmkIyyLg==
X-Received: by 2002:a05:600c:9a3:b0:45b:9b9f:88cb with SMTP id 5b1f17b1804b1-46e1e150ae7mr15573245e9.16.1758637426730;
        Tue, 23 Sep 2025 07:23:46 -0700 (PDT)
Received: from [127.0.1.1] (cpc145676-lewi19-2-0-cust696.2-4.cable.virginm.net. [82.0.238.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad1b0sm278986535e9.21.2025.09.23.07.23.46
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:23:46 -0700 (PDT)
From: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>
Date: Tue, 23 Sep 2025 15:23:42 +0100
Subject: [PATCH PREVIEW RFC 5/6] base: bootcache: Add bootcache memory
 backend
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-bootcache-v1-5-4f86fdc38b4e@thegoodpenguin.co.uk>
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
In-Reply-To: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
To: linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758637422; l=7957;
 i=acampanella@thegoodpenguin.co.uk; s=20250829; h=from:subject:message-id;
 bh=J0sy4g4fIU7F6YCD3BMx8bYfdXlH9lByZqaqSCVMqWM=;
 b=BrV8cjXycjxoXaStKSpHZW4Ak1elMObeha3osf/+lgm2FVssWlEalS2UJAK7rESSbg3GiFDEA
 nfaZPM79nDWBIm7E2+txmrbFCv6ikqkU0CbEFwxI9dLC7o9ANxvkbaE
X-Developer-Key: i=acampanella@thegoodpenguin.co.uk; a=ed25519;
 pk=qruBFipuvuZJTNm9XzFhMz42Q9F+xwyW1On3NgZHwzg=

From: Marc Kelly <mkelly@thegoodpenguin.co.uk>

bootcache_backend_memory provides a simple memory based backend that can
inject data found stored in a reserved-memory block into the bootcache
framework.

Signed-off-by: Marc Kelly <mkelly@thegoodpenguin.co.uk>
---
 drivers/base/Kconfig                    |   7 +
 drivers/base/Makefile                   |   1 +
 drivers/base/bootcache_backend_memory.c | 220 ++++++++++++++++++++++++++++++++
 3 files changed, 228 insertions(+)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 1303364993ff4bf7fbbc210243dc6dc48fb1bd83..00c0ea6fa31f2d9a8863c93218a4db7ff87f9c0a 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -95,6 +95,13 @@ config BOOTCACHE
 		  A simple backend for testing and development.
 		  It does not persist any data externally.
 
+	config BOOTCACHE_BACKEND_MEMORY
+		bool "Memory backend"
+		help
+		  A backend that reads the cache data from reserved system memory.
+		  The reserved memory block is defined in the device tree and is
+		  assumed to be populated by the bootloader.
+
 	endchoice
 	endif
 
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index dc87c21cd79468045878c4b3cef5714c12f65ec4..d818e72df290e6772297345efc71082adc04e1f2 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -10,6 +10,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
 obj-$(CONFIG_BOOTCACHE)    += bootcache.o
 obj-$(CONFIG_BOOTCACHE_BACKEND_TEST)    += bootcache_backend_test.o
+obj-$(CONFIG_BOOTCACHE_BACKEND_MEMORY)    += bootcache_backend_memory.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
 obj-$(CONFIG_ISA_BUS_API)	+= isa.o
diff --git a/drivers/base/bootcache_backend_memory.c b/drivers/base/bootcache_backend_memory.c
new file mode 100644
index 0000000000000000000000000000000000000000..d7a83ce2725bc7aa5f37d5fc3dcd7bea753e4d68
--- /dev/null
+++ b/drivers/base/bootcache_backend_memory.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0
+#define DEBUG 1
+#include <linux/unaligned.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/hashtable.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <linux/bootcache.h>
+
+#define DRIVER_NAME "bootcache_memory_backend"
+#define BOOTCACHE_MAGIC ('B' << 24 | 'C' << 16 | 'H' << 8 | 'E')
+#define BOOTCACHE_MINSIZE 4096
+
+/*
+ * This defines a cache entry as stored.
+ */
+struct cache_memory_store_entry {
+	u32 key_length;
+	u32 data_length;
+	u8 data_type;
+	u8 data[];
+} __packed;
+
+/*
+ * The in memory store of multiple cache entries.
+ */
+struct cache_memory_store {
+	u32 magic;
+	u32 entry_count;
+	struct cache_memory_store_entry entries[];
+} __packed;
+
+struct reserved_mem *rmem;
+
+/*
+ * This function processes the loaded data and adds each entry to the
+ * system cache via the callbck.
+ */
+static int memory_backend_load_cache(void)
+{
+	const struct cache_memory_store *store;
+	const u8 *current_ptr;
+	const void *max_address;
+	u32 entry_count;
+	int i;
+	int ret;
+
+	if (!rmem) {
+		pr_warn("%s: No bootcache was found\n", DRIVER_NAME);
+		return 0;
+	}
+
+	store = ioremap(rmem->base, rmem->size);
+	if (!store) {
+		pr_warn("%s: Unable to map reserved memory 0x%llx\n", DRIVER_NAME, rmem->base);
+		return -ENOMEM;
+	}
+	max_address = store + rmem->size;
+	current_ptr = (const unsigned char *)store->entries;
+	entry_count = get_unaligned(&store->entry_count);
+
+	for (i = 0; i < entry_count; i++) {
+		struct cache_memory_store_entry *entry;
+		struct bootcache_entry *new_entry = NULL;
+		size_t data_length, key_length;
+		u8 *src, *dest;
+		int j;
+
+		entry = (struct cache_memory_store_entry *)current_ptr;
+		data_length = get_unaligned(&entry->data_length);
+		key_length = get_unaligned(&entry->key_length);
+
+		/* Check if will go outside the bounds */
+		if ((current_ptr + sizeof(struct cache_memory_store_entry) +
+				data_length + key_length + 1) > max_address) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		new_entry = kzalloc(sizeof(*new_entry), GFP_KERNEL);
+		if (!new_entry) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		new_entry->len = data_length;
+		new_entry->key = kzalloc(key_length+1, GFP_KERNEL);
+		new_entry->data = kzalloc(data_length, GFP_KERNEL);
+
+		if (!new_entry->key || !new_entry->data) {
+			pr_err("%s: Memory Allocation error creating new_entry data\n",
+				DRIVER_NAME);
+			kfree(new_entry->key);
+			kfree(new_entry->data);
+			kfree(new_entry);
+			ret = -ENOMEM;
+			goto error;
+		}
+		/*
+		 * Source data is potentially unaligned, so we copy it with the correct
+		 * access functions
+		 */
+		src = &entry->data[0];
+		dest = new_entry->key;
+		for (j = 0; j < key_length; j++)
+			*dest++ = get_unaligned(src++);
+
+		src = &entry->data[key_length+1];
+		dest = new_entry->data;
+		for (j = 0; j < data_length; j++)
+			*dest++ = get_unaligned(src++);
+
+		pr_debug("%s: Setting up Entry (%d) with key: %s, data length is %zu\n",
+			DRIVER_NAME, i, new_entry->key, new_entry->len);
+
+		/* call the framework provided function */
+		ret = bootcache_add_entry(new_entry);
+		if (ret) {
+			kfree(new_entry->key);
+			kfree(new_entry->data);
+			kfree(new_entry);
+			ret = 0;
+		}
+
+		/* Sanity check we've got space for the next extry */
+
+		current_ptr += sizeof(struct cache_memory_store_entry) +
+			data_length + key_length + 1;
+		if (current_ptr + sizeof(struct cache_memory_store_entry)
+				> max_address) {
+			ret = ret = -ENOMEM;
+			goto error;
+		}
+	}
+
+error:
+	if (store)
+		iounmap((void *)store);
+
+	return ret;
+}
+
+static struct bootcache_info cache_info = {
+	.name = "memory",
+	.load_cache = memory_backend_load_cache,
+};
+
+static int bootcache_backend_probe(struct platform_device *pdev)
+{
+	int ret;
+	size_t table_size;
+	struct cache_memory_store *temp_store;
+	struct device_node *reserved_mem_node;
+
+	/* Check for the front end being ready */
+
+	pr_debug("%s: %s\n", DRIVER_NAME, __func__);
+
+	reserved_mem_node = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	if (reserved_mem_node) {
+		rmem = of_reserved_mem_lookup(reserved_mem_node);
+		of_node_put(reserved_mem_node);
+	}
+
+	if (!rmem) {
+		pr_err("%s: Failed to find reserved memory region.\n", DRIVER_NAME);
+		return -ENOMEM;
+	}
+	pr_debug("%s: Found reserved cache memory block (%s):\n", DRIVER_NAME, rmem->name);
+	pr_debug("%s:  Physical Address: 0x%llx\n", DRIVER_NAME, rmem->base);
+	pr_debug("%s:  Size: 0x%llx (%llu bytes)\n", DRIVER_NAME, rmem->size,
+		rmem->size);
+
+	if (rmem->size < BOOTCACHE_MINSIZE) {
+		pr_err("%s: reserved memory too small (%llu bytes)\n", DRIVER_NAME, rmem->size);
+		return -ENOMEM;
+	}
+
+	ret = bootcache_register_backend(&cache_info);
+
+	if (ret < 0) {
+		pr_err("%s: bootcache_register_backend() failed with error %d\n",
+			DRIVER_NAME, ret);
+		return ret;
+	}
+	pr_info("%s: Backend loaded\n", DRIVER_NAME);
+
+	return 0;
+}
+
+static const struct of_device_id bootcache_backend_driver_dt_ids[] = {
+	{ .compatible = "linux,backend-backend-memory", },
+	{ }
+};
+
+static struct platform_driver bootcache_memory_platform_driver = {
+	.probe		= bootcache_backend_probe,
+	.driver		= {
+		.name	= DRIVER_NAME,
+		.of_match_table = of_match_ptr(bootcache_backend_driver_dt_ids),
+	},
+};
+
+static int __init bootcache_backend_init(void)
+{
+	return platform_driver_register(&bootcache_memory_platform_driver);
+}
+
+core_initcall(bootcache_backend_init);

-- 
2.48.1

