From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] Squashfs: Add XZ compression configuration option
Date: Thu, 9 Dec 2010 08:02:04 +0100
Message-ID: <AANLkTimUYrb8EMomgmsW+v7ttbkUH0P57SBD5M4_AGmU@mail.gmail.com>
References: <4D007315.1090704@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=+qEq2EGThMWEG2FfjqmdZ2uqCde49zCwUZcg7nHpkSY=;
        b=CghCBcWBb430Alu4QxSH+DG1NgXaYt0RNndUcASHN9eoVFwM/INUMrwWeSprnJ3L96
         86rDpWj0HOAt48P5fnNQPeS0hVVZWChM8IhvecppKChPVIR+1pUnRLPC9TGSVqw4zTaC
         +RcLxsfuQyV7dlVNhDri6A0K/eCok3T3MH/kk=
In-Reply-To: <4D007315.1090704@lougher.demon.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, Linux Embedded Maillist <linux-embedded@vger.kernel.org>, Lasse Collin <lasse.collin@tukaani.org>, Andy Whitcroft <apw@canonical.com>

On Thu, Dec 9, 2010 at 07:11, Phillip Lougher
<phillip@lougher.demon.co.uk> wrote:
> --- a/fs/squashfs/Kconfig
> +++ b/fs/squashfs/Kconfig
> @@ -53,6 +53,22 @@ config SQUASHFS_LZO
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If unsure, say N.
>
> +config SQUASHFS_XZ
> + =C2=A0 =C2=A0 =C2=A0 bool "Include support for XZ compressed file s=
ystems"
> + =C2=A0 =C2=A0 =C2=A0 depends on SQUASHFS
> + =C2=A0 =C2=A0 =C2=A0 default n

"default n" is the default, no reason to specify it.

Do we need a checkpatch test for this?

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
