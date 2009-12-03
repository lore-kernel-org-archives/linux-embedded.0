From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Thu, 3 Dec 2009 09:42:32 -0500
Message-ID: <20091203144232.GN14279@hansolo.jdub.homelinux.org>
References: <4B15AAFE.4030705@am.sony.com> <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com> <4B16E03D.3000202@am.sony.com> <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com> <alpine.LFD.2.00.0912030713300.10116@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=C+Yz88nc0EJC0YdxHd0cJHimO9KgEZlzfS0X4xOnCGI=;
        b=Q1kdA88MmEpWNb+ZO/FXYXPt13rshS3xlrc6aVrY5G9gaY6GAJLGrOOpN5/nzbYj5q
         jX6PCaEOpwld9e4pxi7uH3SjMwHmFywv6V7H93/rDgPGPMW19jnLkFU8gMprtB23OOAg
         wzpkRf03uJD5VFPlszAjaRaC/cXsKb6YfT8Jc=
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0912030713300.10116@macbook.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Aras Vaichas <arasv@magellan-technology.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Dec 03, 2009 at 07:17:30AM +0000, David Woodhouse wrote:
> On Thu, 3 Dec 2009, Aras Vaichas wrote:
>
>> 2009/12/3 Tim Bird <tim.bird@am.sony.com>
>>>
>>> Mike Frysinger wrote:
>>>> i know your e-mail intro states "embedded Linux" as does the wiki,=
 but
>>>> i'm gonna take a stab anyways. =A0does this apply to Linux only an=
d not
>>>> open source boot loaders (like U-Boot) ?
>>>
>>> It applies to anything in the "embedded Linux" ecosystem. =A0This
>>> would very much include open source boot loaders like U-Boot.
>>
>> I've got a list of "nice to haves"
>>
>> Any boot time speed up work.
>>
>> Support for 2nd stage booting from NAND with newer filesystems such =
as
>> UBIFS. i.e. simplified UBI/UBIFS read/write/format code in a small
>> footprint.
>
> Is it heretical to suggest a BSD licence for that too, to encourage =20
> adoption into other bootloaders? Or at least LGPL or the "GPL with=20
> linking exception" licence that libstdc++/eCos/JFFS2 have.

Are you asking for a relicense of the existing UBI/UBIFS code?

josh
