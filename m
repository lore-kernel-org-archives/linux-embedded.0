From: Dirk Behme <dirk.behme@googlemail.com>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Mon, 16 May 2011 17:36:09 +0200
Message-ID: <4DD14469.5030804@googlemail.com>
References: <1304455330-2728-1-git-send-email-abogani@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=BBksg+ySc8qhK5CQX9+jNkpYMF5jKkrjzvLr90Dp4uM=;
        b=DdzZvVE4Hq3JBzbY9vx/zsgeoT3uARyJGcAWJ4bkM2uZROePbATzSSgB2GOeHA2Fch
         Ul/+Fr9eCY9azu9HbeEh3wUTwMpZ7h68+vn+3k0cFo5sVaDkrUjh0HD5+030bZeiX8YT
         LAn9f2K4DKL2U393G6S0qZByokXbTJpXG6f5o=
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

Back porting this patch to a 2.6.34.9 based ARM system fails with an 
Oops at 0x00000004. Debugging shows that both start and stop are 0 in 
this case resulting in ks->name accessing 0x00000004. The original 
code checked for this by 'ks < stop' in the for loop.

So the first idea was that the code should be

if(k < stop)
	return bsearch();
else
	return NULL;

Then, thinking again, results in the question if the first argument of 
bsearch() shouldn't be 'name' rather than 'ks->name'? Then it would be 
the job of cmp_name() to check for start == stop == 0? I.e.

return bsearch(name, ...);

?

Best regards

Dirk
