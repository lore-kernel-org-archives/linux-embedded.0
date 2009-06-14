From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 14/14] Pramfs: XIP operations
Date: Sun, 14 Jun 2009 09:16:16 +0200
Message-ID: <4A34A3C0.80103@gmail.com>
References: <4A33A841.6080902@gmail.com> <20090613140647.GD30053@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=oJz5oTm7KeTYgkpqYjbRYreoVlKO5qG3EGI0vIrDq/U=;
        b=Qj/Y7qZdG+0IFh8wAl6QOh75eD7tfOy9+Drkp4NSkYoElDi1kYpgTf6e78l77iz6t+
         kNQMaWMYsdA6YymbCf7wa6kfJASBqnruGMhzQN68ib3KiMt8Mmy0uRFc3g/esUe2SL4Z
         O4qeuJx+RbT6gcVzfAgeEiNhUw2CwaLFs+yWM=
In-Reply-To: <20090613140647.GD30053@uranus.ravnborg.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Sam Ravnborg wrote:
> On Sat, Jun 13, 2009 at 03:23:13PM +0200, Marco wrote:
>> From: Marco Stornelli <marco.stornelli@gmail.com>
>>
>> XIP operations.
>>
>> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
>> ---
>>
>> diff -uprN linux-2.6.30-orig/fs/pramfs/xip.c linux-2.6.30/fs/pramfs/xip.c
>> --- linux-2.6.30-orig/fs/pramfs/xip.c	1970-01-01 01:00:00.000000000 +0100
>> +++ linux-2.6.30/fs/pramfs/xip.c	2009-06-13 12:54:26.000000000 +0200
>> @@ -0,0 +1,90 @@
>> +/*
>> + * FILE NAME fs/pramfs/xip.c
>> + *
>> + * BRIEF DESCRIPTION
>> + *
>> + * XIP operations.
>> + *
>> + * Copyright 2009 Marco Stornelli <marco.stornelli@gmail.com>
>> + * This file is licensed under the terms of the GNU General Public
>> + * License version 2. This program is licensed "as is" without any
>> + * warranty of any kind, whether express or implied.
>> + */
>> +
>> +#include <linux/mm.h>
>> +#include <linux/fs.h>
>> +#include <linux/genhd.h>
>> +#include <linux/buffer_head.h>
>> +#include "pram_fs.h"
>> +#include "xip.h"
>> +
>> +static int pram_find_and_alloc_blocks(struct inode *inode, sector_t iblock,
>> +				     sector_t *data_block, int create)
>> +{
>> +	int err = -EIO;
>> +	off_t block;
>> +
>> +	lock_kernel();
> 
> Can we find other solutions than taking the BKL?
> We are trying to get rid of it.
> 

I know. It wasn't my intention to introduce it but as I said in my first
patch I've done a porting of this code from 2.6.10 and to remove it I
need time to analyze well the code to avoid deadlock and so on. If
someone would like to help me I'd really appreciate it. However I see
the use of BKL even in other recent "mainlined" fs as ext4, so I
preferred to move the porting effort on other areas. However it's the
first item on my todo list.


