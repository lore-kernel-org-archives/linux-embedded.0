From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] printk-formats.txt documentation update
Date: Sun, 6 Feb 2011 11:16:31 +0100
Message-ID: <AANLkTimcFvq-cSpain--STuVVg3dUJeTCDrykQ=24egg@mail.gmail.com>
References: <AANLkTikj+FU8OF_-KFr2hmTSWqTHMK5JnrnTVyn-XtxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=peozTtDY1a9V4x6WjQhB5ve9ia8HnS4rPUuCFQ7k624=;
        b=A1lMOvolErN0duTdxhWp/ugLwHf+j9EbpCTFh/KfjWSdSUChdmn6pwOf3I5eogugiA
         Tqkiw8NirqAbZkpIcZIuANeJ4aQXy4w/sIMC0oF29pYxgwqlN8u8u5DqT9qMkV0J7+eX
         Aw09Vx4LhV4daBp0EqW2DqcDyN77cecwyjPnI=
In-Reply-To: <AANLkTikj+FU8OF_-KFr2hmTSWqTHMK5JnrnTVyn-XtxQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Murray <amurray@mpcdata.com>
Cc: linux-embedded@vger.kernel.org, linux kernel <linux-kernel@vger.kernel.org>, trivial@kernel.org, rdunlap@xenotime.net

On Sun, Feb 6, 2011 at 01:15, Andrew Murray <amurray@mpcdata.com> wrote=
:
> From: Andrew Murray <amurray@mpc-data.co.uk>
>
> This patch updates the incomplete documentation concerning the printk
> extended format specifiers.
>
> Signed-off-by: Andrew Murray <amurray@mpc-data.co.uk>
> ---
> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-=
formats.txt
> index 1b5a5dd..df14336 100644
> --- a/Documentation/printk-formats.txt
> +++ b/Documentation/printk-formats.txt
> @@ -9,7 +9,42 @@ If variable is of Type, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0use printk format specifier:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%zu or %zx
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %zd or %zx
>
> -Raw pointer value SHOULD be printed with %p.
> +Raw pointer value SHOULD be printed with %p. The kernel supports
> +the following extended format specifiers for pointer types:
> +
> + =C2=A0 =C2=A0 =C2=A0 General:
> +
> + =C2=A0 =C2=A0 =C2=A0 %pF =C2=A0 =C2=A0 function pointer with offset=
, e.g. module_start
> + =C2=A0 =C2=A0 =C2=A0 %pf =C2=A0 =C2=A0 function pointer without off=
set, e.g. module_start+0x0/0x62 [hello]
> + =C2=A0 =C2=A0 =C2=A0 %pS =C2=A0 =C2=A0 text symbol with offset
> + =C2=A0 =C2=A0 =C2=A0 %ps =C2=A0 =C2=A0 text symbol without offset
> + =C2=A0 =C2=A0 =C2=A0 %pR =C2=A0 =C2=A0 struct resource with decoded=
 flags, e.g. [mem 0x0-0x1f 64 bit pref]
> + =C2=A0 =C2=A0 =C2=A0 %pr =C2=A0 =C2=A0 struct resource with raw fla=
gs, e.g. [mem 0x0-0x1f flags 0x201]
> +
> + =C2=A0 =C2=A0 =C2=A0 MAC/FDDI addresses:
> +
> + =C2=A0 =C2=A0 =C2=A0 %pM =C2=A0 =C2=A0 colon-seperated 6-byte MAC a=
ddress in hex notation, e.g. 00:01:02:03:04:05
> + =C2=A0 =C2=A0 =C2=A0 %pm =C2=A0 =C2=A0 non-colon-seperated 6-byte M=
AC address is hex notation, e.g. 000102030405
> + =C2=A0 =C2=A0 =C2=A0 %pMF =C2=A0 =C2=A06-byte dash-separated FDDI h=
ex notation
> +
> + =C2=A0 =C2=A0 =C2=A0 IPv4 addresses:
> +
> + =C2=A0 =C2=A0 =C2=A0 %pI4 =C2=A0 =C2=A0IPv4 dot-seperated decimal w=
ithout leading 0's, e.g. 1.2.3.4
> + =C2=A0 =C2=A0 =C2=A0 %pi4 =C2=A0 =C2=A0IPv4 dot-seperated decimal w=
ith leading 0's, 001.002.003.004
> + =C2=A0 =C2=A0 =C2=A0 %p[Ii]4[hl] IPv4 dot-seperated decimal with/wi=
thout leading 0's for
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host (h), little (=
l) or network/big (default) endian order
> +
> + =C2=A0 =C2=A0 =C2=A0 IPv6 addresses:
> + =C2=A0 =C2=A0 =C2=A0 %pI6 =C2=A0 =C2=A0IPv6 colon-seperated network=
-order 16 bit hex with leading 0's,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.g. 0001:0203:...=
:0708
> + =C2=A0 =C2=A0 =C2=A0 %pi6 =C2=A0 =C2=A0IPv6 non-colon-seperated net=
work-order 16 bit hex with leading 0's,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.g. 000102...0f
> + =C2=A0 =C2=A0 =C2=A0 %pI6c =C2=A0 IPv6 address as described by
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://tools.ietf.=
org/html/draft-ietf-6man-text-addr-representation-00,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.g. 1::708
> +
> + =C2=A0 =C2=A0 =C2=A0 %pU[bBlL] 16 byte UUID/GUID in big or little e=
ndian using lower or upper case
> +

In the mean time, we also got %pV and %pK. Can you please add them as w=
ell? Thx!

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
