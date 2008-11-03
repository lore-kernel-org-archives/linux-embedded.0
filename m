From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH V2 11/16] Squashfs: block operations
Date: Mon, 3 Nov 2008 17:11:56 +0300
Message-ID: <20081103141156.GB27263@ioremap.net>
References: <E1Kv0C4-0006HV-DN@dylan>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1Kv0C4-0006HV-DN@dylan>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

Hi.

On Wed, Oct 29, 2008 at 01:49:56AM +0000, Phillip Lougher (phillip@lougher.demon.co.uk) wrote:
> +int squashfs_read_data(struct super_block *sb, void *buffer,
> +			long long index, int length, long long *next_index,
> +			int srclength)
> +{
> +	struct squashfs_sb_info *msblk = sb->s_fs_info;
> +	struct buffer_head **bh;
> +	int offset = index & ((1 << msblk->devblksize_log2) - 1);
> +	long long cur_index = index >> msblk->devblksize_log2;
> +	int avail, bytes, compressed, b = 0, k = 0;
> +	int c_byte = length;
> +
> +	bh = kcalloc((msblk->block_size >> msblk->devblksize_log2) + 1,
> +				sizeof(*bh), GFP_KERNEL);

Could be great to have a memory pool though...

-- 
	Evgeniy Polyakov
