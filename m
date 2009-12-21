From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight 
	bootloader
Date: Mon, 21 Dec 2009 14:32:36 -0500
Message-ID: <8bd0f97a0912211132o55621bb9jd0139b740526bfd@mail.gmail.com>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> 
	<20091221193038.38CB63F6EF@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=Xop84MbkNZsc7u0vd/Z5ntg0d7jzjp4d8RGO3RCYK7Q=;
        b=mU++e2wT4u4qzMwT5RIVFLUwNHGiJb2td/QHTkpGsAhBNdzLJYxjLtK0RuoD5VXdAF
         Ad79/GjnG3yc3mhZTKB5sYESBWoQmOQEHJk/n4Mzy0Rydlm8tLSd5nvLfbgqMXL02bjg
         BsI/sXcZgB0YGuGDPSUnaVlD7+yR1l5MqbmL4=
In-Reply-To: <20091221193038.38CB63F6EF@gemini.denx.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Wolfgang Denk <wd@denx.de>
Cc: Andy Green <andy@warmcat.com>, Matt Hsu <matt@0xlab.org>, linux-embedded@vger.kernel.org, celinux-dev@tree.celinuxforum.org

On Mon, Dec 21, 2009 at 14:30, Wolfgang Denk wrote:
> Andy wrote:
>> Another big problem with U-Boot was the inability to update the
>> bootloader from the Linux world. =C2=A0Instead the bootloader was tr=
eated
>> special and had to be updated over USB with DFU (the exclusivity of =
it
>> enforced by an ECC policy disconnected from Linux, meaning U-Boot ha=
d to
>> write it in there). =C2=A0In Qi, the bootloader can be updated by a =
packaged
>> update like anything else in the rootfs.
>
> Can you explain to me why it was not possible to update U-Boot from
> Linux? I cannot imagine a reason for such a restriction.

we do it all the time under the Blackfin port on nor/nand/spi flashes.
-mike
