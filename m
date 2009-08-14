From: Zan Lynx <zlynx@acm.org>
Subject: Re: New fast(?)-boot results on ARM
Date: Fri, 14 Aug 2009 15:35:27 -0600
Message-ID: <4A85D89F.8080900@acm.org>
References: <20090814170228.GM13320@pengutronix.de> <4A85AAC4.7050505@acm.org>	 <20090814185731.GN13320@pengutronix.de> <63386a3d0908141401t6050f39ey8d85213aeccf748a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756517AbZHNVfz@vger.kernel.org>
In-Reply-To: <63386a3d0908141401t6050f39ey8d85213aeccf748a@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

Linus Walleij wrote:
> 2009/8/14 Robert Schwebel <r.schwebel@pengutronix.de>:
>> On Fri, Aug 14, 2009 at 12:19:48PM -0600, Zan Lynx wrote:
> 
>>>> That's factor 70 away from the 110 ms boot time Tim has talked about
>>>> some days ago (and he measured on an ARM cpu which had almost half
>>>> the speed of this one), and I'm wondering what we can do to improve
>>>> the boot time.
>>> 2.4s in uncompression? That seems like an obvious target for
>>> improvement.
>> Indeed, we'll check that.
> 
> We got rid of uncompression on a flash-based system vastly improving
> boot time. The reason is that compressed kernels are faster only when
> the throughput to the persistent storage is lower than the decompression
> throughput, and on typical embedded systems with DMA the throughput to
> memory outperforms the CPU-based decompression.

I thought of another thing to check related to slow decompression. If 
the kernel, bootloader or hardware is in charge of setting CPU power and 
speed scaling, then you should check that it boots with the CPU set at 
maximum speed instead of slowest.

-- 
Zan Lynx
zlynx@acm.org

"Knowledge is Power.  Power Corrupts.  Study Hard.  Be Evil."
