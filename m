Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B78B26A087
	for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637428; cv=none; b=emx8nTLpIQrE1XOBIPUKNtv6GwOZNCYbUl42ORV7OS6RHvrAHz15UTC0i9gs5uR3qxhOQe+C3FMJYYRwfX04F+Q7JDLXpKNWqGNH7mO7YINGDG9TUYkvPcZGlJlpYC+Qxocof26UExzgTwbIBORXfy+qB+x0TwTGf11g3yDJRvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637428; c=relaxed/simple;
	bh=U6mohqVpod+nBTZyW4dDSUGkYymstOaRTEz+cEiC4Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=WkRagq2ZSP+eqS2SNAIpyoojWu/82uL3CIYGyxSF4QClmL75qNkvIMj5AoZYNE/fXjbuxuKmqR8U1fp5C8eDkt3ExSa1kKZkf3tHehsU9qeR0lfMAcZiIiIbT6arvuX8eab0HL5r5GH/QBCTx6GSv6YeMrk3rZULIlxjOT+jqO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=y1hA59cS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="y1hA59cS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so35236915e9.0
        for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758637424; x=1759242224; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcCzw2Jb6Yw8EddNdei0vfTCiphJLxP5Nk1ulfKoOug=;
        b=y1hA59cSR3yypZPmFV2zwI0/rdsbclDfnzeYw8bs+4NGgk2uIWWkhlUQt/KVfU168V
         fNTJFMygrgxB6qFXpkevM+hVjaXivHCVfO6ZOHdr9msFEEtcP/gFTxsuJbVD2oamPSqB
         HnJwqkg+zPzgBfD1av+8eESVGK6YQrNx+qGzuD+DbBQjNZGG0vSI0Jp0uJuuGUUyzq0L
         93f1W4DBrI8bW4+EAkg17SWvgzkI+4/M36X8VvXM2mszBwgfrlAYfKRCyPOMmwm1Gjhd
         0eLEqW1SWdb3pydtWLL5UKMff6RANjTi9Nwru1AVRB1w+SXXpwuaDD37M/vFyHi5ce4t
         ggvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637424; x=1759242224;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcCzw2Jb6Yw8EddNdei0vfTCiphJLxP5Nk1ulfKoOug=;
        b=tDDyTVPDyQrSre5vtbHWJxzbRjWop704q0WRf37J/8KEIUwpzrAO5z2fAknmqOQr7l
         9Axt6fqnx6/VhAhQ8BFctnULr9i61ZT41qsqy76Obr1RPzklDsi+B8JI3QIlxbeXj7ZY
         BdYga6y6+w23vtGIz6ERBAG6KD/mOEtqagiDOVHfFXpS3nO6+oJJ5JNb2/3qHYATxOO9
         IFQcY+pEAD4gre2sibj7xuIPJ7pVCLXbWO6V3MVZWiNc2n4ntZC+UwQOs59N/MxPUJQj
         TWnRTV3IQ/B3k18eY6gTK796cQiXjRQiF5HJFfSO/WqBvvGNwneIBcdOvHKUMGfSZCz+
         pVXw==
X-Gm-Message-State: AOJu0YzIbRMs7xxkGjNfJUAaqfRjiRQdEE2Au9p4WXOcgcvJNIBv0PZs
	F4mCrvaMFv9HVkSPgvKdX4N1Gm9ttqsZW5mjZ+0d/stqS0uI50om9huR5xKxmPr9gEMO5Ahjfvr
	PabD3VfY=
X-Gm-Gg: ASbGncsDxxfwPHyFAFmRsjH9VnKRJLjAA5QSP0nWImrNksN4yrHB2CEiwOY92ZsU13q
	v0vs9xESuOleeAPmkOP1No7SW917AHg1q5NtXQcncy4no6TL7mU9Yfghgb3bLzKKrTvEiLA2kQu
	iPgyiyUHIeaEQgjXwZrrIm/oT6vCQMWUQVW6X3kqSsdgpfwD2aw24ZMWDnr84T7VpjGACkxSE1g
	+mVBDL+c2R8nuxPz+Ft3sUsFUhSJ3LNfjt4bTpp3lnMojKbSJY6K+WxQ1UGJbTjNvoUegbbIx6+
	lwD5T4pxuH/T/lwgY5Dk04DLlGUpBgyDnzHLrUCNVeEx4nxQYXv1A2guRx2J7pntu1BxmxzFdPm
	xhRQMLCFS38T9/6z/drQsksR6zDE4ic5RMaEjVc3eRDcTi52HYtD5C6y6bPIPm/TpADcp2bF0YA
	qHukCS7moXpLdPQOi14xg=
