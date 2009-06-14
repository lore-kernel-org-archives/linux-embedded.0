From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Sun, 14 Jun 2009 09:15:41 +0200
Message-ID: <4A34A39D.20803@gmail.com>
References: <4A33A7EC.6070008@gmail.com> <20090613140459.GC30053@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=T+7DkJd4m5tVYUYXf00J/ZzkPPqJEHudTdgfgAxxvoY=;
        b=n0jfE4+BjLhudBq4BqhdHRaHAvieJis0mU43q1VRr/zvt2TDen3rXynJdnDtDWBTP+
         xYWHgx1VlBIAhH6EfCIZozTwLAwvlJ0xElitG89duyqGBjapMzQbVGNpPrIXBRiTJIXI
         owutFVe/5lRJ3BLsdNcyvHp3V3AffXDOQIc5Q=
In-Reply-To: <20090613140459.GC30053@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Sam Ravnborg wrote:
> On Sat, Jun 13, 2009 at 03:21:48PM +0200, Marco wrote:
>> From: Marco Stornelli <marco.stornelli@gmail.com>
>>
>> +#include <linux/types.h>
>> +
>> +#ifdef __KERNEL__
>> +#include <linux/sched.h>
>> +#include <linux/buffer_head.h>
>> +#include "pram_fs_sb.h"
>> +#endif
> 
> The only reason to have this header file in include/linux/
> is that it is used by userspace.
> So please split it up so we have one header suitable for exporting
> and another header with all the promfs local stuff.
> The latter should be in fs/pramsfs/

Yeah you're right. Actually it's not used by userspace so I think I can
remove the ifdef.

> 
> 
>> +
>> +
>> +/*
>> + * Debug code
>> + */
>> +#ifdef __KERNEL__
>> +#define PFX "pramfs"
>> +#ifdef PRAMFS_DEBUG
>> +#define pram_dbg(format, arg...) \
>> +    printk(KERN_DEBUG PFX ": " format , ## arg)
>> +#else
>> +#define pram_dbg(format, arg...) do {} while (0)
>> +#endif
>> +#define pram_err(format, arg...) \
>> +    printk(KERN_ERR PFX ": " format , ## arg)
>> +#define pram_info(format, arg...) \
>> +    printk(KERN_INFO PFX ": " format , ## arg)
>> +#define pram_warn(format, arg...) \
>> +    printk(KERN_WARNING PFX ": " format , ## arg)
>> +#endif
> 
> For a typical drivers we have some pr_* to avoid the above.
> Can they be used for a filesystem too?

Ok, I'll use them.

> 
>> +
>> +/*
>> + * The PRAM file system magic number
>> + */
>> +#define PRAM_SUPER_MAGIC	0xEFFA
> 
> Move to include/linux/magic.h
> 

Ok.

>> +
>> +/*
>> + * Structure of an inode in PRAMFS
>> + */
>> +struct pram_inode {
>> +	__u32   i_sum;          /* checksum of this inode */
>> +	__u32	i_uid;		/* Owner Uid */
>> +	__u32	i_gid;		/* Group Id */
>> +	__u16	i_mode;		/* File mode */
>> +	__u16	i_links_count;	/* Links count */
>> +	__u32	i_blocks;	/* Blocks count */
>> +	__u32	i_size;		/* Size of data in bytes */
>> +	__u32	i_atime;	/* Access time */
>> +	__u32	i_ctime;	/* Creation time */
>> +	__u32	i_mtime;	/* Modification time */
>> +	__u32	i_dtime;	/* Deletion Time */
>> +
>> +	union {
>> +		struct {
>> +			/*
>> +			 * ptr to row block of 2D block pointer array,
>> +			 * file block #'s 0 to (blocksize/4)^2 - 1.
>> +			 */
>> +			off_t row_block;
> 
> It is my understanding that we shall use: __kernel_off_t
> in exported headers.
> 
> The headers are not added to Kbuild - so it is not exported.
> I assume thats an oversight.
> 
> 	Sam
> 

As I said it shouldn't be an exported header.

Marco


