From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] devtmpfs: support !CONFIG_TMPFS
Date: Tue, 16 Mar 2010 12:00:05 -0700
Message-ID: <20100316190005.GA32555@kroah.com>
References: <1268389504-22179-1-git-send-email-jacmet@sunsite.dk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1268389504-22179-1-git-send-email-jacmet@sunsite.dk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: kay.sievers@vrfy.org, gregkh@suse.de, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Fri, Mar 12, 2010 at 11:25:04AM +0100, Peter Korsgaard wrote:
> Make devtmpfs available on (embedded) configurations without SHMEM/TMPFS,
> using ramfs instead.
> 
> Saves ~15KB.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  drivers/base/Kconfig    |    2 +-
>  drivers/base/devtmpfs.c |    5 +++++
>  fs/ramfs/inode.c        |    2 +-
>  include/linux/ramfs.h   |    2 ++
>  4 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index fd52c48..7e33b16 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -18,7 +18,7 @@ config UEVENT_HELPER_PATH
>  
>  config DEVTMPFS
>  	bool "Maintain a devtmpfs filesystem to mount at /dev"
> -	depends on HOTPLUG && SHMEM && TMPFS
> +	depends on HOTPLUG
>  	help
>  	  This creates a tmpfs filesystem instance early at bootup.
>  	  In this filesystem, the kernel driver core maintains device

With this patch, the Kconfig help text now is incorrect.
Is there a way to explicitly call out in the Kconfig which way devtmpfs
is being created?  How about a multiple selection that chooses either
TMPFS or RAMFS, with the default being TMPFS?

So care to redo this so that people can easily determine what is going
to happen easier than this patch currently causes?

thanks,

greg k-h
