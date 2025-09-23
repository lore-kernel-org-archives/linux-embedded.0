Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE931275AED
	for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637430; cv=none; b=q31TyWr1sdP+5luWHtHrYFUl862DxHt1dhR6hnnE5ZOpcDc2oZlf0LxU9YxZZsCs8bVGL5ysAC3jarRJ/zEg535Ke4pgUv0Ac+zxQHeS3bEClLvghxAYPZmjNRO90TY64wwvgOZuTw4EapXLZ9UEElZWlwGOXUdTi9/3nWIoz14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637430; c=relaxed/simple;
	bh=DQz5WOuDyWJ/9pgCxx9klFI12UGVUIypNjT1QOP1S1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=PSIOgiPAThbAW26OHyKR4mUvQnjtJZ0HtwNbQtcB/BdQ6cheWKzYzD3YBhheu/FhDE8vJWD0UGz/Spsp7ZipoJ/kHN8OYZFTcslFgiAjk6hMSyC1ZsSOiog0fl/Sj9Su9iulrgVYk6jn5w8tt6/QorOv6XgVIYKmY7fXndjcVcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=nkqeJbQY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="nkqeJbQY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e21249891so5408215e9.3
        for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758637426; x=1759242226; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvQYeSzQfQj5aHECD9Cqx9+Ep0RVcFdYogwU0Z3A/wo=;
        b=nkqeJbQYhgHjhluoFVFpCgY82mUEvtag2N9deICltdaHWJdn6IE2MJKXXy7Svrd4gP
         QwGVSv49xQ+sbUxS3UxXSttvzqiivIXMHFyuthZL9HVCKwsHnVV2mo5uGIN0l026Rvwg
         3aiCKDwVt7/tF7H67dNCJEYn0T3RMj4lsRpLBgDMs9yFWKmUh5hVEhoc4N0n5CHD5I6s
         KbdkLspu0nWrRoS+o2vOSrANE75mIHEm6jm+xvg7ff6pv1+qvLrqw9RhKabzW/UYLXNR
         V5KL6o49pyMIp1Uot86sJABJr5zvhIDsUw+ySDozdVUBZk0MHBA6VII+4QO7AbLyZIww
         Twcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637426; x=1759242226;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvQYeSzQfQj5aHECD9Cqx9+Ep0RVcFdYogwU0Z3A/wo=;
        b=N+n2weRVc+9QEj6vv4CbzRHM2LLT97apw+c00vZ+Jh+w++dBGK+Ifi2z/tnC+4tKQt
         8zp+eTDEVgjYBzxC1rkHo4joTeYANaypSPqKqPYu9VlNlqcoE1MTO2+y+b6oo8Y8wxFm
         mmt39L0KOY187rW7zFTlSig5DrgAmVGhWm5oKqwdlvCzjg9L+R+OlIkxJXvooQ8f9CzD
         g7ZoVasIewNY9UAAQHBdYEEN/kGmmbw5turfmZmVfZS7wj8HxBkqIkS9UVH6P58kEosF
         ZCGL8QXADOHRKeIfhqhReyJQFJXkTfSDiQ2u2ca3j2C3Fnbbha5HeZER+QpGDvgQccVE
         qm4A==
X-Gm-Message-State: AOJu0YyA8lC7l+gtBBi5IxwT9cV07W1KEJAR7M0AsrPrWeXIi7jYtLzP
	sSiJXwXZp+ZPw4BAbP7lbDIMlSSHUMopwohj7MjdfWjr7MejMgny4YTsEXwY5ZaHN6Z014l6ka/
	uUAxdBtk=
