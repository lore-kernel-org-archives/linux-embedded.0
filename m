From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] char drivers: Ram oops/panic logger
Date: Sat, 13 Mar 2010 15:50:48 +0100
Message-ID: <10f740e81003130650j76698721g75186091253bb99c@mail.gmail.com>
References: <4B968834.3040609@gmail.com>
	 <21eaeb5a1003091808s2d7638cxd524952a7d84b378@mail.gmail.com>
	 <2ea1731b1003100002w104633ffy1ae46ef3d245e5b5@mail.gmail.com>
	 <21eaeb5a1003100120x6cd3f69ak598954af3c9fe955@mail.gmail.com>
	 <2ea1731b1003100415i46dd8fcem85b85f49fb1a479@mail.gmail.com>
	 <20100312144854.cb94d9b4.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=ZtkaR9TX9RQPUyckCqr9Th6BjVykGniXd0OWlPxje+E=;
        b=w5hzRZIvZ+fauKQAiGrXTFizrtOnMPTxF8eM7OmnCCREKs7uuk+j+Yl6erWAkFcmGZ
         oxsOVL2GrsOZw77tYOX3cDb82r+7xO5fuSG3lm7ZTgXBityBtHXJo3iV7eI7O/YKgzgx
         uWJwQf6kwZeCmqD3PRWUXKTfNkGuguj+a/1fc=
In-Reply-To: <20100312144854.cb94d9b4.akpm@linux-foundation.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Yuasa Yoichi <yuasa@linux-mips.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Fri, Mar 12, 2010 at 23:48, Andrew Morton <akpm@linux-foundation.org=
> wrote:
> On Wed, 10 Mar 2010 13:15:25 +0100
> Marco Stornelli <marco.stornelli@gmail.com> wrote:
>
>> 2010/3/10 Yuasa Yoichi <yuasa@linux-mips.org>:
>> > 2010/3/10 Marco Stornelli <marco.stornelli@gmail.com>:
>> >> 2010/3/10 Yuasa Yoichi <yuasa@linux-mips.org>:
>> >>> Hi,
>> >>>
>> >>> 2010/3/10 Marco Stornelli <marco.stornelli@gmail.com>:
>> >>>> Ramoops, like mtdoops, can log oops/panic information but in RA=
M.
>> >>>
>> >>> What is different from mtdoops + mtd-ram?
>> >>>
>> >>> Yoichi
>> >>>
>> >>
>> >> It can be used in a very easy way with persistent RAM for systems
>> >> without flash support. For this systems, with this driver, it's n=
o
>> >> more needed add to the kernel the mtd subsystem with advantage in
>> >> footprint as I said in the description.
>> >
>> > right.
>> > But,
>> >
>> >> In addition, you can save
>> >> flash space and store this information only in RAM. I think it's =
very
>> >> useful for embedded systems.
>> >
>> > CONFIG_MTD_RAM uses only RAM.
>> > I think there's no big difference about this point.
>> >
>>
>> I meant with the "classic" use of mtdoops, therefore with a flash
>> partition without use MTD_RAM. Using MTD_RAM, it's more or less the
>> same thing, with the exception of "where" you want deploy the log. F=
or
>> example: if in your system you have got a nvram you can use it witho=
ut
>> problem, you need to specify the address of the nvram to the module.
>> Very simple. I =C2=A0think it's a small driver but very useful, feed=
back
>> from other embedded guys are welcome.
>
> Seems sensible to me. =C2=A0If you have a machine whose memory is per=
sistent
> across reboots then you reserve an arbitrary 4k hunk of memory for
> collecting oops traces, yes?
>
> What tools are used for displaying that memory on the next boot? =C2=A0=
How
> do those tools distinguish between "valid oops trace" and "garbage
> because it was just powered on"? =C2=A0A magic signature?

On Amiga, `debug=3Dmem' enables something like that, cfr. git grep dmes=
g
arch/m68k.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
