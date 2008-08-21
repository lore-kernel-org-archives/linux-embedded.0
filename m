From: Daniel Walker <dwalker@mvista.com>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
Date: Thu, 21 Aug 2008 06:10:58 -0700
Message-ID: <1219324258.23311.14.camel@localhost.localdomain>
References: <48AD00E6.2070505@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD00E6.2070505@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Wed, 2008-08-20 at 22:45 -0700, Jared Hulbert wrote:
> +#define AXFS_GET_BYTETABLE_VAL(desc,index) \
> +  axfs_bytetable_stitch(((struct
> axfs_region_desc)(desc)).table_byte_depth,\
> +  (u8 *)((struct axfs_region_desc)(desc)).virt_addr, index)
> +
> +#define AXFS_GET_NODE_TYPE(sbi,node_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->node_type,\
> +   (node_index))
> +
> +#define AXFS_GET_NODE_INDEX(sbi,node__index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->node_index,\
> +   (node__index))
> +

I think it would be much cleaner to do all these similar macro's as
static inline functions.

Daniel
