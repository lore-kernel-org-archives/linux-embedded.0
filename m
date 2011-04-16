From: Wanlong Gao <wanlong.gao@gmail.com>
Subject: Re: [PATCH 4/4] module: Use the binary search for symbols resolution
Date: Sat, 16 Apr 2011 22:08:48 +0800
Message-ID: <BANLkTikVMv_3vjypP=+ZCmn5BwEazRZ36w@mail.gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
	<1302960373-5309-5-git-send-email-abogani@kernel.org>
Reply-To: wanlong.gao@gmail.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:reply-to:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=5JPYQG1kihiIZYerUie22OZqBed2NLaVSGRlMEF1L5w=;
        b=GrLfEOkpOby5PJ4qpWHKsUn0ou+Vg1D5bg9SRHAORIn+0Vhsdec5S95u1v7uKM9X7i
         00rV9n3RZyLRT6xnFr5D4YLAe39P9tfSpU5YlFLw1YDD3RV755JsOQM6UTv7z1NmqLbe
         WA2b3N0WvdIRykSbyRyOD20Prt+1EoRQCaOZ0=
In-Reply-To: <1302960373-5309-5-git-send-email-abogani@kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On 4/16/11, Alessio Igor Bogani <abogani@kernel.org> wrote:
> Takes advantage of the order and locates symbols using binary search.
>
> This work was supported by a hardware donation from the CE Linux Forum.
>
> Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
> ---
>  kernel/module.c |   23 ++++++++++++++++-------
>  1 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/module.c b/kernel/module.c
> index b438b25..74a57c1 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -57,6 +57,7 @@
>  #include <linux/kmemleak.h>
>  #include <linux/jump_label.h>
>  #include <linux/pfn.h>
> +#include <linux/bsearch.h>
>
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/module.h>
> @@ -351,22 +352,30 @@ struct find_symbol_arg {
>  	const struct kernel_symbol *sym;
>  };
>
> +static int cmp_name(const void *va, const void *vb)
> +{
> +	const char *a;
> +	const struct kernel_symbol *b;
> +	a = va; b = vb;
> +	return strcmp(a, b->name);
> +}
> +
>  static bool find_symbol_in_symsearch(const struct symsearch *syms,
>  				     struct module *owner,
>  				     void *data)
>  {
>  	struct find_symbol_arg *fsa = data;
> +	struct kernel_symbol *sym;
>  	unsigned int symnum;
> -	int result;
>
> -	for (symnum = 0; symnum < syms->stop - syms->start; symnum++) {
> -		result = strcmp(fsa->name, syms->start[symnum].name);
> -		if (result == 0)
> -			break;
> -	}
> -	if (symnum >= syms->stop - syms->start)
> +	sym = bsearch(fsa->name, syms->start, syms->stop - syms->start,
> +		sizeof(struct kernel_symbol), cmp_name);
> +
> +	if (sym == NULL)
>  		return false;
>
> +	symnum = sym - syms->start;
> +
>  	if (!fsa->gplok) {
>  		if (syms->licence == GPL_ONLY)
>  			return false;
> --
> 1.7.4.1
>
> --
It seems like a great work .
Thanks
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
