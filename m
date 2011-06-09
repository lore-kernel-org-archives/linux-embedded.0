From: Namhyung Kim <namhyung@gmail.com>
Subject: Re: [PATCH] printk-formats.txt documentation update
Date: Fri, 10 Jun 2011 03:20:49 +0900
Message-ID: <1307643649.1340.8.camel@leonhard>
References: <BANLkTik14_Zbfb3e9FXx_yUs35kBh6FqFg@mail.gmail.com>
	 <1307642692-23556-1-git-send-email-amurray@mpcdata.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:subject:from:to:cc:in-reply-to:references
         :content-type:date:message-id:mime-version:x-mailer
         :content-transfer-encoding;
        bh=pXeoYiBMhn/fbKRheu06CFefLSGylOAMCxJFwnKiUS8=;
        b=TAwJ2NUhxQWhgXCJfUx4DMtLmiUu79mgPEeN0tGHvr33OgNQtLJIU1YRFfiD8HkbfM
         0cM7X/z1IDdTV+T69BXpKpuqnsxq7vJGA//ZWyC9YO16dTLJcCGGCgoNxRlrsgqm4b70
         7miWdSXToxOOVWvtS3ASUJsISZvSrg/Oib+hw=
In-Reply-To: <1307642692-23556-1-git-send-email-amurray@mpcdata.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Murray <amurray@mpcdata.com>
Cc: joe@perches.com, w.sang@pengutronix.de, geert@linux-m68k.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, rdunlap@xenotime.net, udknight@gmail.com, Andrew Murray <amurray@mpc-data.co.uk>

2011-06-09 (=EB=AA=A9), 19:04 +0100, Andrew Murray:
> From: Andrew Murray <amurray@mpc-data.co.uk>
>=20
> This patch updates the incomplete documentation concerning the printk
> extended format specifiers.
>=20
> Signed-off-by: Andrew Murray <amurray@mpc-data.co.uk>
> ---
>  Documentation/printk-formats.txt |  119 ++++++++++++++++++++++++++++=
+++++++++-
>  1 files changed, 117 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-=
formats.txt
> index 1b5a5dd..69713d6 100644
> --- a/Documentation/printk-formats.txt
> +++ b/Documentation/printk-formats.txt
> @@ -9,7 +9,121 @@ If variable is of Type,		use printk format specifie=
r:
>  		size_t			%zu or %zx
>  		ssize_t			%zd or %zx
> =20
> -Raw pointer value SHOULD be printed with %p.
> +Raw pointer value SHOULD be printed with %p. The kernel supports
> +the following extended format specifiers for pointer types:
> +
> +Symbols/Function Pointers:
> +
> +	%pF	versatile_init+0x0/0x110
> +	%pf	versatile_init
> +	%pS	versatile_init+0x0/0x110
> +	%ps	versatile_init
> +	%pB	versatile_init+0x0/0x110
> +

-EBADEXAMPLE :)

If %pB is used, the offset part in the output could not be 0. That's th=
e
key (and the only) difference of the %pB specifier than others. Thus th=
e
output would be something like:

	%pB	prev_fn_of_versatile_init+0x88/0x88

Thanks.


--=20
Regards,
Namhyung Kim

