Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C74347C7
	for <linux-embedded@vger.kernel.org>; Wed, 24 Sep 2025 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724946; cv=none; b=TFtcd2trVBTkxQz2xHmxHngImUU3PPMaXHx8J0jIMYhk2MupcSdMaASIkfgon6EeI5br6fH0n551V3Pu9X4qHFnrvvAttSWcYGwEjJvxWatn4Bo2bLqR4TtAjLn7sfgr5UiMGfPqWd+Y4h0IYja/FomKgVzx1fOkkE57+6WUu9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724946; c=relaxed/simple;
	bh=aZoiILqns9gO2FWmu63b66yxefEOgwTkJWrRog47s3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OK5XX2IEcgfDulYBOh2+6p9jomBJjz8rwofo4slVE0VYBq6xRNiH9Ri0Z56TePyDyFcOmnB8JBnHvTTXnyjFtFft4w4BKS4BQSLsyN0gnwIu3J8WmUw3b+qLCfSLofVJClTimICZndrx13aMXYoAgk8m7LmmoXaVeKmLxjKW9Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eXC+lPZR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eXC+lPZR"
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 876D7596;
	Wed, 24 Sep 2025 16:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758724858;
	bh=aZoiILqns9gO2FWmu63b66yxefEOgwTkJWrRog47s3I=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=eXC+lPZRA7OMXctp/KIl5znDdswp2RnPNWKIgx6MTkGQ1UQWTDxD2ZJZZMspiQyTI
	 WNznKiRfRsu6ZRFli8AbUGVIgI/0kaJHa+hKybGgCplI0tesE9o9gS+O3o/9xSRgUu
	 ZljRY1U4dR9zjmxUsTP1p9uHZ5HcXUN4LgKfwFN8=
Message-ID: <362096ec-c5eb-4fe9-8b26-6b280306e0d7@ideasonboard.com>
Date: Wed, 24 Sep 2025 15:42:19 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PREVIEW RFC 5/6] base: bootcache: Add bootcache memory
 backend
To: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>,
 linux-embedded@vger.kernel.org
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
 <20250923-bootcache-v1-5-4f86fdc38b4e@thegoodpenguin.co.uk>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20250923-bootcache-v1-5-4f86fdc38b4e@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrea

On 23/09/2025 15:23, acampanella-thegoodpenguin wrote:
> From: Marc Kelly <mkelly@thegoodpenguin.co.uk>
> 
> bootcache_backend_memory provides a simple memory based backend that can
> inject data found stored in a reserved-memory block into the bootcache
> framework.

This looks really cool and I'd like to give it a go; how are you testing it currently? Do you have a 
tool to create the blob that you're putting into the reserved memory that I could take a look at?

Thanks
Dan

