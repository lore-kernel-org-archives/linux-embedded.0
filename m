From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH v6 1/4] cramfs: direct memory access support
Date: Fri, 13 Oct 2017 18:29:34 +0100
Message-ID: <20171013172934.GG21978@ZenIV.linux.org.uk>
References: <20171012061613.28705-1-nicolas.pitre@linaro.org>
 <20171012061613.28705-2-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20171012061613.28705-2-nicolas.pitre@linaro.org>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

On Thu, Oct 12, 2017 at 02:16:10AM -0400, Nicolas Pitre wrote:

>  static void cramfs_kill_sb(struct super_block *sb)
>  {
>  	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
>  
> -	kill_block_super(sb);
> +	if (IS_ENABLED(CCONFIG_CRAMFS_MTD)) {
> +		if (sbi->mtd_point_size)
> +			mtd_unpoint(sb->s_mtd, 0, sbi->mtd_point_size);
> +		if (sb->s_mtd)
> +			kill_mtd_super(sb);

...

> +	mtd_unpoint(sb->s_mtd, 0, PAGE_SIZE);
> +	err = mtd_point(sb->s_mtd, 0, sbi->size, &sbi->mtd_point_size,
> +			&sbi->linear_virt_addr, &sbi->linear_phys_addr);
> +	if (err || sbi->mtd_point_size != sbi->size) {

What happens if that mtd_point() fails?  Note that ->kill_sb() will be
called anyway and ->mtd_point_size is going to be non-zero here...  Do
we get the second mtd_unpoint(), or am I misreading that code?

This logics does look fishy, but I'm not familiar enough with mtd guts
to tell if that's OK...

Rules regarding ->kill_sb(): any struct super_block instance that
got out of sget() and its ilk will have ->kill_sb() called.  In case of
mtd, it's simply "if that thing got past setting ->s_mtd, it will be
passed to ->kill_sb()".

Note, BTW, that you *must* have generic_shutdown_super() called once on
every reachable path in ->kill_sb().  AFAICS your patch is correct in
that area (all instances with that ->s_type are created either in
mount_bdev() or in mount_mtd(); the former will have non-NULL ->s_bdev,
the latter - non-NULL ->s_mtd), but that's one thing to watch out when
doing any modifications.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
