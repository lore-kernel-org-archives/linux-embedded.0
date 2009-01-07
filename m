From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH V3 10/17] Squashfs: cache operations
Date: Wed, 7 Jan 2009 17:17:20 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0901071713570.16480@vixen.sonytel.be>
References: <E1LJnJn-0002Lm-Va@dylan.lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <E1LJnJn-0002Lm-Va@dylan.lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com, sfr@canb.auug.org.au

On Mon, 5 Jan 2009, Phillip Lougher wrote:
> diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
> new file mode 100644
> index 0000000..f29eda1
> --- /dev/null
> +++ b/fs/squashfs/cache.c

> +/*
> + * Copy upto length bytes from cache entry to buffer starting at off=
set bytes
> + * into the cache entry.  If there's not length bytes then copy the =
number of
> + * bytes available.  In all cases return the number of bytes copied.
> + */
> +int squashfs_copy_data(void *buffer, struct squashfs_cache_entry *en=
try,
                                        ^
					const?

It also makes it clear from the prototype in which direction is copied.
> +		int offset, int length)
                ^^^         ^^^
> +{
> +	int remaining =3D length;
        ^^^
Shouldn't all of these be unsigned int?

> +
> +	if (length =3D=3D 0)
> +		return 0;
> +	else if (buffer =3D=3D NULL)
> +		return min(length, entry->length - offset);
> +
> +	while (offset < entry->length) {
> +		void *buff =3D entry->data[offset / PAGE_CACHE_SIZE]
> +				+ (offset % PAGE_CACHE_SIZE);
> +		int bytes =3D min_t(int, entry->length - offset,
> +				PAGE_CACHE_SIZE - (offset % PAGE_CACHE_SIZE));
> +
> +		if (bytes >=3D remaining) {
> +			memcpy(buffer, buff, remaining);
> +			remaining =3D 0;
> +			break;
> +		}
> +
> +		memcpy(buffer, buff, bytes);
> +		buffer +=3D bytes;
> +		remaining -=3D bytes;
> +		offset +=3D bytes;
> +	}
> +
> +	return length - remaining;
> +}

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =C2=B7 Da Vincilaan 7-D1 =C2=B7 B-1935 Zaventem =C2=
=B7 Belgium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =C2=B7 RPR Brussels
=46ortis =C2=B7 BIC GEBABEBB =C2=B7 IBAN BE41293037680010