> 
> Signed-off-by: Marc Kelly <mkelly@thegoodpenguin.co.uk>
> ---
>   drivers/base/Kconfig                    |   7 +
>   drivers/base/Makefile                   |   1 +
>   drivers/base/bootcache_backend_memory.c | 220 ++++++++++++++++++++++++++++++++
>   3 files changed, 228 insertions(+)
> 
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index 1303364993ff4bf7fbbc210243dc6dc48fb1bd83..00c0ea6fa31f2d9a8863c93218a4db7ff87f9c0a 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -95,6 +95,13 @@ config BOOTCACHE
>   		  A simple backend for testing and development.
>   		  It does not persist any data externally.
>   
> +	config BOOTCACHE_BACKEND_MEMORY
> +		bool "Memory backend"
> +		help
> +		  A backend that reads the cache data from reserved system memory.
> +		  The reserved memory block is defined in the device tree and is
> +		  assumed to be populated by the bootloader.
> +
>   	endchoice
>   	endif
>   
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index dc87c21cd79468045878c4b3cef5714c12f65ec4..d818e72df290e6772297345efc71082adc04e1f2 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -10,6 +10,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
>   obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
>   obj-$(CONFIG_BOOTCACHE)    += bootcache.o
>   obj-$(CONFIG_BOOTCACHE_BACKEND_TEST)    += bootcache_backend_test.o
> +obj-$(CONFIG_BOOTCACHE_BACKEND_MEMORY)    += bootcache_backend_memory.o
>   obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
>   obj-y			+= power/
>   obj-$(CONFIG_ISA_BUS_API)	+= isa.o
> diff --git a/drivers/base/bootcache_backend_memory.c b/drivers/base/bootcache_backend_memory.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d7a83ce2725bc7aa5f37d5fc3dcd7bea753e4d68
> --- /dev/null
> +++ b/drivers/base/bootcache_backend_memory.c
> @@ -0,0 +1,220 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define DEBUG 1
> +#include <linux/unaligned.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/hashtable.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/errno.h>
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include <linux/bootcache.h>
> +
> +#define DRIVER_NAME "bootcache_memory_backend"
> +#define BOOTCACHE_MAGIC ('B' << 24 | 'C' << 16 | 'H' << 8 | 'E')
> +#define BOOTCACHE_MINSIZE 4096
> +
> +/*
> + * This defines a cache entry as stored.
> + */
> +struct cache_memory_store_entry {
> +	u32 key_length;
> +	u32 data_length;
> +	u8 data_type;
> +	u8 data[];
> +} __packed;
> +
> +/*
> + * The in memory store of multiple cache entries.
> + */
> +struct cache_memory_store {
> +	u32 magic;
> +	u32 entry_count;
> +	struct cache_memory_store_entry entries[];
> +} __packed;
> +
> +struct reserved_mem *rmem;
> +
> +/*
> + * This function processes the loaded data and adds each entry to the
> + * system cache via the callbck.
> + */
> +static int memory_backend_load_cache(void)
> +{
> +	const struct cache_memory_store *store;
> +	const u8 *current_ptr;
> +	const void *max_address;
> +	u32 entry_count;
> +	int i;
> +	int ret;
> +
> +	if (!rmem) {
> +		pr_warn("%s: No bootcache was found\n", DRIVER_NAME);
> +		return 0;
> +	}
> +
> +	store = ioremap(rmem->base, rmem->size);
> +	if (!store) {
> +		pr_warn("%s: Unable to map reserved memory 0x%llx\n", DRIVER_NAME, rmem->base);
> +		return -ENOMEM;
> +	}
> +	max_address = store + rmem->size;
> +	current_ptr = (const unsigned char *)store->entries;
> +	entry_count = get_unaligned(&store->entry_count);
> +
> +	for (i = 0; i < entry_count; i++) {
> +		struct cache_memory_store_entry *entry;
> +		struct bootcache_entry *new_entry = NULL;
> +		size_t data_length, key_length;
> +		u8 *src, *dest;
> +		int j;
> +
> +		entry = (struct cache_memory_store_entry *)current_ptr;
> +		data_length = get_unaligned(&entry->data_length);
> +		key_length = get_unaligned(&entry->key_length);
> +
> +		/* Check if will go outside the bounds */
> +		if ((current_ptr + sizeof(struct cache_memory_store_entry) +
> +				data_length + key_length + 1) > max_address) {
> +			ret = -ENOMEM;
> +			goto error;
> +		}
> +
> +		new_entry = kzalloc(sizeof(*new_entry), GFP_KERNEL);
> +		if (!new_entry) {
> +			ret = -ENOMEM;
> +			goto error;
> +		}
> +
> +		new_entry->len = data_length;
> +		new_entry->key = kzalloc(key_length+1, GFP_KERNEL);
> +		new_entry->data = kzalloc(data_length, GFP_KERNEL);
> +
> +		if (!new_entry->key || !new_entry->data) {
> +			pr_err("%s: Memory Allocation error creating new_entry data\n",
> +				DRIVER_NAME);
> +			kfree(new_entry->key);
> +			kfree(new_entry->data);
> +			kfree(new_entry);
> +			ret = -ENOMEM;
> +			goto error;
> +		}
> +		/*
> +		 * Source data is potentially unaligned, so we copy it with the correct
> +		 * access functions
> +		 */
> +		src = &entry->data[0];
> +		dest = new_entry->key;
> +		for (j = 0; j < key_length; j++)
> +			*dest++ = get_unaligned(src++);
> +
> +		src = &entry->data[key_length+1];
> +		dest = new_entry->data;
> +		for (j = 0; j < data_length; j++)
> +			*dest++ = get_unaligned(src++);
> +
> +		pr_debug("%s: Setting up Entry (%d) with key: %s, data length is %zu\n",
> +			DRIVER_NAME, i, new_entry->key, new_entry->len);
> +
> +		/* call the framework provided function */
> +		ret = bootcache_add_entry(new_entry);
> +		if (ret) {
> +			kfree(new_entry->key);
> +			kfree(new_entry->data);
> +			kfree(new_entry);
> +			ret = 0;
> +		}
> +
> +		/* Sanity check we've got space for the next extry */
> +
> +		current_ptr += sizeof(struct cache_memory_store_entry) +
> +			data_length + key_length + 1;
> +		if (current_ptr + sizeof(struct cache_memory_store_entry)
> +				> max_address) {
> +			ret = ret = -ENOMEM;
> +			goto error;
> +		}
> +	}
> +
> +error:
> +	if (store)
> +		iounmap((void *)store);
> +
> +	return ret;
> +}
> +
> +static struct bootcache_info cache_info = {
> +	.name = "memory",
> +	.load_cache = memory_backend_load_cache,
> +};
> +
> +static int bootcache_backend_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	size_t table_size;
> +	struct cache_memory_store *temp_store;
> +	struct device_node *reserved_mem_node;
> +
> +	/* Check for the front end being ready */
> +
> +	pr_debug("%s: %s\n", DRIVER_NAME, __func__);
> +
> +	reserved_mem_node = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
> +	if (reserved_mem_node) {
> +		rmem = of_reserved_mem_lookup(reserved_mem_node);
> +		of_node_put(reserved_mem_node);
> +	}
> +
> +	if (!rmem) {
> +		pr_err("%s: Failed to find reserved memory region.\n", DRIVER_NAME);
> +		return -ENOMEM;
> +	}
> +	pr_debug("%s: Found reserved cache memory block (%s):\n", DRIVER_NAME, rmem->name);
> +	pr_debug("%s:  Physical Address: 0x%llx\n", DRIVER_NAME, rmem->base);
> +	pr_debug("%s:  Size: 0x%llx (%llu bytes)\n", DRIVER_NAME, rmem->size,
> +		rmem->size);
> +
> +	if (rmem->size < BOOTCACHE_MINSIZE) {
> +		pr_err("%s: reserved memory too small (%llu bytes)\n", DRIVER_NAME, rmem->size);
> +		return -ENOMEM;
> +	}
> +
> +	ret = bootcache_register_backend(&cache_info);
> +
> +	if (ret < 0) {
> +		pr_err("%s: bootcache_register_backend() failed with error %d\n",
> +			DRIVER_NAME, ret);
> +		return ret;
> +	}
> +	pr_info("%s: Backend loaded\n", DRIVER_NAME);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id bootcache_backend_driver_dt_ids[] = {
> +	{ .compatible = "linux,backend-backend-memory", },
> +	{ }
> +};
> +
> +static struct platform_driver bootcache_memory_platform_driver = {
> +	.probe		= bootcache_backend_probe,
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +		.of_match_table = of_match_ptr(bootcache_backend_driver_dt_ids),
> +	},
> +};
> +
> +static int __init bootcache_backend_init(void)
> +{
> +	return platform_driver_register(&bootcache_memory_platform_driver);
> +}
> +
> +core_initcall(bootcache_backend_init);
> 

