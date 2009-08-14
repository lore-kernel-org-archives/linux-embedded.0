From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: New fast(?)-boot results on ARM
Date: Fri, 14 Aug 2009 23:01:58 +0200
Message-ID: <63386a3d0908141401t6050f39ey8d85213aeccf748a@mail.gmail.com>
References: <20090814170228.GM13320@pengutronix.de> <4A85AAC4.7050505@acm.org>
	 <20090814185731.GN13320@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=VTI4PdS7iIXx/c2ip73j7bPHz9WaY0K1an6Fxqb5Aaw=;
        b=cOLz/KJ27pNBMWpNOQPsxt+jOebAFfl+IGijJUpADgZpY112ed7NcPutlf0P/Uk2d4
         ERETEGA92jo3DEP1PbOZLxXcRZhgQulpROPvlL+bdFNYeJVtzCBkSTZopCKg2gR2Hu7C
         yJFt2vsj1DV6HWmaHImvcmMBfUNko3F/n3mbg=
In-Reply-To: <20090814185731.GN13320@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Zan Lynx <zlynx@acm.org>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

2009/8/14 Robert Schwebel <r.schwebel@pengutronix.de>:
> On Fri, Aug 14, 2009 at 12:19:48PM -0600, Zan Lynx wrote:

>> > That's factor 70 away from the 110 ms boot time Tim has talked about
>> > some days ago (and he measured on an ARM cpu which had almost half
>> > the speed of this one), and I'm wondering what we can do to improve
>> > the boot time.
>>
>> 2.4s in uncompression? That seems like an obvious target for
>> improvement.
>
> Indeed, we'll check that.

We got rid of uncompression on a flash-based system vastly improving
boot time. The reason is that compressed kernels are faster only when
the throughput to the persistent storage is lower than the decompression
throughput, and on typical embedded systems with DMA the throughput to
memory outperforms the CPU-based decompression.

Of course it depends on a lot of stuff like performance of flash controller,
kernel storage filesystem performance, DMA controller performance,
cache architecture etc so it's individual per-system.

Linus Walleij
