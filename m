From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] document ubiblk's usage of the same ioctl magic as a
 part of UBI
Date: Tue, 06 Sep 2011 07:58:50 +0300
Message-ID: <1315285135.19067.59.camel@sauron>
References: <1314202540-5562-1-git-send-email-david.wagner@free-electrons.com>
	 <1314202916-6982-1-git-send-email-david.wagner@free-electrons.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:message-id
         :mime-version;
        bh=PCIOcKCuJZIvk79i6vxZ6YHkUZ4zKNxmV2Wi4dmA82U=;
        b=k/ww7SUAaK7fvnFGUCVrc4Z5WLyxkXsZ1XFwRtxnbnDB5dEblY8hDBvXTUeeXOYPwk
         yzv8Wv9Gjtk8A+qC/ZKuC/O80vCDhWZgSfoqVHNaamPBaRkAvAc0GKIPMrLyA+Z515R2
         637NNII0nDo+m12jdRAkF+LuC7884n9QAvGh0=
In-Reply-To: <1314202916-6982-1-git-send-email-david.wagner@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Wagner <david.wagner@free-electrons.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

On Wed, 2011-08-24 at 18:21 +0200, David Wagner wrote:
> ---
>  include/mtd/ubi-user.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
> index 3c41097..7c8bfe3 100644
> --- a/include/mtd/ubi-user.h
> +++ b/include/mtd/ubi-user.h
> @@ -188,6 +188,7 @@
>  /* Set an UBI volume property */
>  #define UBI_IOCSETVOLPROP _IOW(UBI_VOL_IOC_MAGIC, 6, \
>  			       struct ubi_set_vol_prop_req)
> +/* If you add ioctls here, please note that ubiblk uses 'O'/0x10-0x11 */
>  
>  /* Maximum MTD device name length supported by UBI */
>  #define MAX_UBI_MTD_NAME_LEN 127

Let's postpone this patch and the user-space tool until ubiblk is ready
for inclusion. I sent you some comments - the main one is the block
device reference counting and making sure that the underlying UBI volume
does not disappear when you use it.

-- 
Best Regards,
Artem Bityutskiy
