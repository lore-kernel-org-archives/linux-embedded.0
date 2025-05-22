Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E871FE478
	for <linux-embedded@vger.kernel.org>; Thu, 22 May 2025 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955749; cv=pass; b=GJ4e9Vv2mnfWT0LUO8CsGn3FUUGLkSfu3Mchp3pZwS0w1fXyhY6U8ZPLX3NnierD47FZPzakorcwc/kbAfmuLkevr8nT1IXhqIIhlYhiD2qybGblKbNxWAYKC3sdYjW7RokbZB8hZnASy1LMABYaCz9LBn1OsEWecJd5wZk+U7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955749; c=relaxed/simple;
	bh=BYgcdT9DQdXXJJpy4GlII3uliRwUxaBiK4gBQBXYwCo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3rcIZPLorvzcyqu5GEd5rhXf6pSOeEFsiTHlrUVY9EXmh4tOQNoRIrdqa8Mx72hGWRsmT6yH4LLEIYAUSqCGl9QjBhNNgt0YvBoaTh3X41Hgj8aRHrB/mpq1wPu82+EwQiDD5FeBQ7/vcAmCn6VhYpS9cYBAg0l36LcETeV90U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=tfMzIm8q; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="tfMzIm8q"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-q4b3.prod.antispam.mailspamprotection.com; s=arckey; t=1747955746;
	 b=fScArjpx3n+34SSFdZIplZa8kls+nToKH+C8tIjKVV7hsVoJNX/l/jxVAFj5InWsppET0Jz6ST
	  4m156+2jLR8SemYEmYPchW54TrYd+c5GRPNjEEiuI/wrCrjmbTS1MYosvw32tFMiDBMChLwvmH
	  Xc0CVaBHe4X/CsR6GBk/9fO398at2YT06q7qipfhyelAVNuBad+H3ptg+xGnGj0cJc9VJ2eD01
	  us2X25LjRUcuN3tNKZ4glnFaMGZMD/CUslC8SRi4k+XetFdoaWKVucN2NxYUidB674QtlYmqa0
	  peEa7ecTddB6lpGqxSpM2PeJ84SLS8IPNiEwrc5UhLwMLQ==;
ARC-Authentication-Results: i=1; instance-europe-west4-q4b3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-q4b3.prod.antispam.mailspamprotection.com; s=arckey; t=1747955746;
	bh=BYgcdT9DQdXXJJpy4GlII3uliRwUxaBiK4gBQBXYwCo=;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
	  Date:Subject:To:From:DKIM-Signature;
	b=KBlCzDBgD+PXUFDhMjSEp5IYjVkW3CTWHfE+QeKbDahqyKfE+zyRssOXyJL1I8x0npWxn2D0UB
	  Rp/PnRzW9PvK5fqGYSXBM7yIOC3DT46M4g21RONLEh4aVqV8e0+JhX+fSrOWxFLBtD6X9r6ESn
	  9kxAHRLUyBhGB3Ob9nt1XOUA+pypqhpE6mMJQezKe0ONg1AyRU83X0DpDVyIMJtkTRvYjGJdM4
	  Mmpzncf0QgGilC0XGXY2pYsz/k5bu6wQhD7YGQTK8uMzJvAqD6naZmj1d/HZF9j3ys7QW2yDN+
	  1fQGxh27WThB7GSfvscg7/U2RcF7p61njsfG441GE9c7vg==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-q4b3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uIEdC-00000004XVk-1cmw
	for linux-embedded@vger.kernel.org;
	Thu, 22 May 2025 22:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=0qM7g1nZFT1pULQwKXQOFTMakNkre2aphglvcKMLtKI=; b=tfMzIm8qVzTU24+z/Eev7xofy5
	/T4MwGQfVgRtVqJS0eoqGyMvCNd9GXUz4sY6SocoNqvOpufihzUCDBY3jpJjM2RemiZAaGVdNcvlp
	WYoy+eumbs2XeotrFr7jvD6xFIMb7CxIY8Sip1GMcvlJUGtpNf0r3fmhU9ZNKokdLfBc=;
