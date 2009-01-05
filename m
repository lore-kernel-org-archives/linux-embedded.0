From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH V3 01/17] Squashfs: inode operations
Date: Mon, 5 Jan 2009 16:20:04 +0300
Message-ID: <20090105132004.GB14147@ioremap.net>
References: <E1LJnJn-0002L2-GZ@dylan.lougher.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1LJnJn-0002L2-GZ@dylan.lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com, sfr@canb.auug.org.au

Hi.

On Mon, Jan 05, 2009 at 11:08:23AM +0000, Phillip Lougher (phillip@lougher.demon.co.uk) wrote:
> +int squashfs_read_inode(struct inode *inode, long long ino)
> +{
> +	struct super_block *sb = inode->i_sb;
> +	struct squashfs_sb_info *msblk = sb->s_fs_info;
> +	u64 block = SQUASHFS_INODE_BLK(ino) + msblk->inode_table;
> +	int err, type, offset = SQUASHFS_INODE_OFFSET(ino);
> +	union squashfs_inode squashfs_ino;
> +	struct squashfs_base_inode *sqshb_ino = &squashfs_ino.base;
> +

What's the size of that union? If big enough it will lead to some
problems.

> +	TRACE("Entered squashfs_read_inode\n");
> +
> +	/*
> +	 * Read inode base common to all inode types.
> +	 */
> +	err = squashfs_read_metadata(sb, sqshb_ino, &block,
> +				&offset, sizeof(*sqshb_ino));
> +	if (err < 0)
> +		goto failed_read;
> +
> +	err = squashfs_new_inode(sb, inode, sqshb_ino);
> +	if (err)
> +		goto failed_read;
> +
> +	block = SQUASHFS_INODE_BLK(ino) + msblk->inode_table;
> +	offset = SQUASHFS_INODE_OFFSET(ino);
> +
> +	type = le16_to_cpu(sqshb_ino->inode_type);
> +	switch (type) {
> +	case SQUASHFS_REG_TYPE: {
> +		unsigned int frag_offset, frag_size, frag;
> +		u64 frag_blk;

Above variables can be moved out of the switch, since they are used in
some other cases too.

-- 
	Evgeniy Polyakov