X-Google-Smtp-Source: AGHT+IGYvSUZKMNKdyiBB7klgjMnXq4vrTsDRCE8ifXmd/Wf3oLTaYjJA+/8+6BDg8TtcU1BaVy7vg==
X-Received: by 2002:a05:600c:470e:b0:45d:da45:50c8 with SMTP id 5b1f17b1804b1-46e1dac813amr24242615e9.29.1758637424175;
        Tue, 23 Sep 2025 07:23:44 -0700 (PDT)
Received: from [127.0.1.1] (cpc145676-lewi19-2-0-cust696.2-4.cable.virginm.net. [82.0.238.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad1b0sm278986535e9.21.2025.09.23.07.23.43
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:23:43 -0700 (PDT)
From: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>
Date: Tue, 23 Sep 2025 15:23:38 +0100
Subject: [PATCH PREVIEW RFC 1/6] base: bootcache: initial commit
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-bootcache-v1-1-4f86fdc38b4e@thegoodpenguin.co.uk>
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
In-Reply-To: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
To: linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758637422; l=13783;
 i=acampanella@thegoodpenguin.co.uk; s=20250829; h=from:subject:message-id;
 bh=U6mohqVpod+nBTZyW4dDSUGkYymstOaRTEz+cEiC4Ps=;
 b=ORk+gRgMWZci+DTbdytW3pruq6Rk06mXBXl51sZWcsh7DsBeEZsHZx0E7cKZJOPSsw4JJA6OP
 aANsdUVbfIqAecaXMS7PGZiWh5jxlAR2YvQJTwbcRmfJueNbLP0u0rk
X-Developer-Key: i=acampanella@thegoodpenguin.co.uk; a=ed25519;
 pk=qruBFipuvuZJTNm9XzFhMz42Q9F+xwyW1On3NgZHwzg=

bootcache provides boot-time key-value cache to help improve
boot performance by allowing drivers to cache expensive computations.

Simple API are provided:
- bootcache_get_u16()/bootcache_set_u16() - retrieve/store u16 values
- bootcache_get_u32()/bootcache_set_u32() - retrieve/store u32 values
- bootcache_get_u64()/bootcache_set_u64() - retrieve/store u64 values
- bootcache_get_string()/bootcache_set_string() - retrieve/store strings
- bootcache_register_backend() - Backend registration
- bootcache_add_entry() - Add cache entry into framework

Signed-off-by: Marc Kelly <mkelly@thegoodpenguin.co.uk>
Signed-off-by: Andrea Campanella <acampanella@thegoodpenguin.co.uk>
---
 MAINTAINERS               |   6 ++
 drivers/base/Kconfig      |  11 +++
 drivers/base/Makefile     |   1 +
 drivers/base/bootcache.c  | 179 +++++++++++++++++++++++++++++++++++++
 include/linux/bootcache.h | 219 ++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 416 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index daf520a13bdf6a991c0160a96620f40308c29ee0..4bf3766b30bbf75214911bd4ce5256a066f05726 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4418,6 +4418,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
 F:	drivers/iio/imu/bmi323/
 
+BOOT CACHE
+M:	Andrea Campanella <acampanella@thegoodpenguin.co.uk>
+S:	Maintained
+F:	drivers/base/bootcache.c
+F:	include/linux/bootcache.h
+
 BPF JIT for ARC
 M:	Shahab Vahedi <list+bpf@vahedi.org>
 L:	bpf@vger.kernel.org
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 064eb52ff7e2d4d8745e9c39882b41dc4cf02a89..da02f95948d880da83c3025addc1e111dbce339a 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -73,6 +73,17 @@ config DEVTMPFS_SAFE
 	  with the PROT_EXEC flag. This can break, for example, non-KMS
 	  video drivers.
 
+config BOOTCACHE
+	bool "Boot-time cache for the kernel"
+	help
+	  Enable a simple key-value cache subsystem for storing boot-time
+	  configuration data. This allows drivers and kernel subsystems to
+	  cache expensive computations during boot, potentially improving
+	  boot performance on subsequent reboots by avoiding redundant
+	  hardware detection and initialization work
+
+	  If unsure, say N.
+
 config STANDALONE
 	bool "Select only drivers that don't need compile-time external firmware"
 	default y
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 8074a10183dcb720a6b820b8476b230716b37f01..10a16e6c2ea1ad778fb7793583b9ee54d2498b2b 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -8,6 +8,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 			   topology.o container.o property.o cacheinfo.o \
 			   swnode.o faux.o
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
+obj-$(CONFIG_BOOTCACHE)    += bootcache.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
 obj-$(CONFIG_ISA_BUS_API)	+= isa.o
diff --git a/drivers/base/bootcache.c b/drivers/base/bootcache.c
new file mode 100644
index 0000000000000000000000000000000000000000..d74ead796b0f50ca9a90e84e7230b9ad6ca896d8
--- /dev/null
+++ b/drivers/base/bootcache.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/hashtable.h>
+#include <linux/string.h>
+#include <linux/stringhash.h>
+#include <linux/types.h>
+#include <linux/spinlock.h>
+#include <linux/errno.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/bootcache.h>
+
+static DEFINE_HASHTABLE(bootcache_table, BOOTCACHE_HASH_BITS);
+static DEFINE_SPINLOCK(bootcache_lock);
+static struct kobject *bootcache_kobj;
+static struct bootcache_info *bootcache_backend;
+static bool bootcache_initilized;
+
+int bootcache_register_backend(struct bootcache_info *bci)
+{
+	int ret;
+
+	if (!bci)
+		return -EINVAL;
+	if (!bci->name)
+		return -EINVAL;
+
+	/* If we're not ready, tell backend to try again later */
+	if (!bootcache_initilized)
+		return -EPROBE_DEFER;
+
+	if (bootcache_backend) {
+		pr_warn("bootcache: Backend '%s' is already registered, cannot register '%s'\n",
+		bootcache_backend->name, bci->name);
+		return -EBUSY;
+	}
+	pr_info("bootcache: Registering backend '%s'\n",
+		bci->name);
+
+	/* Have the backend load and populate the cache store */
+	ret = bci->load_cache();
+
+	if (ret)
+		goto failed_initilize;
+
+	bootcache_backend = bci;
+	return 0;
+
+failed_initilize:
+	return ret;
+}
+EXPORT_SYMBOL(bootcache_register_backend);
+
+int bootcache_get(const char *name, void *buf, size_t *len)
+{
+	struct bootcache_entry *entry;
+	u32 hash;
+	int ret = -ENOENT;
+
+	if (!name || !buf || !len)
+		return -EINVAL;
+
+	hash = full_name_hash(NULL, name, strlen(name));
+
+	spin_lock(&bootcache_lock);
+	hash_for_each_possible(bootcache_table, entry, node, hash) {
+		if (strcmp(entry->key, name) == 0) {
+			if (*len < entry->len) {
+				*len = entry->len;
+				ret = -ENOSPC;
+				goto unlock;
+			}
+			memcpy(buf, entry->data, entry->len);
+			*len = entry->len;
+			ret = 0;
+			goto unlock;
+		}
+	}
+
+unlock:
+	spin_unlock(&bootcache_lock);
+	return ret;
+}
+EXPORT_SYMBOL(bootcache_get);
+
+int bootcache_add_entry(struct bootcache_entry *entry)
+{
+	u32 hash;
+	struct bootcache_entry *existing_entry;
+	int ret = 0;
+
+	hash = full_name_hash(NULL, entry->key, strlen(entry->key));
+
+	spin_lock(&bootcache_lock);
+
+	hash_for_each_possible(bootcache_table, existing_entry, node, hash) {
+		if (strcmp(existing_entry->key, entry->key) == 0) {
+			ret = -EEXIST;  // Key already exists
+			goto unlock;
+		}
+	}
+
+	hash_add(bootcache_table, &entry->node, hash);
+
+unlock:
+	spin_unlock(&bootcache_lock);
+	return ret;
+}
+EXPORT_SYMBOL(bootcache_add_entry);
+
+int bootcache_set(const char *name, const void *data, size_t len)
+{
+	struct bootcache_entry *new_entry;
+	u32 hash;
+	int ret = 0;
+
+	if (!name || !data || !len)
+		return -EINVAL;
+
+	new_entry = kzalloc(sizeof(*new_entry), GFP_KERNEL);
+	if (!new_entry)
+		return -ENOMEM;
+
+	new_entry->key = kstrdup(name, GFP_KERNEL);
+	if (!new_entry->key) {
+		ret = -ENOMEM;
+		goto free;
+	}
+
+	new_entry->data = kmemdup(data, len, GFP_KERNEL);
+	if (!new_entry->data) {
+		ret = -ENOMEM;
+		goto free;
+	}
+
+	new_entry->len = len;
+	ret = bootcache_add_entry(new_entry);
+	if (!ret)
+		return 0;
+
+free:
+	kfree(new_entry->data);
+	kfree(new_entry->key);
+	kfree(new_entry);
+	return ret;
+}
+EXPORT_SYMBOL(bootcache_set);
+
+static ssize_t writeout_store(struct kobject *kobj, struct kobj_attribute *attr,
+			    const char *buf, size_t count)
+{
+	/*Implement persistent storage backend */
+	return count;
+}
+
+static struct kobj_attribute writeout_attr = __ATTR_WO(writeout);
+
+static int __init bootcache_init(void)
+{
+	int ret;
+
+	pr_info("bootcache: backend loaded\n");
+
+	/* Create /sys/kernel/bootcache/writeout */
+	bootcache_kobj = kobject_create_and_add("bootcache", kernel_kobj);
+	if (!bootcache_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_file(bootcache_kobj, &writeout_attr.attr);
+	if (ret) {
+		kobject_put(bootcache_kobj);
+		return ret;
+	}
+	bootcache_initilized = true;
+	return 0;
+}
+core_initcall(bootcache_init);
diff --git a/include/linux/bootcache.h b/include/linux/bootcache.h
new file mode 100644
index 0000000000000000000000000000000000000000..52c07cf09bb87fc6c305485e5409bd235ede4e6e
--- /dev/null
+++ b/include/linux/bootcache.h
@@ -0,0 +1,219 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_BOOTCACHE_H
+#define _LINUX_BOOTCACHE_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_BOOTCACHE
+
+#define BOOTCACHE_HASH_BITS 6  /* 64 buckets */
+
+struct bootcache_entry {
+	struct hlist_node node;
+	char *key;
+	void *data;
+	size_t len;
+};
+
+/**
+ * struct bootcache_info - Structure for registering a boot cache backend.
+ *
+ * @name:   The name of the backend.
+ *
+ * Callbacks:
+ * @load_cache: Callback function to read and populate the framework from the cache.
+ */
+
+struct bootcache_info {
+	const char *name;
+	/* Callback Function Pointers */
+	int (*load_cache)(void);
+};
+
+/**
+ * bootcache_add_entry - Add an entry directly into the hash table
+ * @entry: bootcache_entry structure
+ *
+ * Returns: 0 on success, entry was added, do not free it.
+ *          1 on success but an existing entry was updated,
+ *            free to deallocate entry.
+ */
+int bootcache_add_entry(struct bootcache_entry *entry);
+
+/**
+ * bootcache_register_backend - Register a backend provider with the framework
+ * @bci: bootcache_info structure
+ *
+ * Returns: 0 on success, -EPROBE_DEFER if the frontend is not ready,
+ *          -EBUSY if another backend is already registered,
+ *          -EINVAL on invalid registration information.
+ */
+int bootcache_register_backend(struct bootcache_info *bci);
+
+/**
+ * bootcache_get - Retrieve arbitrary data from the cache
+ * @name: Key to look up
+ * @buf: Buffer to store retrieved data
+ * @len: On input, size of buffer; on output, actual data size
+ *
+ * Returns: 0 on success, -EINVAL for invalid parameters,
+ *          -ENOENT if not found, -ENOSPC if buffer too small
+ */
+int bootcache_get(const char *name, void *buf, size_t *len);
+
+/**
+ * bootcache_set - Store arbitrary data in the cache
+ * @name: Key to store under
+ * @data: Data to store
+ * @len: Length of data
+ *
+ * Returns: 0 on success, -EINVAL for invalid parameters, -ENOMEM on allocation failure
+ */
+int bootcache_set(const char *name, const void *data, size_t len);
+
+#else /* !CONFIG_BOOTCACHE */
+
+static inline int bootcache_get(const char *name, void *buf, size_t *len)
+{
+	return -ENOENT;
+}
+
+static inline int bootcache_set(const char *name, const void *data, size_t len)
+{
+	return -EOPNOTSUPP;
+}
+
+/**
+ * bootcache_get_u16 - Retrieve a u16 value from the cache
+ * @name: Key to look up
+ * @out_val: Pointer to store the retrieved value
+ *
+ * Returns: 0 on success, -EINVAL for invalid parameters, -ENOENT if not found
+ */
+static inline int bootcache_get_u16(const char *name, u16 *out_val)
+{
+	size_t len = sizeof(u16);
+
+	if (IS_ENABLED(CONFIG_BOOTCACHE))
+		return bootcache_get(name, out_val, &len);
+	else
+		return -ENOENT;
+}
+
+/**
+ * bootcache_set_u16 - Store a u16 value in the cache
+ * @name: Key to store under
+ * @val: Value to store
+ *
+ * Returns: 0 on success, -EINVAL for invalid parameters, -ENOMEM on allocation failure
+ */
+static inline int bootcache_set_u16(const char *name, u16 val)
+{
+	if (IS_ENABLED(CONFIG_BOOTCACHE))
+		return bootcache_set(name, &val, sizeof(u16));
+	else
+		return -EOPNOTSUPP;
+}
+
+/**
+ * bootcache_get_u32 - Retrieve a u32 value from the cache
+ * @name: Key to look up
+ * @out_val: Pointer to store the retrieved value
+ *
+ * Returns: 0 on success, -EINVAL for invalid parameters, -ENOENT if not found
+ */
+static inline int bootcache_get_u32(const char *name, u32 *out_val)
+{
+	size_t len = sizeof(u32);
+
+	if (IS_ENABLED(CONFIG_BOOTCACHE))
+		return bootcache_get(name, out_val, &len);
+	else
+		return -ENOENT;
+}
+
+/**
+ * bootcache_set_u32 - Store a u32 value in the cache
+ * @name: Key to store under
+ * @val: Value to store
+ *
+ * Returns: 0 on success, -EINVAL for invalid parameters, -ENOMEM on allocation failure
+ */
+static inline int bootcache_set_u32(const char *name, u32 val)
+{
+	if (IS_ENABLED(CONFIG_BOOTCACHE))
+		return bootcache_set(name, &val, sizeof(u32));
+	else
+		return -EOPNOTSUPP;
+}
+
+/**
+ * bootcache_get_u64 - Retrieve a u64 value from the cache
+ * @name: Key to look up
+ * @out_val: Pointer to store the retrieved value
+ *
+ * Returns: 0 on success, -EINVAL for invalid parameters, -ENOENT if not found
+ */
+static inline int bootcache_get_u64(const char *name, u64 *out_val)
+{
+	size_t len = sizeof(u64);
+
+	if (IS_ENABLED(CONFIG_BOOTCACHE))
+		return bootcache_get(name, out_val, &len);
+	else
+		return -ENOENT;
+}
+
+/**
+ * bootcache_set_u64 - Store a u64 value in the cache
+ * @name: Key to store under
+ * @val: Value to store
+ *
+ * Returns: 0 on success, -EINVAL for invalid parameters, -ENOMEM on allocation failure
+ */
+static inline int bootcache_set_u64(const char *name, u64 val)
+{
+	if (IS_ENABLED(CONFIG_BOOTCACHE))
+		return bootcache_set(name, &val, sizeof(u64));
+	else
+		return -EOPNOTSUPP;
+}
+
+/**
+ * bootcache_get_string - Retrieve a string from the cache
+ * @name: Key to look up
+ * @buf: Buffer to store retrieved string
+ * @buflen: Size of buffer
+ *
+ * Returns: 0 on success, -EINVAL for invalid parameters,
+ *          -ENOENT if not found, -ENOSPC if buffer too small
+ */
+static inline int bootcache_get_string(const char *name, char *buf, size_t buflen)
+{
+	size_t len = buflen;
+
+	if (IS_ENABLED(CONFIG_BOOTCACHE))
+		return bootcache_get(name, buf, &len);
+	else
+		return -ENOENT;
+}
+
+/**
+ * bootcache_set_string - Store a string in the cache
+ * @name: Key to store under
+ * @str: Null-terminated string to store
+ *
+ * Returns: 0 on success, -EINVAL for invalid parameters, -ENOMEM on allocation failure
+ */
+static inline int bootcache_set_string(const char *name, const char *str)
+{
+	if (IS_ENABLED(CONFIG_BOOTCACHE)) {
+		if (!str)
+			return -EINVAL;
+		return bootcache_set(name, str, strlen(str) + 1);
+	} else {
+		return -EOPNOTSUPP;
+	}
+}
+
+#endif /* _LINUX_BOOTCACHE_H */

-- 
2.48.1