Received: from [80.182.118.140] (port=63630 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uIEd7-000000000KG-1tZ2
	for linux-embedded@vger.kernel.org;
	Thu, 22 May 2025 22:43:13 +0000
From: Francesco Valla <francesco@valla.it>
To: linux-embedded@vger.kernel.org
Subject: [PATCH 1/1] drivers: misc: add driver for bootstage stash
Date: Fri, 23 May 2025 00:42:24 +0200
Message-ID: <20250522224223.358881-3-francesco@valla.it>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522224223.358881-2-francesco@valla.it>
References: <20250522224223.358881-2-francesco@valla.it>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 8c18644ce9f05cbbdea4d7159ef30321
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-q4b3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add support for bootstage stash areas containing boot time data
created by some bootloader (e.g. U-Boot). The driver provides generic
time information through sysfs and platform-specific one through
debugfs.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../bindings/reserved-memory/bootstage.yaml   |  44 +++
 Documentation/misc-devices/bootstage.rst      |  53 ++++
 Documentation/misc-devices/index.rst          |   1 +
 MAINTAINERS                                   |   7 +
 drivers/misc/Kconfig                          |  10 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/bootstage.c                      | 292 ++++++++++++++++++
 drivers/of/platform.c                         |   1 +
 8 files changed, 409 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/bootstage.yaml
 create mode 100644 Documentation/misc-devices/bootstage.rst
 create mode 100644 drivers/misc/bootstage.c

diff --git a/Documentation/devicetree/bindings/reserved-memory/bootstage.yaml b/Documentation/devicetree/bindings/reserved-memory/bootstage.yaml
new file mode 100644
index 000000000000..e71d85c5c2ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/bootstage.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/bootstage.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bootstage stash
+
+description: |
+  This binding represents a reserved memory region containing bootstage stash
+  data generated by a previous bootloader stage.
+
+maintainers:
+  - Francesco Valla <francesco@valla.it>
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: bootstage
+
+  reg:
+    description: page-aligned region of memory containing bootstage stash data
+
+required:
+  - compatible
+  - reg
+  - no-map
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        bootstage: bootstage@12340000 {
+            compatible = "bootstage";
+            reg = <0x00 0x12340000 0x2000>;
+            no-map;
+        };
+    };
diff --git a/Documentation/misc-devices/bootstage.rst b/Documentation/misc-devices/bootstage.rst
new file mode 100644
index 000000000000..2e1bbd31aab8
--- /dev/null
+++ b/Documentation/misc-devices/bootstage.rst
@@ -0,0 +1,53 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+Bootstage driver
+================
+
+The bootstage driver exports interfaces to read from a bootstage stash area
+saved by a bootloader (e.g.: U-Boot) that ran before the Linux kernel.
+
+Two kind of interfaces are exported:
+
+- a sysfs interface for bootloader- and platform-agnostic data
+- a debugfs interface for bootloader- and platform-specific data
+
+
+The sysfs interface
+-------------------
+
+Following sysfs attributes can be found at /sys/devices/platform/<device-name>/:
+
+- start_time_us: bootloader start time in microseconds
+- end_time_us: bootloader end time in microseconds
+
+
+The debugfs interface
+---------------------
+
+Following debugfs interfaces can be found at
+/sys/kernel/debug/bootstage/<device-name>/:
+
+- stages: details on staged bootloader stages, with start time and duration.
+  Example output::
+
+    Mark (us)  Elapsed (us)  Stage
+            0             0  reset
+       183689        183689  SPL
+       489247        305558  end phase
+       506987         17740  board_init_f
+      1257880        750893  board_init_r
+      1622303        364423  eth_common_init
+      1888033        265730  eth_initialize
+      1893077          5044  main_loop
+      4204282       2311205  cli_loop
+
+- accumulated_time: time accumulated during certain bootloader stages.
+  Example output::
+
+    Time (us)  Stage
+         4902  dm_spl
+       322719  dm_f
+         9527  dm_r
+
+The number and type of staged stages are bootloader- and platform-specific.
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 8c5b226d8313..c5ebb3d44505 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -28,3 +28,4 @@ fit into other categories.
    tps6594-pfsm
    uacce
    xilinx_sdfec
