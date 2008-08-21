From: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH 10/10] AXFS: axfs_uncompress.c
Date: Thu, 21 Aug 2008 14:40:38 +0300
Message-ID: <1219318838.18027.68.camel@sauron>
References: <48AD0126.1050609@gmail.com>
Reply-To: dedekind@infradead.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD0126.1050609@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Wed, 2008-08-20 at 22:46 -0700, Jared Hulbert wrote:
> +	err =3D zlib_inflateReset(&stream);
> +	if (err !=3D Z_OK) {
> +		printk(KERN_ERR "zlib_inflateReset error %d\n", err);
> +		zlib_inflateEnd(&stream);
> +		zlib_inflateInit(&stream);
> +	}

Jared,

just FYI, are you aware that LZO which is also present in the kernel is
much faster on decompress than zlib, while its compression is only
slightly worse?

I do not remember the digits, but last time I tested UBIFS, LZO
decompression was about 3 times faster than zlib on OMAP3. This depends
on architecture, etc of course. This may matter a lot if one is fightin=
g
for faster system boot-up. So you might consider supporting LZO as well=
=2E

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
