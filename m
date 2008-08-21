From: Sven Wegener <sven.wegener@stealer.net>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Thu, 21 Aug 2008 13:27:57 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0808211325530.12259@titan.stealer.net>
References: <48AD0101.4020505@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD0101.4020505@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Wed, 20 Aug 2008, Jared Hulbert wrote:

> The many different devices AXFS can mount to and the various
> dual device mounting schemes are supported here.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> ---
> +static int __init init_axfs_fs(void)
> +{
> +	axfs_uncompress_init();

one more thing, axfs_uncompress_init() can fail

> +	return register_filesystem(&axfs_fs_type);
> +}
> +
> +static void __exit exit_axfs_fs(void)
> +{
> +	axfs_uncompress_exit();
> +	unregister_filesystem(&axfs_fs_type);
> +}
> +
> +module_init(init_axfs_fs);
> +module_exit(exit_axfs_fs);
> +MODULE_LICENSE("GPL");
