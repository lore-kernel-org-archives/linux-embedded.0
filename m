From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] MAINTAINERS: Remove Matt Mackall as his identity is obsolete
Date: Mon, 20 Sep 2021 15:01:25 +0200
Message-ID: <CAMuHMdVAjtF2GKXgHgbmjUnMdWxqSpusKV_EieF2wEWezdqrPQ@mail.gmail.com>
References: <20210920080635.253826-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20210920080635.253826-1-u.kleine-koenig@pengutronix.de>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, David Woodhouse <dwmw2@infradead.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Olivia Mackall <olivia@selenic.com>

Hi Uwe,

On Mon, Sep 20, 2021 at 11:52 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The mails I sent to Matt on September 14 and 20 both were refused by the
> MTA responsible for selenic.com (i.e. waste.org) with:
>
>         554 5.7.1 <mpm@selenic.com>: Recipient address rejected: This identity is obsolete
>
> Also the most recent commit that involved him (ignoring "Cc: Matt
> Mackall <mpm@selenic.com>" footers) is commit 330e0a01d54c (MAINTAINERS:
> Theodore Ts'o is taking over the random driver) where he was removed
> from the entry for random number drivers in 2012.
>
> So drop him completely from the list of maintainers.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  MAINTAINERS | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d7b4f32875a9..805630c67a1f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6812,7 +6812,6 @@ F:        drivers/media/usb/em28xx/
>
>  EMBEDDED LINUX
>  M:     Paul Gortmaker <paul.gortmaker@windriver.com>
> -M:     Matt Mackall <mpm@selenic.com>

Perhaps this should be replaced by
"Olivia Mackall <olivia@selenic.com>" instead?

>  M:     David Woodhouse <dwmw2@infradead.org>
>  L:     linux-embedded@vger.kernel.org
>  S:     Maintained
> @@ -8157,7 +8156,6 @@ F:        include/trace/events/hwmon*.h
>  K:     (devm_)?hwmon_device_(un)?register(|_with_groups|_with_info)
>
>  HARDWARE RANDOM NUMBER GENERATOR CORE
> -M:     Matt Mackall <mpm@selenic.com>
>  M:     Herbert Xu <herbert@gondor.apana.org.au>
>  L:     linux-crypto@vger.kernel.org
>  S:     Odd fixes

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
