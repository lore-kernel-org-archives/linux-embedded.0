From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Tue, 17 May 2011 13:22:59 +0930
Message-ID: <878vu6nftw.fsf@rustcorp.com.au>
References: <BANLkTi=2jW5PHB6QCaddHeZH0P=9PKWosw@mail.gmail.com> <1305577420-3685-1-git-send-email-abogani@kernel.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1305577420-3685-1-git-send-email-abogani@kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>, Alessio Igor Bogani <abogani@kernel.org>

On Mon, 16 May 2011 22:23:40 +0200, Alessio Igor Bogani <abogani@kernel.org> wrote:
> This work was supported by a hardware donation from the CE Linux Forum.
> 
> Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
> ---
>  kernel/module.c |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/module.c b/kernel/module.c
> index 6a34337..54355c5 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -2055,10 +2055,8 @@ static const struct kernel_symbol *lookup_symbol(const char *name,
>  	const struct kernel_symbol *stop)
>  {
>  	const struct kernel_symbol *ks = start;
> -	for (; ks < stop; ks++)
> -		if (strcmp(ks->name, name) == 0)
> -			return ks;
> -	return NULL;
> +	return bsearch(name, start, stop - start,
> +			sizeof(struct kernel_symbol), cmp_name);
>  }
>  
>  static int is_exported(const char *name, unsigned long value,

Applied.

Thanks!
Rusty.
