From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 3/5] cramfs: implement uncompressed and arbitrary data
 block positioning
Date: Wed, 16 Aug 2017 18:28:29 +0000
Message-ID: <SG2PR06MB116546DC62F55230D246DC0D8A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org>
 <20170816173536.1879-4-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KzM6xELoaPsHD+ml/59NzYS7QJvkqJQ9/F2YKVDoIh0=;
 b=XkGBXtvF0dKYpdqgE3dUaLV/0ngxzar/5Qj8fVfEIs43bpG9w4ypPZCMcPLJvwRHcHYKLedKqq8TAe0/0iqQtuuP+Hx4We/b3BebcdBQ+TVw39XM8p35icLAKwf+xvhvzDm8krvHNpm9VMVP9VwP8oCiLOla0opyUljbge3Kh8c=
In-Reply-To: <20170816173536.1879-4-nicolas.pitre@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday, August 16, 2017, Nicolas Pitre wrote:
> Two new capabilities are introduced here:
>=20
> - The ability to store some blocks uncompressed.
>=20
> - The ability to locate blocks anywhere.
>=20
> Those capabilities can be used independently, but the combination
> opens the possibility for execute-in-place (XIP) of program text segments
> that must remain uncompressed, and in the MMU case, must have a specific
> alignment.  It is even possible to still have the writable data segments
> from the same file compressed as they have to be copied into RAM anyway.
>=20
> This is achieved by giving special meanings to some unused block pointer
> bits while remaining compatible with legacy cramfs images.
>=20
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> ---
>  fs/cramfs/README               | 31 ++++++++++++++-
>  fs/cramfs/inode.c              | 87 +++++++++++++++++++++++++++++++++---=
-
> -----
>  include/uapi/linux/cramfs_fs.h | 20 +++++++++-
>  3 files changed, 118 insertions(+), 20 deletions(-)
>=20
> diff --git a/fs/cramfs/README b/fs/cramfs/README
> index 9d4e7ea311..d71b27e0ff 100644
> --- a/fs/cramfs/README
> +++ b/fs/cramfs/README
> @@ -49,17 +49,46 @@ same as the start of the (i+1)'th <block> if there is
> one).  The first
>  <block> immediately follows the last <block_pointer> for the file.
>  <block_pointer>s are each 32 bits long.
>=20
> +When the CRAMFS_FLAG_EXT_BLOCK_POINTERS capability bit is set, each
> +<block_pointer>'s top bits may contain special flags as follows:
> +
> +CRAMFS_BLK_FLAG_UNCOMPRESSED (bit 31):
> +	The block data is not compressed and should be copied verbatim.
> +
> +CRAMFS_BLK_FLAG_DIRECT_PTR (bit 30):
> +	The <block_pointer> stores the actual block start offset and not
> +	its end, shifted right by 2 bits. The block must therefore be
> +	aligned to a 4-byte boundary. The block size is either blksize
> +	if CRAMFS_BLK_FLAG_UNCOMPRESSED is also specified, otherwise
> +	the compressed data length is included in the first 2 bytes of
> +	the block data. This is used to allow discontiguous data layout
> +	and specific data block alignments e.g. for XIP applications.
> +
> +
>  The order of <file_data>'s is a depth-first descent of the directory
>  tree, i.e. the same order as `find -size +0 \( -type f -o -type l \)
>  -print'.
>=20
>=20
>  <block>: The i'th <block> is the output of zlib's compress function
> -applied to the i'th blksize-sized chunk of the input data.
> +applied to the i'th blksize-sized chunk of the input data if the
> +corresponding CRAMFS_BLK_FLAG_UNCOMPRESSED <block_ptr> bit is not set,
> +otherwise it is the input data directly.
>  (For the last <block> of the file, the input may of course be smaller.)
>  Each <block> may be a different size.  (See <block_pointer> above.)
> +
>  <block>s are merely byte-aligned, not generally u32-aligned.
>=20
> +When CRAMFS_BLK_FLAG_DIRECT_PTR is specified then the corresponding
> +<block> may be located anywhere and not necessarily contiguous with
> +the previous/next blocks. In that case it is minimally u32-aligned.
> +If CRAMFS_BLK_FLAG_UNCOMPRESSED is also specified then the size is alway=
s
> +blksize except for the last block which is limited by the file length.
> +If CRAMFS_BLK_FLAG_DIRECT_PTR is set and CRAMFS_BLK_FLAG_UNCOMPRESSED
> +is not set then the first 2 bytes of the block contains the size of the
> +remaining block data as this cannot be determined from the placement of
> +logically adjacent blocks.
> +
>=20
>  Holes
>  -----
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index 393eb27ef4..b825ae162c 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c
> @@ -636,33 +636,84 @@ static int cramfs_readpage(struct file *file, struc=
t
> page *page)
>  	if (page->index < maxblock) {
>  		struct super_block *sb =3D inode->i_sb;
>  		u32 blkptr_offset =3D OFFSET(inode) + page->index*4;
> -		u32 start_offset, compr_len;
> +		u32 block_ptr, block_start, block_len;
> +		bool uncompressed, direct;
>=20
> -		start_offset =3D OFFSET(inode) + maxblock*4;
>  		mutex_lock(&read_mutex);
> -		if (page->index)
> -			start_offset =3D *(u32 *) cramfs_read(sb, blkptr_offset-4,
> -				4);
> -		compr_len =3D (*(u32 *) cramfs_read(sb, blkptr_offset, 4) -
> -			start_offset);
> -		mutex_unlock(&read_mutex);
> +		block_ptr =3D *(u32 *) cramfs_read(sb, blkptr_offset, 4);
> +		uncompressed =3D (block_ptr & CRAMFS_BLK_FLAG_UNCOMPRESSED);
> +		direct =3D (block_ptr & CRAMFS_BLK_FLAG_DIRECT_PTR);
> +		block_ptr &=3D ~CRAMFS_BLK_FLAGS;
> +
> +		if (direct) {
> +			/*
> +			 * The block pointer is an absolute start pointer,
> +			 * shifted by 2 bits. The size is included in the
> +			 * first 2 bytes of the data block when compressed,
> +			 * or PAGE_SIZE otherwise.
> +			 */
> +			block_start =3D block_ptr << 2;
> +			if (uncompressed) {
> +				block_len =3D PAGE_SIZE;
> +				/* if last block: cap to file length */
> +				if (page->index =3D=3D maxblock - 1)
> +					block_len =3D offset_in_page(inode->i_size);
> +			} else {
> +				block_len =3D *(u16 *)
> +					cramfs_read(sb, block_start, 2);
> +				block_start +=3D 2;
> +			}
> +		} else {
> +			/*
> +			 * The block pointer indicates one past the end of
> +			 * the current block (start of next block). If this
> +			 * is the first block then it starts where the block
> +			 * pointer table ends, otherwise its start comes
> +			 * from the previous block's pointer.
> +			 */
> +			block_start =3D OFFSET(inode) + maxblock*4;
> +			if (page->index)
> +				block_start =3D *(u32 *)
> +					cramfs_read(sb, blkptr_offset-4, 4);
> +			/* Beware... previous ptr might be a direct ptr */
> +			if (unlikely(block_start & CRAMFS_BLK_FLAG_DIRECT_PTR))
> {
> +				/* See comments on earlier code. */
> +				u32 prev_start =3D block_start;
> +			       block_start =3D prev_start & ~CRAMFS_BLK_FLAGS;
> +			       block_start <<=3D 2;
> +				if (prev_start & CRAMFS_BLK_FLAG_UNCOMPRESSED) {
> +					block_start +=3D PAGE_SIZE;
> +				} else {
> +					block_len =3D *(u16 *)
> +						cramfs_read(sb, block_start, 2);
> +					block_start +=3D 2 + block_len;
> +				}
> +			}
> +			block_start &=3D ~CRAMFS_BLK_FLAGS;
> +			block_len =3D block_ptr - block_start;
> +		}
>=20
> -		if (compr_len =3D=3D 0)
> +		if (block_len =3D=3D 0)
>  			; /* hole */
> -		else if (unlikely(compr_len > (PAGE_SIZE << 1))) {
> -			pr_err("bad compressed blocksize %u\n",
> -				compr_len);
> +		else if (unlikely(block_len > 2*PAGE_SIZE ||
> +				  (uncompressed && block_len > PAGE_SIZE))) {
> +			mutex_unlock(&read_mutex);
> +			pr_err("bad data blocksize %u\n", block_len);
>  			goto err;
> +		} else if (uncompressed) {
> +			memcpy(pgdata,
> +			       cramfs_read(sb, block_start, block_len),
> +			       block_len);
> +			bytes_filled =3D block_len;
>  		} else {
> -			mutex_lock(&read_mutex);
>  			bytes_filled =3D cramfs_uncompress_block(pgdata,
>  				 PAGE_SIZE,
> -				 cramfs_read(sb, start_offset, compr_len),
> -				 compr_len);
> -			mutex_unlock(&read_mutex);
> -			if (unlikely(bytes_filled < 0))
> -				goto err;
> +				 cramfs_read(sb, block_start, block_len),
> +				 block_len);
>  		}
> +		mutex_unlock(&read_mutex);
> +		if (unlikely(bytes_filled < 0))
> +			goto err;
>  	}
>=20
>  	memset(pgdata + bytes_filled, 0, PAGE_SIZE - bytes_filled);
> diff --git a/include/uapi/linux/cramfs_fs.h
> b/include/uapi/linux/cramfs_fs.h
> index e4611a9b92..ed250aa372 100644
> --- a/include/uapi/linux/cramfs_fs.h
> +++ b/include/uapi/linux/cramfs_fs.h
> @@ -73,6 +73,7 @@ struct cramfs_super {
>  #define CRAMFS_FLAG_HOLES		0x00000100	/* support for holes */
>  #define CRAMFS_FLAG_WRONG_SIGNATURE	0x00000200	/* reserved */
>  #define CRAMFS_FLAG_SHIFTED_ROOT_OFFSET	0x00000400	/* shifted root fs
> */
> +#define CRAMFS_FLAG_EXT_BLOCK_POINTERS	0x00000800	/* block pointer
> extensions */
>=20
>  /*
>   * Valid values in super.flags.  Currently we refuse to mount
> @@ -82,7 +83,24 @@ struct cramfs_super {
>  #define CRAMFS_SUPPORTED_FLAGS	( 0x000000ff \
>  				| CRAMFS_FLAG_HOLES \
>  				| CRAMFS_FLAG_WRONG_SIGNATURE \
> -				| CRAMFS_FLAG_SHIFTED_ROOT_OFFSET )
> +				| CRAMFS_FLAG_SHIFTED_ROOT_OFFSET \
> +				| CRAMFS_FLAG_EXT_BLOCK_POINTERS )
>=20
> +/*
> + * Block pointer flags
> + *
> + * The maximum block offset that needs to be represented is roughly:
> + *=20


trailing whitespace


-Chris
