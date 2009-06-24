From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: I:Re: [PATCH 06/14] Pramfs: Include files
Date: Wed, 24 Jun 2009 08:30:49 +0200
Message-ID: <2ea1731b0906232330u700e8bc0p7b0cafa83d8d2d5a@mail.gmail.com>
References: <4a4130db.0af6660a.48a9.ffffdace@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=CSS5FteLKCBPf2bQKBnm9NDM8dKaFq1ba76VQfOKWVA=;
        b=PPHZ9MhYqKfG7yUCsbpL4hXcoHEZy1F/9f5OWAf/mcd2eOzZqMfO9HiJZCmYwTJ3dX
         8xEOei891vf5NXVbejGaWchcFs0kotqT2mJh4rSL+8nZ9r1HXDoL5cSd16c23zNUTOgJ
         +sJ+yHaczStQBPOG9B/8+Bv1qSCHOxBka3On0=
In-Reply-To: <4a4130db.0af6660a.48a9.ffffdace@mx.google.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: joern@lazybastard.org
Cc: sam@ravnborg.org, tim.bird@am.sony.com, Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

> On Tue, 23 June 2009 19:38:33 +0200, Marco wrote:
>>
>> dd? You haven't got any device file to have a dump. I think we're go=
ing
>> a bit out of scope. I had some doubt to support rootfs in pram and a=
fter
>> some feedback and the comments of this review I think I'll remove it
>> from the next release (to understand some aspects of this fs with th=
e
>> kernel community was my main goal for this review). I agree to use t=
he
>> native endian. As I said the important thing is that if an user want=
 to
>> use it in a 64bit environment then the fs must work well and then it
>> must be designed to support even this situation, I think it's obviou=
s.
>
> Glancing at the discussion with Pawel, I see two paths to follow. =A0=
One
> is to turn pramfs into a full-features all-round general-purpose
> filesystem with mkfs, fsck, xattr and any number of additional featur=
es.
> That way lies doom, as you would compete against ext2+xip and have
> little new to offer.
>
> The other path is to make/keep pramfs as simple as possible for
> comparatively specialized purposes, like flight recorder data and dum=
p
> information. =A0Main selling point here is the amount of vulnerable c=
ode
> in the total package. =A0ext2 + block layer + vfs helpers is relative=
ly
> large and many things may go wrong in a panic situation.
>
> So I agree with you that many things expected from general purpose
> filesystems simply don't apply to pramfs. =A0Moving mkfs into the ker=
nel
> is a fair tradeoff, when the required code is small. =A0Endianness is=
 a
> different case imo. =A0dd may not work, but a jtag probe will happily=
 get
> you the dump to your development machine.
>

I quite agree, but I'd like to say that it was _not_ my intention to
submit a general-purpose fs comparable with ext2 or ext3.


> And even within the same box you can have more than one architecture =
and
> endianness. =A0http://www.top500.org/system/9707 will show you one su=
ch
> beast, which happens to have the top bragging rights at the moment. =A0=
I
> don't want to endorse such strange beasts, but there is no good reaso=
n
> not to support reading the ppc-written fs from the opteron. =A0In fac=
t,
> there is no reason full stop.
>
> J=F6rn
>

Mmm....Jtag dump makes more sense, ok in the next release I rework the
layout to have an independent endianess layout.

Marco
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