X-Gm-Gg: ASbGncuEZlnGbj/48DzaOLMd2w6JN1cAo1+AFt5bH0dc3n1KVkWgu+x0FCdeXF7fxcS
	7p/jQ5cAWubRPUEPWh3aNFA1ExHTc1vsCBPjUgjeF9UoMeDL20GI6klSVp/bKck4qzBts6Vg3zx
	+Re5Y/XPncNw+UFiJlZC1r4VJXTLUIGqJiBbRNCEPMDpm1dikUYhb1HZLi1VNCDDf1VUqVgCaZ/
	wgYUPBjYzqksWG5GqUVo7s+G/F5oVLSHuwAQjucKWw1BXcSGDIIaah1cNKb2+7m46YhrDnq1oqA
	A2rjFElVmpT80Xo+Wx8mxJZYnsJLT/+XGHk4tM98gYUWbCy5Ry4R36fYOIIBpJtAJJsrtT8+WIm
	CpfnxmOLyUWL0vwM4pcdnbOjfpN+iMUMEfUuTy22mRC1KBDPlLwhaUhyi7PKhj7CreSNdqMH3c2
	oK7GGwRl0HaGG1K3rnwng=
X-Google-Smtp-Source: AGHT+IHPCYoPU/NLryU9Hre/fpJogpgaDrOfcqAO9GrqIhVfoRFpP3JgOKpSgCjHpEidM8EOtw/Suw==
X-Received: by 2002:a05:600c:1c86:b0:467:f71c:148 with SMTP id 5b1f17b1804b1-46e1dad2753mr31763765e9.33.1758637426129;
        Tue, 23 Sep 2025 07:23:46 -0700 (PDT)
