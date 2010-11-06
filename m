From: James Hogan <james@albanarts.com>
Subject: Re: [PATCH 02/16 v2] pramfs: super block operations
Date: Sat, 6 Nov 2010 11:16:27 +0000
Message-ID: <20101106111627.GA13497@gandalf.local>
References: <4CD51847.20306@gmail.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CD51847.20306@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Marco,

On Sat, Nov 06, 2010 at 09:56:39AM +0100, Marco Stornelli wrote:
> From: Marco Stornelli <marco.stornelli@gmail.com>
> +static void pram_set_blocksize(struct super_block *sb, unsigned long size)
> +{
> +	int bits;
> +
> +	/*
> +	* We've already validated the user input and the value here must be
> +	* between PRAM_MAX_BLOCK_SIZE and PRAM_MIN_BLOCK_SIZE
> +	* and it must be a power of 2.
> +	*/

Should this comment have spaces after the tabs to be consistent with the
other multiline comments (pram_ioremap) and the coding style?

> +	bits = fls(size) - 1;
> +	sb->s_blocksize_bits = bits;
> +	sb->s_blocksize = (1<<bits);
> +}
> +
> +static inline void *pram_ioremap(phys_addr_t phys_addr, ssize_t size)
> +{
> +	void *retval;
> +
> +	/*
> +	 * NOTE: Userland may not map this resource, we will mark the region so
> +	 * /dev/mem and the sysfs MMIO access will not be allowed. This
> +	 * restriction depends on STRICT_DEVMEM option. If this option is
> +	 * disabled or not available we mark the region only as busy.
> +	 */
> +	retval = request_mem_region_exclusive(phys_addr, size, "pramfs");
> +	if (!retval)
> +		goto fail;
> +
> +	retval = ioremap_nocache(phys_addr, size);
> +
> +	if (retval)
> +		wrprotect(retval, size);
> +fail:
> +	return retval;
> +}

Cheers
James
