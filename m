From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: Subject: [PATCH 04/16] Squashfs: regular file operations
Date: Wed, 22 Oct 2008 18:35:18 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810221833360.5634@vixen.sonytel.be>
References: <E1KqrTW-0001xQ-Kx@dylan>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-429055810-1224693318=:5634"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <E1KqrTW-0001xQ-Kx@dylan>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-429055810-1224693318=:5634
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 17 Oct 2008, Phillip Lougher wrote:
> --- /dev/null
> +++ b/fs/squashfs/file.c
> +static long long read_blocklist(struct inode *inode, int index,
> +				unsigned int *bsize)
> +{
> +	long long start, block, blks;
> +	int offset;
> +	__le32 size;
> +	int res = fill_meta_index(inode, index, &start, &offset, &block);
> +
> +	TRACE("read_blocklist: res %d, index %d, start 0x%llx, offset"
> +		       " 0x%x, block 0x%llx\n", res, index, start, offset,
> +			block);
> +
> +	if (res == -1)
> +		goto failure;
                ^^^^^^^^^^^^^

> +		if (blks == -1)
> +			goto failure;
			^^^^^^^^^^^^^

> +	if (res == 0)
> +		goto failure;
                ^^^^^^^^^^^^^

> +failure:
> +	return -1;
> +}

As there's nothing to clean up, you can just use `return -1' instead of `goto
failure', and save a few lines.

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
---584349381-429055810-1224693318=:5634--