+   bootstage
diff --git a/MAINTAINERS b/MAINTAINERS
index f21f1dabb5fe..0bdecd07023a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4203,6 +4203,13 @@ F:	Documentation/ABI/stable/sysfs-class-bluetooth
 F:	include/net/bluetooth/
 F:	net/bluetooth/
 
+BOOTSTAGE DRIVER
+M:	Francesco Valla <francesco@valla.it>
+L:	linux-embedded@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/reserved-memory/bootstage.yaml
+F:	drivers/misc/bootstage.c
+
 BONDING DRIVER
 M:	Jay Vosburgh <jv@jvosburgh.net>
 L:	netdev@vger.kernel.org
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 6b37d61150ee..97cdfa241c0c 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -632,6 +632,16 @@ config MCHP_LAN966X_PCI
 	    - lan966x-miim (MDIO_MSCC_MIIM)
 	    - lan966x-switch (LAN966X_SWITCH)
 
+config BOOTSTAGE
+	tristate "Bootstage stash support"
+	depends on OF_RESERVED_MEM
+	help
+	  This enables the support for a bootstage stash.
+
+	  A bootstage stash can be created by some bootloaders (e.g.: U-Boot) to
+	  store information on its boot timings. This driver provides access to
+	  these information through sysfs and debugsfs interfaces.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index d6c917229c45..3562c1bf701f 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -74,3 +74,4 @@ lan966x-pci-objs		:= lan966x_pci.o
 lan966x-pci-objs		+= lan966x_pci.dtbo.o
 obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
