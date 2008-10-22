From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: Subject: [PATCH 01/16] Squashfs: inode operations
Date: Wed, 22 Oct 2008 18:32:39 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810221830020.5634@vixen.sonytel.be>
References: <E1KqrTW-0001xC-9M@dylan>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-1983641362-1224693159=:5634"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <E1KqrTW-0001xC-9M@dylan>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-1983641362-1224693159=:5634
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 17 Oct 2008, Phillip Lougher wrote:
> --- /dev/null
> +++ b/fs/squashfs/inode.c

> +static int squashfs_new_inode(struct super_block *s, struct inode *i,
> +				struct squashfs_base_inode *inodeb)
> +{
> +	if (squashfs_get_id(s, le16_to_cpu(inodeb->uid), &i->i_uid) == 0)
> +		goto out;
                ^^^^^^^^
> +	if (squashfs_get_id(s, le16_to_cpu(inodeb->guid), &i->i_gid) == 0)
> +		goto out;
                ^^^^^^^^

> +	return 1;
> +
> +out:
> +	return 0;
> +}

As there's nothing to clean up, you can just use `return 0' instead of `goto
out'.

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
---584349381-1983641362-1224693159=:5634--
