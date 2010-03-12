From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH] devtmpfs: support !CONFIG_TMPFS
Date: Fri, 12 Mar 2010 14:28:08 +0300
Message-ID: <4B9A2548.7050401@msgid.tls.msk.ru>
References: <1268389504-22179-1-git-send-email-jacmet@sunsite.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1268389504-22179-1-git-send-email-jacmet@sunsite.dk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: kay.sievers@vrfy.org, gregkh@suse.de, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Peter Korsgaard wrote:
> Make devtmpfs available on (embedded) configurations without SHMEM/TMPFS,
> using ramfs instead.
> 
> Saves ~15KB.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
[]> --- a/drivers/base/devtmpfs.c
> +++ b/drivers/base/devtmpfs.c
> @@ -44,7 +45,11 @@ __setup("devtmpfs.mount=", mount_param);
>  static int dev_get_sb(struct file_system_type *fs_type, int flags,
>  		      const char *dev_name, void *data, struct vfsmount *mnt)
>  {
> +#ifdef CONFIG_TMPFS
>  	return get_sb_single(fs_type, flags, data, shmem_fill_super, mnt);
> +#else
> +	return get_sb_single(fs_type, flags, data, ramfs_fill_super, mnt);
> +#endif
>  }

May be completely not to the point or even wrong, but I were
starring at this change for quite some time trying to understand
what's the difference.  Can we do it like this:

#ifdef CONFIG_TMPFS
# define devtmpfs_fill_super shmem_fill_super
#else
# define devtmpfs_fill_super ramfs_fill_super
#endif
  	return get_sb_single(fs_type, flags, data, devtmpfs_fill_super, mnt);

?

Or maybe it's just me... ;)

/mjt
