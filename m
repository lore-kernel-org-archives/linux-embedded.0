Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF06247281
	for <linux-embedded@vger.kernel.org>; Fri, 26 Sep 2025 17:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758908062; cv=none; b=OLkT/9SRiE0Rfbzl1uXfG15XUVRqHa3xmDctb5bsfi3AGp+p0XxZhXstMSnpWYhJ14Trs7FM6RKkYQtx+B92WkagmJ4vYUq8GcKyssMXQ3bCLfWh5jgteWvNYllIrS6Uj3iCLtyHea+g7LfM68/7s+iuO+DBASQazzjpvJuFh3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758908062; c=relaxed/simple;
	bh=nUHBfNtmwOaWh7IVNxpVkjJxa4XD7zXjMJH5zHpKOhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1zVOp6ibZo8DvKhWwcOwf6ATY/iZVYBl4CvDtiggjikMYLkAQ9Z+SNsPVivVYZT1S5SU5yFyKVa4Idg4SsDxHOsoFh/oorl3wjsQRk4Ovf71gh3PxlXR8PKeMb7afAGesIHzZumjglkJhek8DpDmHWbSyBR7XSdBBt05Wb/BrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=bn2GGtrn; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="bn2GGtrn"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso5043444a12.3
        for <linux-embedded@vger.kernel.org>; Fri, 26 Sep 2025 10:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758908058; x=1759512858; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cP3t5mXI6JJSp2Pk9oH+VdWnfucdh9ozyf51WvpfOlQ=;
        b=bn2GGtrnhyhyO70OOdVVlcGJzafS+d/kIsSdQ/eJSlgMs/6gjzB5TPOogJS/r5TK/n
         Id0uDU6VKgKNNwWl93TV2oZMg9cbQ5QRjnIN7ky1SzeaQgNmgMi7XRRCzbFFF3Bf9WOc
         I0zXs7i0a1349d1/NVcVSw17TH4PuHVS0hVku5xxkxZzAeSSALsY1A/On2Auvp/7jvt+
         9stcUfKqnDIo5Xj8qFGZYs/wzdHFeigPTFHnc0dDVI5E2YouY3CnhatPhMYCHBdfgwcu
         lr9lAORF8c/bx5CmAKkAhoAJSGGTjqjU/+vH1/zXrEEjkNAFnrrZwc+3ahzr0lA20IEI
         eS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758908058; x=1759512858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cP3t5mXI6JJSp2Pk9oH+VdWnfucdh9ozyf51WvpfOlQ=;
        b=n82z7buGA6egZz9HAqTPCWI6k0m/r6YcQbLWkaCeUqGPQthICzCFX913Y6OXgtVNZS
         kMA4tbi3jYkr6cX1ydfOhlM91KkAzod3nWdpVolucmHMK/g07+6Cf/Q8zlGBLmMWj/WO
         G8Qte3n3fFA0f3ztuxRchT8nYgqN4ctc87jDNCJHIJr7JxYeF81qPfTRJaLvNPkwzSJO
         CG3SgyT8DfNyzADmaiJRPGUz/KJauFvgHMMiYlbki5Cv1jnEh3BFOijMv2T5Hhpgu3ue
         9cgaGdj9mE300ADGFqdzYQr9KOLmRp8+NS+FuFrOJIOBH5ZK1xmJwS16eBrFh4tfxA0W
         cvLA==
X-Gm-Message-State: AOJu0Yz9rldy+xrAIDVjEJviEndq8BJyR04R/mNeyWM3XLHVjY1et3c1
	ooWEkO2v2ig2IggK6W8AaQ16NtUa7qSksqciy4zNluRyfsPDKkK2ZFRYt/xt8jXCWJn82FydC1h
	TmsDsB8xzpH6W6ZFa919lT1Q7gNaqe+fQLbuRVzW9sEQp1kzLa23hsl8=
X-Gm-Gg: ASbGncsIkJJjLn+e4ZVh8/t5GXeiAAEFXdGfx8p4juzvZK9KX7BwPvTPeiM8d29m4FO
	KTaVjf5+6ilnFcqTt03x8yVkoY0xYEKfEz20uzYi7MneSyXl6nNEinR69IJBl6EvZtpsgBeFp6a
	TDbUUC7khKVjB0SDs/qp7O1XR1mPy7Im/JkVEjuicvP28EWL9SuokIaheXsXIfXc2Ix3mWf27MY
	YJCUN8=
