From: James Hogan <james@albanarts.com>
Subject: Re: [PATCH 10/16 v2] pramfs: XIP operations
Date: Sat, 6 Nov 2010 13:33:30 +0000
Message-ID: <20101106133330.GC13522@gandalf.local>
References: <4CD518EF.3030306@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CD518EF.3030306@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Hi,

On Sat, Nov 06, 2010 at 09:59:27AM +0100, Marco Stornelli wrote:
> diff -Nurp linux-2.6.36-orig/fs/pramfs/xip.c linux-2.6.36/fs/pramfs/x=
ip.c
> --- linux-2.6.36-orig/fs/pramfs/xip.c	1970-01-01 01:00:00.000000000 +=
0100
> +++ linux-2.6.36/fs/pramfs/xip.c	2010-09-14 18:49:52.000000000 +0200
<snip>
> +static int pram_find_and_alloc_blocks(struct inode *inode, sector_t =
iblock,
> +				     sector_t *data_block, int create)
> +{
> +	int err =3D -EIO;
> +	u64 block;
> +
> +	mutex_lock(&PRAM_I(inode)->truncate_lock);

fs/pramfs/xip.c: In function =E2=80=98pram_find_and_alloc_blocks=E2=80=99=
:
fs/pramfs/xip.c:27: error: =E2=80=98struct pram_inode_vfs=E2=80=99 has =
no member named
=E2=80=98truncate_lock=E2=80=99
fs/pramfs/xip.c:52: error: =E2=80=98struct pram_inode_vfs=E2=80=99 has =
no member named
=E2=80=98truncate_lock=E2=80=99

i guess that should be truncate_mutex.

> +
> +	block =3D pram_find_data_block(inode, iblock);
> +
> +	if (!block) {
> +		if (!create) {
> +			err =3D -ENODATA;
> +			goto err;
> +		}
> +
> +		err =3D pram_alloc_blocks(inode, iblock, 1);
> +		if (err)
> +			goto err;
> +
> +		block =3D pram_find_data_block(inode, iblock);
> +		if (!block) {
> +			err =3D -ENODATA;
> +			goto err;
> +		}
> +	}
> +
> +	*data_block =3D block;
> +	err =3D 0;
> +
> + err:
> +	mutex_unlock(&PRAM_I(inode)->truncate_lock);

same here

> +	return err;
> +}

Cheers
James
