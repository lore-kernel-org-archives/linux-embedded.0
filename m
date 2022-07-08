From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Matt Mackall as his identity is
 obsolete
Date: Thu, 7 Jul 2022 20:54:13 -0700
Message-ID: <8d42d2f2-1da5-0f23-6e43-a505e9d9d41f@gmail.com>
References: <20210920080635.253826-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-crypto-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=boMoiQ7O+iidCb90Ajv0DmnlcZVRw9XoN19BAZFvz0Q=;
        b=PAyzN5zd/pXMr0RfDgSRgyz4Ab0+ZK907q7JkXafq6rbA3DcUNwLv5MiOJ1OBvPZ+V
         PVwOxqIDf+vtFY20qOvDzu8QOgWCau6I5AogopFe/fL+KRzzw7fPvgYyfQjaENFMCxhJ
         xLnU5P3XiTqEpk0xes2ZN95I1wdpTFL/r5fwqOTpj1OW5kHdzSVneiInXKAqbFOLXcif
         Rx0w5p3ICf4IeSQO/dC5l5RzTrNu45MfvHpOF+VXMXh30W4oBpxVxTb65yarIDtu2UYR
         dg7BmRy3zDyStQBKIswemyXYyeh+2InZad8Uhd0gu8M0zAWb0SXaAkTX33OP42l7MT1W
         zTyg==
Content-Language: en-US
In-Reply-To: <20210920080635.253826-1-u.kleine-koenig@pengutronix.de>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org
Cc: kernel@pengutronix.de



On 9/20/2021 1:06 AM, Uwe Kleine-König wrote:
> The mails I sent to Matt on September 14 and 20 both were refused by the
> MTA responsible for selenic.com (i.e. waste.org) with:
> 
> 	554 5.7.1 <mpm@selenic.com>: Recipient address rejected: This identity is obsolete
> 
> Also the most recent commit that involved him (ignoring "Cc: Matt
> Mackall <mpm@selenic.com>" footers) is commit 330e0a01d54c (MAINTAINERS:
> Theodore Ts'o is taking over the random driver) where he was removed
> from the entry for random number drivers in 2012.
> 
> So drop him completely from the list of maintainers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

This has not been applied and we still have entries in MAINTAINERS that 
are bouncing for mpm@selenic.com, can we apply this patch?
-- 
Florian