X-Google-Smtp-Source: AGHT+IFAoBeXu6Zg32xL+I/AYYf+iB4tCkBkzRONOT4hecixEcVd3U6q7YXo2QyiTn5nATqdcS5fwLXBad8VsjtqjiQ=
X-Received: by 2002:a05:6402:1ecd:b0:634:c4b5:5d7 with SMTP id
 4fb4d7f45d1cf-634c4b5067dmr2002478a12.34.1758908057374; Fri, 26 Sep 2025
 10:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
 <20250923-bootcache-v1-5-4f86fdc38b4e@thegoodpenguin.co.uk> <362096ec-c5eb-4fe9-8b26-6b280306e0d7@ideasonboard.com>
In-Reply-To: <362096ec-c5eb-4fe9-8b26-6b280306e0d7@ideasonboard.com>
From: Marc Kelly <mkelly@thegoodpenguin.co.uk>
Date: Fri, 26 Sep 2025 18:34:06 +0100
X-Gm-Features: AS18NWBRxHfnDZDMQVbBsPFimu3bGmWaGUldI7DIB8YIxQfrPVCePkDEAhjOo3I
Message-ID: <CAHkF4vQz5=1T4D=cF0zEdrHfgeTq7sfGxbUH_dohvYtG7ANGjw@mail.gmail.com>
Subject: Re: [PATCH PREVIEW RFC 5/6] base: bootcache: Add bootcache memory backend
To: linux-embedded@vger.kernel.org
Cc: Dan Scally <dan.scally@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

There is a yocto build that targets qemuarm64 available at
https://github.com/The-Good-Penguin/TGP-kernel-cache-test which has
the latest patches and a script for generating the test cache data as
a binary for the bootloader to insert into reserved memory.

There are build instructions and it should be able to run with qemu
via the commands shown in the readme in the repo.

If you have any questions don't hesitate to get in touch. Our plan is
to keep the test distro up to date as we add more features etc as it's
a covenant way to test and demo things.

Best regards
Marc.

