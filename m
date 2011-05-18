From: Dirk Behme <dirk.behme@googlemail.com>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Wed, 18 May 2011 17:26:56 +0200
Message-ID: <4DD3E540.8000205@googlemail.com>
References: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com> <1305665763-3988-1-git-send-email-abogani@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=rIUa5KqYUSZfq5Nc5j4Xe9us6xYfn2BBWTN63DlB5NU=;
        b=LNy+DZmxoE3eh2AN11l0sdBDVzIUdomPbKqrhOnXvTp2hIlg32dla49mv2lZJFh6NF
         1A5Tlo9JcKWnu8hcZrvNeWRlBY79xaQBpwFop/y9417PTWXyYVwOl0zKiTlBRDNCP5GT
         03aRoxecCCoUFcp7F8yhD35ilSmKohyeGTrbM=
In-Reply-To: <1305665763-3988-1-git-send-email-abogani@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>

On 17.05.2011 22:56, Alessio Igor Bogani wrote:
> This work was supported by a hardware donation from the CE Linux Forum.
>
> Signed-off-by: Alessio Igor Bogani<abogani@kernel.org>
> ---
>   kernel/module.c |    7 ++-----
>   1 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/module.c b/kernel/module.c
> index 1e2b657..795bdc7 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -2055,11 +2055,8 @@ static const struct kernel_symbol *lookup_symbol(const char *name,
>   	const struct kernel_symbol *start,
>   	const struct kernel_symbol *stop)
>   {
> -	const struct kernel_symbol *ks = start;
> -	for (; ks<  stop; ks++)
> -		if (strcmp(ks->name, name) == 0)
> -			return ks;
> -	return NULL;
> +	return bsearch(name, start, stop - start,
> +			sizeof(struct kernel_symbol), cmp_name);
>   }
>
>   static int is_exported(const char *name, unsigned long value,

The old version with the warning is in linux-next now

http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commitdiff;h=903996de9b35213aaa4162c24351a2cb2931d9ac

Best regards

Dirk
