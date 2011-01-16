From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] Squashfs: Add XZ compression configuration option
Date: Sun, 16 Jan 2011 19:56:26 +0100
Message-ID: <AANLkTinfFk-mkzgt_qw2+Y5GxkuPVC9S63reuG=GQ84=@mail.gmail.com>
References: <4D007315.1090704@lougher.demon.co.uk>
	<AANLkTimUYrb8EMomgmsW+v7ttbkUH0P57SBD5M4_AGmU@mail.gmail.com>
	<4D01C770.1080301@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=e2csbrxQBAB1KAhS7nhJFjxLfo86fEyo9fmsNbtLdCs=;
        b=Mokngkjj/SRmIKljC3aCMUFofRWBU7itAl2RUWCQ7U/9+wIe/2ckF3j4aJ57NX9ZDB
         c5rX8k9E3ouqVX62VCBEZGDaMTQ3Zm/Fun8u22HgBmu3J/gNGhlEZjzimpyWuJ1hZ3Ee
         Um3KYPNATRPTxWeuasnOXo6alPGoMbJo26Q7Y=
In-Reply-To: <4D01C770.1080301@lougher.demon.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, Linux Embedded Maillist <linux-embedded@vger.kernel.org>, Lasse Collin <lasse.collin@tukaani.org>, Andy Whitcroft <apw@canonical.com>

On Fri, Dec 10, 2010 at 07:23, Phillip Lougher
<phillip@lougher.demon.co.uk> wrote:
> Geert Uytterhoeven wrote:
>> On Thu, Dec 9, 2010 at 07:11, Phillip Lougher
>> <phillip@lougher.demon.co.uk> wrote:
>>>
>>> --- a/fs/squashfs/Kconfig
>>> +++ b/fs/squashfs/Kconfig
>>> @@ -53,6 +53,22 @@ config SQUASHFS_LZO
>>>
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 If unsure, say N.
>>>
>>> +config SQUASHFS_XZ
>>> + =C2=A0 =C2=A0 =C2=A0 bool "Include support for XZ compressed file=
 systems"
>>> + =C2=A0 =C2=A0 =C2=A0 depends on SQUASHFS
>>> + =C2=A0 =C2=A0 =C2=A0 default n
>>
>> "default n" is the default, no reason to specify it.
>>
>
> Yes, thanks for pointing that out.
>
> It seems there's a lot of "default n"s in the mainline kernel
>
> % find . -name "Kconfig"| xargs grep "default n" | wc
> =C2=A0 =C2=A0485 =C2=A0 =C2=A01535 =C2=A0 18753
>
> including two in arch/m68k ;-)

Thanks, fixed.

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