On Wed, 24 Sept 2025 at 15:42, Dan Scally <dan.scally@ideasonboard.com> wrote:
>
> Hi Andrea
>
> On 23/09/2025 15:23, acampanella-thegoodpenguin wrote:
> > From: Marc Kelly <mkelly@thegoodpenguin.co.uk>
> >
> > bootcache_backend_memory provides a simple memory based backend that can
> > inject data found stored in a reserved-memory block into the bootcache
> > framework.
>
> This looks really cool and I'd like to give it a go; how are you testing it currently? Do you have a
> tool to create the blob that you're putting into the reserved memory that I could take a look at?
>
> Thanks
> Dan
>
> >
> > Signed-off-by: Marc Kelly <mkelly@thegoodpenguin.co.uk>
> > ---
> >   drivers/base/Kconfig                    |   7 +
> >   drivers/base/Makefile                   |   1 +
> >   drivers/base/bootcache_backend_memory.c | 220 ++++++++++++++++++++++++++++++++
> >   3 files changed, 228 insertions(+)
> >
> > diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> > index 1303364993ff4bf7fbbc210243dc6dc48fb1bd83..00c0ea6fa31f2d9a8863c93218a4db7ff87f9c0a 100644
> > --- a/drivers/base/Kconfig
> > +++ b/drivers/base/Kconfig
> > @@ -95,6 +95,13 @@ config BOOTCACHE
> >                 A simple backend for testing and development.
> >                 It does not persist any data externally.
> >
> > +     config BOOTCACHE_BACKEND_MEMORY
> > +             bool "Memory backend"
> > +             help
> > +               A backend that reads the cache data from reserved system memory.
> > +               The reserved memory block is defined in the device tree and is
> > +               assumed to be populated by the bootloader.
> > +
> >       endchoice
> >       endif
> >
> > diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> > index dc87c21cd79468045878c4b3cef5714c12f65ec4..d818e72df290e6772297345efc71082adc04e1f2 100644
> > --- a/drivers/base/Makefile
> > +++ b/drivers/base/Makefile
> > @@ -10,6 +10,7 @@ obj-y                       := component.o core.o bus.o dd.o syscore.o \
> >   obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
> >   obj-$(CONFIG_BOOTCACHE)    += bootcache.o
> >   obj-$(CONFIG_BOOTCACHE_BACKEND_TEST)    += bootcache_backend_test.o
> > +obj-$(CONFIG_BOOTCACHE_BACKEND_MEMORY)    += bootcache_backend_memory.o
> >   obj-$(CONFIG_DEVTMPFS)      += devtmpfs.o
> >   obj-y                       += power/
> >   obj-$(CONFIG_ISA_BUS_API)   += isa.o
> > diff --git a/drivers/base/bootcache_backend_memory.c b/drivers/base/bootcache_backend_memory.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d7a83ce2725bc7aa5f37d5fc3dcd7bea753e4d68
> > --- /dev/null
> > +++ b/drivers/base/bootcache_backend_memory.c
> > @@ -0,0 +1,220 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#define DEBUG 1
> > +#include <linux/unaligned.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/slab.h>
> > +#include <linux/hashtable.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/string.h>
> > +#include <linux/types.h>
> > +#include <linux/errno.h>
> > +#include <linux/kobject.h>
> > +#include <linux/sysfs.h>
> > +
> > +#include <linux/bootcache.h>
> > +
> > +#define DRIVER_NAME "bootcache_memory_backend"
> > +#define BOOTCACHE_MAGIC ('B' << 24 | 'C' << 16 | 'H' << 8 | 'E')
> > +#define BOOTCACHE_MINSIZE 4096
> > +
> > +/*
> > + * This defines a cache entry as stored.
> > + */
> > +struct cache_memory_store_entry {
> > +     u32 key_length;
> > +     u32 data_length;
> > +     u8 data_type;
> > +     u8 data[];
> > +} __packed;
> > +
> > +/*
> > + * The in memory store of multiple cache entries.
> > + */
> > +struct cache_memory_store {
> > +     u32 magic;
> > +     u32 entry_count;
> > +     struct cache_memory_store_entry entries[];
> > +} __packed;
> > +
> > +struct reserved_mem *rmem;
> > +
> > +/*
> > + * This function processes the loaded data and adds each entry to the
> > + * system cache via the callbck.
> > + */
> > +static int memory_backend_load_cache(void)
> > +{
> > +     const struct cache_memory_store *store;
> > +     const u8 *current_ptr;
> > +     const void *max_address;
> > +     u32 entry_count;
> > +     int i;
> > +     int ret;
> > +
> > +     if (!rmem) {
> > +             pr_warn("%s: No bootcache was found\n", DRIVER_NAME);
> > +             return 0;
> > +     }
> > +
> > +     store = ioremap(rmem->base, rmem->size);
> > +     if (!store) {
> > +             pr_warn("%s: Unable to map reserved memory 0x%llx\n", DRIVER_NAME, rmem->base);
> > +             return -ENOMEM;
> > +     }
> > +     max_address = store + rmem->size;
> > +     current_ptr = (const unsigned char *)store->entries;
> > +     entry_count = get_unaligned(&store->entry_count);
> > +
> > +     for (i = 0; i < entry_count; i++) {
> > +             struct cache_memory_store_entry *entry;
> > +             struct bootcache_entry *new_entry = NULL;
> > +             size_t data_length, key_length;
> > +             u8 *src, *dest;
> > +             int j;
> > +
> > +             entry = (struct cache_memory_store_entry *)current_ptr;
> > +             data_length = get_unaligned(&entry->data_length);
> > +             key_length = get_unaligned(&entry->key_length);
> > +
> > +             /* Check if will go outside the bounds */
> > +             if ((current_ptr + sizeof(struct cache_memory_store_entry) +
> > +                             data_length + key_length + 1) > max_address) {
> > +                     ret = -ENOMEM;
> > +                     goto error;
> > +             }
> > +
> > +             new_entry = kzalloc(sizeof(*new_entry), GFP_KERNEL);
> > +             if (!new_entry) {
> > +                     ret = -ENOMEM;
> > +                     goto error;
> > +             }
> > +
> > +             new_entry->len = data_length;
> > +             new_entry->key = kzalloc(key_length+1, GFP_KERNEL);
> > +             new_entry->data = kzalloc(data_length, GFP_KERNEL);
> > +
> > +             if (!new_entry->key || !new_entry->data) {
> > +                     pr_err("%s: Memory Allocation error creating new_entry data\n",
> > +                             DRIVER_NAME);
> > +                     kfree(new_entry->key);
> > +                     kfree(new_entry->data);
> > +                     kfree(new_entry);
> > +                     ret = -ENOMEM;
> > +                     goto error;
> > +             }
> > +             /*
> > +              * Source data is potentially unaligned, so we copy it with the correct
> > +              * access functions
> > +              */
> > +             src = &entry->data[0];
> > +             dest = new_entry->key;
> > +             for (j = 0; j < key_length; j++)
> > +                     *dest++ = get_unaligned(src++);
> > +
> > +             src = &entry->data[key_length+1];
> > +             dest = new_entry->data;
> > +             for (j = 0; j < data_length; j++)
> > +                     *dest++ = get_unaligned(src++);
> > +
> > +             pr_debug("%s: Setting up Entry (%d) with key: %s, data length is %zu\n",
> > +                     DRIVER_NAME, i, new_entry->key, new_entry->len);
> > +
> > +             /* call the framework provided function */
> > +             ret = bootcache_add_entry(new_entry);
> > +             if (ret) {
> > +                     kfree(new_entry->key);
> > +                     kfree(new_entry->data);
> > +                     kfree(new_entry);
> > +                     ret = 0;
> > +             }
> > +
> > +             /* Sanity check we've got space for the next extry */
> > +
> > +             current_ptr += sizeof(struct cache_memory_store_entry) +
> > +                     data_length + key_length + 1;
> > +             if (current_ptr + sizeof(struct cache_memory_store_entry)
> > +                             > max_address) {
> > +                     ret = ret = -ENOMEM;
> > +                     goto error;
> > +             }
> > +     }
> > +
> > +error:
> > +     if (store)
> > +             iounmap((void *)store);
> > +
> > +     return ret;
> > +}
> > +
> > +static struct bootcache_info cache_info = {
> > +     .name = "memory",
> > +     .load_cache = memory_backend_load_cache,
> > +};
> > +
> > +static int bootcache_backend_probe(struct platform_device *pdev)
> > +{
> > +     int ret;
> > +     size_t table_size;
> > +     struct cache_memory_store *temp_store;
> > +     struct device_node *reserved_mem_node;
> > +
> > +     /* Check for the front end being ready */
> > +
> > +     pr_debug("%s: %s\n", DRIVER_NAME, __func__);
> > +
> > +     reserved_mem_node = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
> > +     if (reserved_mem_node) {
> > +             rmem = of_reserved_mem_lookup(reserved_mem_node);
> > +             of_node_put(reserved_mem_node);
> > +     }
> > +
> > +     if (!rmem) {
> > +             pr_err("%s: Failed to find reserved memory region.\n", DRIVER_NAME);
> > +             return -ENOMEM;
> > +     }
> > +     pr_debug("%s: Found reserved cache memory block (%s):\n", DRIVER_NAME, rmem->name);
> > +     pr_debug("%s:  Physical Address: 0x%llx\n", DRIVER_NAME, rmem->base);
> > +     pr_debug("%s:  Size: 0x%llx (%llu bytes)\n", DRIVER_NAME, rmem->size,
> > +             rmem->size);
> > +
> > +     if (rmem->size < BOOTCACHE_MINSIZE) {
> > +             pr_err("%s: reserved memory too small (%llu bytes)\n", DRIVER_NAME, rmem->size);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     ret = bootcache_register_backend(&cache_info);
> > +
> > +     if (ret < 0) {
> > +             pr_err("%s: bootcache_register_backend() failed with error %d\n",
> > +                     DRIVER_NAME, ret);
> > +             return ret;
> > +     }
> > +     pr_info("%s: Backend loaded\n", DRIVER_NAME);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id bootcache_backend_driver_dt_ids[] = {
> > +     { .compatible = "linux,backend-backend-memory", },
> > +     { }
> > +};
> > +
> > +static struct platform_driver bootcache_memory_platform_driver = {
> > +     .probe          = bootcache_backend_probe,
> > +     .driver         = {
> > +             .name   = DRIVER_NAME,
> > +             .of_match_table = of_match_ptr(bootcache_backend_driver_dt_ids),
> > +     },
> > +};
> > +
> > +static int __init bootcache_backend_init(void)
> > +{
> > +     return platform_driver_register(&bootcache_memory_platform_driver);
> > +}
> > +
> > +core_initcall(bootcache_backend_init);
> >
>
>


-- 
Marc Kelly, Engineering Manager
https://www.thegoodpenguin.co.uk

The Good Penguin Ltd is a company registered in England and Wales with
company number 12374667 and VAT number 341687879. Registered office:
The Good Penguin Ltd, Merlin House, Priory Drive, Langstone, Newport,
Wales, NP18 2HJ, UK.
