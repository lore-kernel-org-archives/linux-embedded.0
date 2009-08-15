From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: New fast(?)-boot results on ARM
Date: Sat, 15 Aug 2009 09:14:48 +0300
Message-ID: <4A865258.5090903@gmail.com>
References: <20090814170228.GM13320@pengutronix.de> <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On 08/14/2009 11:04 PM, Denys Vlasenko wrote:
>> [  2.742628]<    0.016050>  0x000000360000-0x000004000000 : "root"
>> [  3.058610]<    0.315982>  UBI: attaching mtd7 to ubi0
>> [  3.062878]<    0.004268>  UBI: physical eraseblock size:   16384 b=
ytes (16 KiB)
>> [  3.070601]<    0.007723>  UBI: logical eraseblock size:    15360 b=
ytes
>> [  3.070665]<    0.000064>  UBI: smallest flash I/O unit:    512
>> [  3.078564]<    0.007899>  UBI: VID header offset:          512 (al=
igned 512)
>> [  3.078609]<    0.000045>  UBI: data offset:                1024
>> [  5.006609]<    1.928000>  UBI: attached mtd7 to ubi0
>> [  5.013157]<    0.006548>  UBI: MTD device name:            "root"
>
> As others commented, ubi looks slow and you probably need to find out=
 why.

Right. UBI is rather slow in attaching MTD devices. Everything is expla=
ined
here:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_scalability
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_scalability

There is not very much you can do to speed it up but implement UBI2. UB=
IFS
would stay intact. There were discussions about this and it does not se=
em
to be impossibly difficult to do UBI2. Here are few ideas:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_attach_faster

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
