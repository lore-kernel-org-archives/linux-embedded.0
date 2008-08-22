From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: Re: [PATCH 07/10] AXFS: axfs_bdev.c
Date: Fri, 22 Aug 2008 14:54:40 +0200
Message-ID: <20080822125440.GA1396@mx.loc>
References: <48AD010B.6030209@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=m3GZbBE4szTsX+XAzEosBr3j1sWczpVybrnAfS0pAOs=;
        b=ir4aCY59/SE4zA0KYPFAQHasSUvTf+KKf9h2IHjEdrKtZMRNKPDZOLeqQx6ACuR6bJ
         vqU3Dg4+jMxbCmBPVHjgz65ozWkJH5Gt29N4L+6PHEAKfUaoqM4fqSczOUXkaC5ebYW2
         aI2Jj0ZSzg1HtTD/fhYXG+3etdeib9Mm4yhuA=
Content-Disposition: inline
In-Reply-To: <48AD010B.6030209@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Wed, Aug 20, 2008 at 10:45:47PM -0700, Jared Hulbert wrote:
>+/******************************************************************************
>+ *
>+ * axfs_copy_block_data
>+ *
>+ * Description: Helper function to read data from block device
>+ *
>+ * Parameters:
>+ *    (IN) sb - pointer to super block structure.
>+ *
>+ *    (IN) dst_addr - pointer to buffer into which data is to be read.
>+ *
>+ *    (IN) boffset - offset within block device
>+ *
>+ *    (IN) len - length of data to be read
>+ *
>+ * Returns:
>+ *     0 or error number
>+ *
>+ *****************************************************************************/
>+int axfs_copy_block(struct super_block *sb, void *dst_addr, u64 fsoffset,
>+		    u64 len)

mismatch between documentation and implementation WRT the function name ;)


>+{
>+	struct axfs_super *sbi = AXFS_SB(sb);
>+	u64 boffset = AXFS_FSOFFSET_2_DEVOFFSET(sbi, fsoffset);
>+	u64 blocks;
>+	u64 blksize = sb->s_blocksize;
>+	unsigned long dst;
>+	unsigned long src;
>+	sector_t block;
>+	size_t bytes;
>+	struct buffer_head *bh;
>+	u64 copied = 0;
>+
>+	if (len == 0)
>+		return 0;
>+
>+	blocks = len / blksize;
>+	if ((len % blksize) > 0)
>+		blocks += 1;
>+
>+	while (copied < len) {
>+		/* Explicit casting for ARM linker errors. */

did it try to emit some external div()? Is this still needed?