Received: from [127.0.1.1] (cpc145676-lewi19-2-0-cust696.2-4.cable.virginm.net. [82.0.238.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad1b0sm278986535e9.21.2025.09.23.07.23.45
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:23:45 -0700 (PDT)
From: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>
Date: Tue, 23 Sep 2025 15:23:41 +0100
Subject: [PATCH PREVIEW RFC 4/6] base: bootcache: Add bootcache test
 backend
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-bootcache-v1-4-4f86fdc38b4e@thegoodpenguin.co.uk>
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
In-Reply-To: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
To: linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758637422; l=5166;
 i=acampanella@thegoodpenguin.co.uk; s=20250829; h=from:subject:message-id;
 bh=4ntyU+UAGN5JW90NEa3MLMKdDePW+QOu0wrLS7+hK+g=;
 b=loFClDQmuIp335Co+Y2i/sq5hNL7DA8hdzcMVkFDJ20/d9bW1eW8aF3i11manZ8fI2dSo6RB9
 hyvGsTYk/iID46DRXcC6bJFvK6H3unME9iuuEUaaB7NsFbLirFjjcFB
X-Developer-Key: i=acampanella@thegoodpenguin.co.uk; a=ed25519;
 pk=qruBFipuvuZJTNm9XzFhMz42Q9F+xwyW1On3NgZHwzg=

From: Marc Kelly <mkelly@thegoodpenguin.co.uk>

bootcache_backend_test provides a simple test backend of API
demonstration and testing purposes.

Signed-off-by: Marc Kelly <mkelly@thegoodpenguin.co.uk>
---
 MAINTAINERS                           |   2 +
 drivers/base/Kconfig                  |  14 ++++
 drivers/base/Makefile                 |   1 +
 drivers/base/bootcache_backend_test.c | 119 ++++++++++++++++++++++++++++++++++
 4 files changed, 136 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4bf3766b30bbf75214911bd4ce5256a066f05726..73679686d49ac653382ecb32b9b3b500a4509383 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4420,8 +4420,10 @@ F:	drivers/iio/imu/bmi323/
 
 BOOT CACHE
 M:	Andrea Campanella <acampanella@thegoodpenguin.co.uk>
+M:	Marc Kelly <mkelly@thegoodpenguin.co.uk>
 S:	Maintained
 F:	drivers/base/bootcache.c
+F:	drivers/base/bootcache_*
 F:	include/linux/bootcache.h
 
 BPF JIT for ARC
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index da02f95948d880da83c3025addc1e111dbce339a..1303364993ff4bf7fbbc210243dc6dc48fb1bd83 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -84,6 +84,20 @@ config BOOTCACHE
 
 	  If unsure, say N.
 
+	if BOOTCACHE
+	choice
+		prompt "Boot-time cache backend"
+		depends on BOOTCACHE
+
+	config BOOTCACHE_BACKEND_TEST
+		bool "Test backend"
+		help
+		  A simple backend for testing and development.
+		  It does not persist any data externally.
+
+	endchoice
+	endif
+
 config STANDALONE
 	bool "Select only drivers that don't need compile-time external firmware"
 	default y
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 10a16e6c2ea1ad778fb7793583b9ee54d2498b2b..dc87c21cd79468045878c4b3cef5714c12f65ec4 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -9,6 +9,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 			   swnode.o faux.o
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
 obj-$(CONFIG_BOOTCACHE)    += bootcache.o
+obj-$(CONFIG_BOOTCACHE_BACKEND_TEST)    += bootcache_backend_test.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
 obj-$(CONFIG_ISA_BUS_API)	+= isa.o
diff --git a/drivers/base/bootcache_backend_test.c b/drivers/base/bootcache_backend_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..b44b4802fb99aa70c731017c503c6084796e90ae
--- /dev/null
+++ b/drivers/base/bootcache_backend_test.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/hashtable.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <linux/bootcache.h>
+
+#define DRIVER_NAME "bootcache_test_backend"
+
+struct test_data {
+	const char *name;
+	u32 value;
+	size_t data_length;
+};
+
+static struct test_data test_data_array[] = {
+	{
+		.name = "Bootcache Test One",
+		.value = 1234,
+		.data_length = sizeof(u32),
+	},
+	{
+		.name = "Bootcache Test Two",
+		.value = 5678,
+		.data_length = sizeof(u32),
+	},
+	{
+		.name = "Bootcache Test Three",
+		.value = 9012,
+		.data_length = sizeof(u32),
+	},
+	{
+		.name = "Bootcache Test Four",
+		.value = 0xDEADBEEF,
+		.data_length = sizeof(u32),
+	},
+	{
+		.name = "Bootcache Test Five",
+		.value = 0xC0DEBAD0,
+		.data_length = sizeof(u32),
+	}
+};
+
+static int test_backend_load_cache(void)
+{
+
+	struct bootcache_entry *new_entry = NULL;
+	int i;
+	int ret;
+
+	pr_info("%s: Backend local_cache callback\n", DRIVER_NAME);
+
+	/*
+	 * We want to load a bunch of fake data into the cache here
+	 * so that it can be used for testing purposes
+	 */
+	for (i = 0; i < ARRAY_SIZE(test_data_array); i++) {
+		/*
+		 * Print the name and value of the current element.
+		 * Use pr_info for a standard kernel log message.
+		 */
+		new_entry = kzalloc(sizeof(*new_entry), GFP_KERNEL);
+		if (!new_entry)
+			return -ENOMEM;
+
+		new_entry->key = kstrdup(test_data_array[i].name, GFP_KERNEL);
+		if (!new_entry->key) {
+			kfree(new_entry);
+			return -ENOMEM;
+		}
+		new_entry->len = test_data_array[i].data_length;
+		new_entry->data = kmemdup(&test_data_array[i].value,
+			test_data_array[i].data_length, GFP_KERNEL);
+		if (!new_entry->data) {
+			kfree(new_entry->key);
+			kfree(new_entry);
+			return -ENOMEM;
+		}
+
+		/* call the framework provided function */
+		ret = bootcache_add_entry(new_entry);
+		if (ret) {
+			kfree(new_entry->key);
+			kfree(new_entry->data);
+			kfree(new_entry);
+			ret = 0;
+		}
+	}
+	return 0;
+}
+
+static struct bootcache_info cache_info = {
+	.name = "test",
+	.load_cache = test_backend_load_cache,
+};
+
+static int __init bootcache_backend_init(void)
+{
+	int ret;
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
+core_initcall(bootcache_backend_init);

-- 
2.48.1

