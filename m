From: Dirk Behme <dirk.behme@googlemail.com>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Wed, 04 May 2011 17:34:03 +0200
Message-ID: <4DC171EB.6030900@googlemail.com>
References: <1304455330-2728-1-git-send-email-abogani@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=Z8PbPPdcWJ+DWZyZZdOg2EqDEWaKcxV48fIR+07Tius=;
        b=GzNjog+plIo8uyco0uhfP6vLjC9sxrGJotC7GDOKzfS7gnKegqQRiIzcIbEHJmBnDo
         o6TevRyqildxUN6NlUU7EBgJkO3KPjo74r6agzphxwxQQkE/8vpnkMJM78rkxDhX8co+
         kwJGFFvyJBjBssq05gQIydvkvxljQinHbresw=
In-Reply-To: <1304455330-2728-1-git-send-email-abogani@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>

On 03.05.2011 22:42, Alessio Igor Bogani wrote:
> This work was supported by a hardware donation from the CE Linux Forum.
>
> Signed-off-by: Alessio Igor Bogani<abogani@kernel.org>
> ---
>   kernel/module.c |    6 ++----
>   1 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/module.c b/kernel/module.c
> index 6a34337..a1f841e 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -2055,10 +2055,8 @@ static const struct kernel_symbol *lookup_symbol(const char *name,
>   	const struct kernel_symbol *stop)
>   {
>   	const struct kernel_symbol *ks = start;
> -	for (; ks<  stop; ks++)
> -		if (strcmp(ks->name, name) == 0)
> -			return ks;
> -	return NULL;
> +	return bsearch(ks->name, start, stop - start,
> +			sizeof(struct kernel_symbol), cmp_name);
>   }
>
>   static int is_exported(const char *name, unsigned long value,

How is this patch related to patch 4/4

http://marc.info/?l=linux-kernel&m=130296062420328&w=1

of the recently sent patch set? Is it a replacement? Or an add on to 
this (i.e. patch #5)?

Many thanks

Dirk
