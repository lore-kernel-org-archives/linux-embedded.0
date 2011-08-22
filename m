From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] Tools for controling ubiblk
Date: Mon, 22 Aug 2011 11:17:47 +0300
Message-ID: <1314001072.2644.58.camel@sauron>
References: <1313587042-30846-1-git-send-email-david.wagner@free-electrons.com>
	 <1313590847-3839-1-git-send-email-david.wagner@free-electrons.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:message-id
         :mime-version;
        bh=l5BwIDtfydMByh0ZMuH/fGA91+Osq4jgebq3ISYMzII=;
        b=sDbFEa+ZNuJPgfTmGX0xT/3BX/FLkAc5Kap1VM9w2PiUlyCYEUorqvWXvNbVxsuoW3
         qZVCAvRJigwLd7UQ3abp/bZmllFit8mrCO0dIKHglL/DsBVipVcgWC8ha2cA2fOEi5CT
         5mLDyeY7qQZ+w8aRVoh1LSnz7ZygDfkUu7J6w=
In-Reply-To: <1313590847-3839-1-git-send-email-david.wagner@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Wagner <david.wagner@free-electrons.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

I do not think LKML is interested in mtd-utils user-space project
patches, please, do not add lkml to spam it less.

On Wed, 2011-08-17 at 16:20 +0200, David Wagner wrote:
> +#ifndef __UBIBLK_USER_H__
> +#define __UBIBLK_USER_H__
> +
> +#include <linux/types.h>
> +
> +/* Structure to be passed to UBIBLK_IOCADD or IOCDEL ioctl */
> +struct ubiblk_ctrl_req {
> +	__s32 ubi_num;
> +	__s32 vol_id;
> +};
> +
> +/* ioctl commands of the UBI control character device */
> +
> +#define UBIBLK_CTRL_IOC_MAGIC 'O'
> +
> +/* Create a ubiblk device from a UBI volume */
> +#define UBIBLK_IOCADD _IOW(UBIBLK_CTRL_IOC_MAGIC, 0x10, struct ubiblk_ctrl_req)
> +/* Delete a ubiblk device */
> +#define UBIBLK_IOCDEL _IOW(UBIBLK_CTRL_IOC_MAGIC, 0x11, struct ubiblk_ctrl_req)
> +
> +#endif

Please, do not copy kernel headers verbatim, copy the result of "make
headers_install" invoked in the kernel tree.

-- 
Best Regards,
Artem Bityutskiy
