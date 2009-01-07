From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH V3 01/17] Squashfs: inode operations
Date: Wed, 7 Jan 2009 19:00:24 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0901071854210.32034@vixen.sonytel.be>
References: <E1LJnJn-0002L2-GZ@dylan.lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759901AbZAGSAu@vger.kernel.org>
In-Reply-To: <E1LJnJn-0002L2-GZ@dylan.lougher.demon.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, sfr@canb.auug.org.au, Linux/PPC Development <linuxppc-dev@ozlabs.org>

On Mon, 5 Jan 2009, Phillip Lougher wrote:
> diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
> new file mode 100644
> index 0000000..7a63398
> --- /dev/null
> +++ b/fs/squashfs/inode.c
> @@ -0,0 +1,346 @@

> +int squashfs_read_inode(struct inode *inode, long long ino)
> +{
> +	struct super_block *sb =3D inode->i_sb;
> +	struct squashfs_sb_info *msblk =3D sb->s_fs_info;
> +	u64 block =3D SQUASHFS_INODE_BLK(ino) + msblk->inode_table;
        ^^^

> +		TRACE("File inode %x:%x, start_block %llx, block_list_start "
                                                     ^^^^
> +			"%llx, offset %x\n", SQUASHFS_INODE_BLK(ino),
                         ^^^^
> +			offset, squashfs_i(inode)->start, block, offset);

Note that I get lots of

| warning: format '%llx' expects type 'long long unsigned int', but arg=
ument 3 has type 'u64'

on ppc64, since you switched from `unsigned long long' to 'u64', as `u6=
4' is
(still -- this is being changed) `unsigned long' on pp64.

I guess no action has to be taken, for now?

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
