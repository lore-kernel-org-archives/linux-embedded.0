From: Marco Stornelli <marco.stornelli@coritel.it>
Subject: Re: [PATCH] uio: add ioctl callback
Date: Wed, 12 Nov 2008 15:33:03 +0100
Message-ID: <491AE91F.1000104@coritel.it>
References: <491AE3F7.4050202@neotion.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <491AE3F7.4050202@neotion.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: narmstrong@neotion.com
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

Read the file SubmittingPatches in your kernel documentation folder
before sending a patch. In addition, check the patch with checkpatch
script. You can find the script in the script kernel folder. Send the
patch with the right destination. You can know the names (and emails) of
the maintainers in the MAINTAINER file in the kernel source.

Regards,

Marco


Neil Armstrong wrote:
> Add an ioctl callback to the UIO device class.
> This can be useful when status and data are needed after an interrupt
> occurs.
> 
> Changes :
>  - Add an uio_ioctl method
>  - Add en ioctl entry in uio_info
> 
> Neil Armstrong <narmstrong@neotion.com>
> 
> Index: drivers/uio/uio.c
> ===================================================================
> --- drivers/uio/uio.c    (revision 80)
> +++ drivers/uio/uio.c    (working copy)
> @@ -378,6 +378,17 @@
>      return 0;
>  }
>  
> +static int uio_ioctl(struct inode *inode, struct file *filep, unsigned
> int cmd, unsigned long arg)
> +{
> +    struct uio_listener *listener = filep->private_data;
> +    struct uio_device *idev = listener->dev;
> +   
> +    if (idev->info->ioctl)
> +        return idev->info->ioctl(idev->info, cmd, arg);
> +   
> +    return -ENOSYS;
> +}
> +
>  static ssize_t uio_read(struct file *filep, char __user *buf,
>              size_t count, loff_t *ppos)
>  {
> @@ -575,6 +586,7 @@
>      .mmap        = uio_mmap,
>      .poll        = uio_poll,
>      .fasync        = uio_fasync,
> +   .ioctl      = uio_ioctl,
>  };
>  
>  static int uio_major_init(void)
> Index: include/linux/uio_driver.h
> ===================================================================
> --- include/linux/uio_driver.h    (revision 80)
> +++ include/linux/uio_driver.h    (working copy)
> @@ -68,6 +68,7 @@
>      int (*open)(struct uio_info *info, struct inode *inode);
>      int (*release)(struct uio_info *info, struct inode *inode);
>      int (*irqcontrol)(struct uio_info *info, s32 irq_on);
> +    int (*ioctl)(struct uio_info *info, unsigned int cmd, unsigned long
> arg);
>  };
>  
>  extern int __must_check
> 
