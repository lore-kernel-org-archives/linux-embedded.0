From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/9] Squashfs: move zlib decompression wrapper code into a 
	separate file
Date: Thu, 10 Dec 2009 11:01:23 +0100
Message-ID: <10f740e80912100201l6d83588evff46e95ec96d0aed@mail.gmail.com>
References: <E1NHTHg-0001sM-NQ@dylan.lougher.demon.co.uk>
	 <20091207145705.cd30cae8.akpm@linux-foundation.org>
	 <4B1ED122.3040309@lougher.demon.co.uk>
	 <1260352852.19669.1253.camel@localhost>
	 <4B2042FA.8080406@lougher.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=OK5DESAGOu8W7qblGyVikGfbDrtV7gsUW3HVDIhCeBs=;
        b=qf9Wu8/e91RbKynjYqVlxbVj73BZfv6sbdLaEn4RchcpiDkolLuz9uqXGgccyICIjS
         63uxU5gtodxFnxbc4kXZbJ/Pol1OMwKR94m87vt+iJ4iErSmAjwthwMBJh1s6EJYNRhX
         QNjUcB4nF7FNyUe9WwSjJevMZy1G0i4A3JcRg=
In-Reply-To: <4B2042FA.8080406@lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: dedekind1@gmail.com, Andrew Morton <akpm@linux-foundation.org>, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, Tim Bird <tim.bird@am.sony.com>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Felix Fietkau <nbd@openwrt.org>

Hi Phillip,

On Thu, Dec 10, 2009 at 01:38, Phillip Lougher
<phillip@lougher.demon.co.uk> wrote:
> Artem Bityutskiy wrote:
>>
>> Did you consider using cryptoapi? UBIFS uses zlib/lzo in cryptoapi - it
>> is a very clean way.

Exactly my question, as that's why the Crypto API was extended with
support for partial (de)compression in the first place ;-)

In addition, using the Crypto API has the advantage that Squashfs will
use hardware decompression if/when available.

> Yes I did consider using the cryptoapi, but this doesn't have support for
> lzma in mainline.

IIRC, Felix Fietkau added support for that for OpenWRT...

> My aim is add lzma filesystem support to Squashfs using the existing kernel
> lzma iplementation, and to make as few changes to that as necessary.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
