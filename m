From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 5/5] printk: provide a filtering macro for printk
Date: Wed, 02 Sep 2009 18:44:19 +0200
Message-ID: <4A9EA0E3.8000603@gmail.com>
References: <1251901505-4313-1-git-send-email-mat@brain-dump.org> <1251901505-4313-6-git-send-email-mat@brain-dump.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=nbeOvdH5hfG1Q04xoPTmSQf3KPBj/cqkr3g2uNy1o3o=;
        b=BBSL9/Oi9r8Rz8R049Q6WKtcZe9HaCazbOjZkNv5qdP0XGcxUME9o38UjXSZwoHU+R
         4lI/k3yRI6AE587rmjQacQdDASkhZcGk4lRMpVcstZf3d9LrMMVnYwgfv4PuWUJ8wJiV
         nURmjkoQokl8+sEXhxzrsu369yo9ddipl2oDU=
In-Reply-To: <1251901505-4313-6-git-send-email-mat@brain-dump.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Andre Tanner <mat@brain-dump.org>
Cc: linux-embedded@vger.kernel.org



Marc Andre Tanner ha scritto:
> +#define printk(fmt, ...) ( 							\

Shouldn't it be an and?

> +	(!__builtin_constant_p(PRINTK_FILTER((fmt))) || PRINTK_FILTER((fmt))) ?	\
> +		printk((fmt), ##__VA_ARGS__) : 0				\
> +)
> +
> +#endif /* CONFIG_PRINTK_VERBOSITY */
> +


Marco
