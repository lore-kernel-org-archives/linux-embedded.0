From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: New fast(?)-boot results on ARM
Date: Sat, 15 Aug 2009 09:21:16 +0300
Message-ID: <4A8653DC.3050102@gmail.com>
References: <20090814170228.GM13320@pengutronix.de> <4A85AAC4.7050505@acm.org>	 <20090814185731.GN13320@pengutronix.de> <63386a3d0908141401t6050f39ey8d85213aeccf748a@mail.gmail.com> <4A85D89F.8080900@acm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A85D89F.8080900@acm.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Zan Lynx <zlynx@acm.org>
Cc: Linus Walleij <linus.ml.walleij@gmail.com>, Robert Schwebel <r.schwebel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On 08/15/2009 12:35 AM, Zan Lynx wrote:
> Linus Walleij wrote:
>> 2009/8/14 Robert Schwebel <r.schwebel@pengutronix.de>:
>>> On Fri, Aug 14, 2009 at 12:19:48PM -0600, Zan Lynx wrote:
>>
>>>>> That's factor 70 away from the 110 ms boot time Tim has talked ab=
out
>>>>> some days ago (and he measured on an ARM cpu which had almost hal=
f
>>>>> the speed of this one), and I'm wondering what we can do to impro=
ve
>>>>> the boot time.
>>>> 2.4s in uncompression? That seems like an obvious target for
>>>> improvement.
>>> Indeed, we'll check that.
>>
>> We got rid of uncompression on a flash-based system vastly improving
>> boot time. The reason is that compressed kernels are faster only whe=
n
>> the throughput to the persistent storage is lower than the decompres=
sion
>> throughput, and on typical embedded systems with DMA the throughput =
to
>> memory outperforms the CPU-based decompression.
>
> I thought of another thing to check related to slow decompression. If
> the kernel, bootloader or hardware is in charge of setting CPU power =
and
> speed scaling, then you should check that it boots with the CPU set a=
t
> maximum speed instead of slowest.

zlib is slow on decompression, and lzo is much faster. So if you implem=
ent
lzo compression, you'll probably speed things up a little as well. I sa=
w
some discussions about this on lkml. Having no compression at all may a=
lso
be a good thing to try.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
