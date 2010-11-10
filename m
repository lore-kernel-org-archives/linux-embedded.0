From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 08/16 v2] pramfs: headers
Date: Wed, 10 Nov 2010 09:15:36 +0100
Message-ID: <AANLkTik+Vx8W1qXEZ=AqedRSj_D4-k70Xa4h-bnW2MRH@mail.gmail.com>
References: <4CD518C5.6000509@gmail.com>
	<4CD7076D.80507@bluewatersys.com>
	<AANLkTinJJG0K=BPS0CPzDWcgpRn_yPxZ819N408SwD6d@mail.gmail.com>
	<4CD85489.8000503@bluewatersys.com>
	<AANLkTim8rAQnVYpZdykd2VuL1N9CvkGj88Kf5qpSuJsC@mail.gmail.com>
	<4CD9B09F.5090707@bluewatersys.com>
	<AANLkTiky0LLnipJN3tCwcW6F2LEK-REEd=Ovo0ewMubR@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=Kf9K7Zi41hDFZ/FPmasnuBKhr7H0CfIMr2bgrVqmcVM=;
        b=fFsbMv7urI6aquE211VnNV2KISu+bYD1uJ1gZhpGfNiFH18Schstlcw7z/emjAZ2U7
         L1yJwmj76EHzHpn1FWp/09+U+WF9c8gA7IFTMa6y5xe3QKnUuZzuEuIL3wo3RqhUZuhC
         XlLwEYPFHVyEZgrCy6MXXVseA/vgwJZcV97ZQ=
In-Reply-To: <AANLkTiky0LLnipJN3tCwcW6F2LEK-REEd=Ovo0ewMubR@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Mallon <ryan@bluewatersys.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

2010/11/9 Geert Uytterhoeven <geert@linux-m68k.org>:
> On Tue, Nov 9, 2010 at 21:35, Ryan Mallon <ryan@bluewatersys.com> wrote:
>> You can still do all of those things without having a fixed endianess.
>> You just have to have one extra step of telling the external tools what
>> the endianess is. IMHO, it is better to have the overhead of the endian
>> conversion in the tools since it is less costly there than an the
>> embedded system.
>>
>> I'm just trying to understand why the fixed endianess rule cannot be
>> bent for such a specialised filesystem.
>
> When it was decided that filesystems should be fixed-endian and support for
> big-endian ext2 was dropped, the overhead of doing the fixed conversions was
> deetermined negligible due to compiler optimization.
> That was ages ago, and current embedded systems run circles around the
> machines of those days.
>
> Note that this is about metadata only. Actual file contents are always just
> byte streams.
>

I can add that the penalties in this case are  negligible due to the
compensation of the very fast access of the media. In addition, from
performance point of view I'm pretty happy (you can see the some
benchmark on the project web site).

Marco