+obj-$(CONFIG_BOOTSTAGE)		+= bootstage.o
diff --git a/drivers/misc/bootstage.c b/drivers/misc/bootstage.c
new file mode 100644
index 000000000000..a106410a56ee
--- /dev/null
+++ b/drivers/misc/bootstage.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 - Francesco Valla <francesco@valla.it>
+ *
+ * Driver for bootstage stash.
+ *
+ * This driver exposes bootstage stash generated by bootloader and/or firmware
+ * stages that run before the Linux kernel.
+ *
+ */
+
+#include <linux/debugfs.h>
+#include <linux/io.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+
+#define BOOTSTAGE_MAGIC		0xb00757a3
+#define BOOTSTAGE_MAX_VERSION	0
+
+enum bootstage_id {
+	BOOTSTAGE_ID_START = 0,
+};
+
+enum bootstage_flags {
+	BOOTSTAGEF_ERROR	= 1 << 0,	/* Error record */
+	BOOTSTAGEF_ALLOC	= 1 << 1,	/* Allocate an id */
+};
+
+struct bootstage_record {
+	ulong time_us;
+	u32 start_us;
+	const char *name;
+	int flags;
+	enum bootstage_id id;
+};
+
+struct bootstage_hdr {
+	u32 version;		/* Boostage stash version */
+	u32 count;		/* Number of records */
+	u32 size;		/* Total data size (non-zero if valid) */
+	u32 magic;		/* Magic number */
+	u32 next_id;		/* Next ID to use for bootstage */
+};
+
+struct bootstage_drvdata {
+	struct bootstage_hdr *hdr;
+	struct bootstage_record *records;
+
+	u32 start_time_us;
+	u32 end_time_us;
+
+	struct dentry *debugfs_dir;
+};
+
+static struct dentry *bootstage_debugfs_dir;
+
+static int stages_show(struct seq_file *m, void *d)
+{
+	struct bootstage_drvdata *drvdata = m->private;
+	struct bootstage_hdr *hdr = drvdata->hdr;
+	struct bootstage_record *rec;
+	u32 prev = 0;
+	int i;
+
+	seq_printf(m, "%13s %13s  %s\n", "Mark (us)", "Elapsed (us)", "Stage");
+
+	for (i = 0, rec = drvdata->records; i < hdr->count; i++, rec++) {
+		if ((rec->id && !rec->start_us) || (i == 0)) {
+			if (prev > rec->time_us)
+				prev = 0;
+			seq_printf(m, "%13lu %13lu  %s\n", rec->time_us,
+				   rec->time_us - prev, rec->name);
+			prev = rec->time_us;
+		}
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(stages);
+
+static int accumulated_time_show(struct seq_file *m, void *d)
+{
+	struct bootstage_drvdata *drvdata = m->private;
+	struct bootstage_hdr *hdr = drvdata->hdr;
+	struct bootstage_record *rec;
+	int i;
+
+	seq_printf(m, "%13s  %s\n", "Time (us)", "Stage");
+
+	for (i = 0, rec = drvdata->records; i < hdr->count; i++, rec++) {
+		if (rec->start_us)
+			seq_printf(m, "%13lu  %s\n", rec->time_us, rec->name);
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(accumulated_time);
+
+static void bootstage_debugfs_init(struct device *dev, struct bootstage_drvdata *drvdata)
+{
+	drvdata->debugfs_dir = debugfs_create_dir(dev_name(dev), bootstage_debugfs_dir);
+	if (IS_ERR(drvdata->debugfs_dir))
+		return;
+
+	debugfs_create_file("stages", 0444, drvdata->debugfs_dir, drvdata, &stages_fops);
+	debugfs_create_file("accumulated_time", 0444, drvdata->debugfs_dir, drvdata,
+			    &accumulated_time_fops);
+}
+
+static void bootstage_debugfs_exit(struct device *dev, struct bootstage_drvdata *drvdata)
+{
+	debugfs_remove_recursive(drvdata->debugfs_dir);
+}
+
+static ssize_t start_time_us_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct bootstage_drvdata *drvdata = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", drvdata->start_time_us);
+}
+static DEVICE_ATTR_RO(start_time_us);
+
+static ssize_t end_time_us_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct bootstage_drvdata *drvdata = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", drvdata->end_time_us);
+}
+static DEVICE_ATTR_RO(end_time_us);
+
+static struct attribute *bootstage_attrs[] = {
+	&dev_attr_start_time_us.attr,
+	&dev_attr_end_time_us.attr,
+	NULL,
+};
+
+static const struct attribute_group bootstage_attr_group = {
+	.attrs = bootstage_attrs,
+};
+
+static int bootstage_parse(struct device *dev, struct bootstage_drvdata *drvdata,
+			   resource_size_t size)
+{
+	const char *str_ptr = (const char *)(drvdata->records + drvdata->hdr->count);
+	const resource_size_t calc_size = (resource_size_t)((void *)str_ptr - (void *)drvdata->hdr);
+	struct bootstage_record *rec;
+	u32 r;
+
+	// Sanity checks on bootstage header
+	if (drvdata->hdr->magic != BOOTSTAGE_MAGIC) {
+		dev_err(dev, "wrong bootstage magic number %08Xh\n", drvdata->hdr->magic);
+		return -EINVAL;
+	} else if (drvdata->hdr->version > BOOTSTAGE_MAX_VERSION) {
+		dev_err(dev, "bootstage version %u not supported\n", drvdata->hdr->version);
+		return -EOPNOTSUPP;
+	} else if (drvdata->hdr->size == 0) {
+		dev_err(dev, "invalid bootstage stash (declared size is zero)\n");
+		return -EINVAL;
+	} else if (drvdata->hdr->size > size) {
+		dev_err(dev, "invalid declared stash size %u (expected: <= %llu)\n",
+			drvdata->hdr->size, size);
+		return -EINVAL;
+	} else if (calc_size > size) {
+		dev_err(dev, "invalid calculated stash size %llu (expected: <= %llu)\n",
+			calc_size, size);
+		return -EINVAL;
+	} else if (drvdata->hdr->count == 0) {
+		dev_info(dev, "bootstage stash has no records\n");
+		return 0;
+	}
+
+	// Set start time to invalid
+	drvdata->start_time_us = 0xFFFFFFFF;
+
+	// Associate names to records, which are placed at the end of the record area
+	for (r = 0, rec = drvdata->records; r < drvdata->hdr->count; r++, rec++) {
+		// Save minimum time, will be used as bootloader enter time
+		if (rec->start_us < drvdata->start_time_us)
+			drvdata->start_time_us = rec->time_us;
+
+		// Save maximum time, will be used as bootloader exit time
+		if (rec->time_us > drvdata->end_time_us)
+			drvdata->end_time_us = rec->time_us;
+
+		if (str_ptr > ((const char *)drvdata->hdr + size)) {
+			dev_err(dev, "name for record %u is corrupted\n", r);
+			return -ENODATA;
+		}
+
+		rec->name = str_ptr;
+		str_ptr += strlen(rec->name) + 1;
+	}
+
+	return 0;
+}
+
+static int bootstage_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reserved_mem *rmem;
+	struct bootstage_drvdata *drvdata;
+	int ret;
+
+	rmem = of_reserved_mem_lookup(dev->of_node);
+	if (!rmem) {
+		dev_err(dev, "failed to lookup reserved memory\n");
+		return -EINVAL;
+	}
+
+	if (!rmem->size || (rmem->size > ULONG_MAX) ||
+	    (rmem->size < sizeof(struct bootstage_hdr))) {
+		dev_err(dev, "invalid memory region size\n");
+		return -EINVAL;
+	}
+
+	if (!PAGE_ALIGNED(rmem->base) || !PAGE_ALIGNED(rmem->size)) {
+		dev_err(dev, "memory region must be page-aligned\n");
+		return -EINVAL;
+	}
+
+	drvdata = devm_kmalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, drvdata);
+
+	drvdata->hdr = devm_memremap(dev, rmem->base, rmem->size, MEMREMAP_WB);
+	if (IS_ERR(drvdata->hdr)) {
+		dev_err(dev, "failed to remap bootstage region\n");
+		return PTR_ERR(drvdata->hdr);
+	}
+
+	drvdata->records =
+		(struct bootstage_record *)((void *)drvdata->hdr + sizeof(struct bootstage_hdr));
+
+	ret = bootstage_parse(dev, drvdata, rmem->size);
+	if (ret)
+		return ret;
+
+	ret = sysfs_create_group(&pdev->dev.kobj, &bootstage_attr_group);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs group\n");
+		return ret;
+	}
+
+	bootstage_debugfs_init(dev, drvdata);
+
+	return 0;
+}
+
+static void bootstage_remove(struct platform_device *pdev)
+{
+	struct bootstage_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	bootstage_debugfs_exit(&pdev->dev, drvdata);
+	sysfs_remove_group(&pdev->dev.kobj, &bootstage_attr_group);
+}
+
+static const struct of_device_id bootstage_of_match[] = {
+	{ .compatible = "bootstage" },
+	{},
+};
+
+static struct platform_driver bootstage_driver = {
+	.probe = bootstage_probe,
+	.remove = bootstage_remove,
+	.driver = {
+		.name = "bootstage",
+		.of_match_table = bootstage_of_match,
+	},
+};
+
+static int __init bootstage_init(void)
+{
+	bootstage_debugfs_dir = debugfs_create_dir(bootstage_driver.driver.name, NULL);
+	return platform_driver_register(&bootstage_driver);
+}
+arch_initcall(bootstage_init);
+
+static void __exit bootstage_exit(void)
+{
+	debugfs_remove_recursive(bootstage_debugfs_dir);
+	platform_driver_unregister(&bootstage_driver);
+}
+module_exit(bootstage_exit)
+
+MODULE_DESCRIPTION("Driver for Bootstage stash.");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Francesco Valla <francesco@valla.it>");
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f77cb19973a5..e19b04733584 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -496,6 +496,7 @@ static const struct of_device_id reserved_mem_matches[] = {
 	{ .compatible = "ramoops" },
 	{ .compatible = "nvmem-rmem" },
 	{ .compatible = "google,open-dice" },
+	{ .compatible = "bootstage" },
 	{}
 };
 
-- 
2.49.0

