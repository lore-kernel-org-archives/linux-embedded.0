From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH V3 11/17] Squashfs: block operations
Date: Mon, 5 Jan 2009 13:18:50 +0100
Message-ID: <20090105121850.GA31994@logfs.org>
References: <E1LJnJo-0002Lt-0v@dylan.lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1LJnJo-0002Lt-0v@dylan.lougher.demon.co.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com, sfr@canb.auug.org.au

Again, none of my comments are criticism against merging squashfs.  Cod=
e
improvements should continue independently.

On Mon, 5 January 2009 11:08:24 +0000, Phillip Lougher wrote:
> +/*
> + * Read and decompress a metadata block or datablock.  Length is non=
-zero
> + * if a datablock is being read (the size is stored elsewhere in the
> + * filesystem), otherwise the length is obtained from the first two =
bytes of
> + * the metadata block.  A bit in the length field indicates if the b=
lock
> + * is stored uncompressed in the filesystem (usually because compres=
sion
> + * generated a larger block - this does occasionally happen with zli=
b).
> + */

This is the core function of squashfs.  As such, it could probably use
some kerneldoc that explains each parameter and the return value;

> +int squashfs_read_data(struct super_block *sb, void **buffer, u64 in=
dex,
> +			int length, u64 *next_index, int srclength)
> +{
> +	struct squashfs_sb_info *msblk =3D sb->s_fs_info;
> +	struct buffer_head **bh;
> +	int offset =3D index & ((1 << msblk->devblksize_log2) - 1);
> +	u64 cur_index =3D index >> msblk->devblksize_log2;
> +	int bytes, compressed, b =3D 0, k =3D 0, page =3D 0, avail;
> +
> +
> +	bh =3D kcalloc((msblk->block_size >> msblk->devblksize_log2) + 1,
> +				sizeof(*bh), GFP_KERNEL);
> +	if (bh =3D=3D NULL)
> +		return -ENOMEM;
> +
> +	if (length) {
> +		/*
> +		 * Datablock.
> +		 */
> +		bytes =3D -offset;
> +		compressed =3D SQUASHFS_COMPRESSED_BLOCK(length);
> +		length =3D SQUASHFS_COMPRESSED_SIZE_BLOCK(length);
> +		if (next_index)
> +			*next_index =3D index + length;
> +
> +		TRACE("Block @ 0x%llx, %scompressed size %d, src size %d\n",
> +			index, compressed ? "" : "un", length, srclength);
> +
> +		if (length < 0 || length > srclength ||
> +				(index + length) > msblk->bytes_used)
> +			goto read_failure;
> +
> +		for (b =3D 0; bytes < length; b++, cur_index++) {
> +			bh[b] =3D sb_getblk(sb, cur_index);
> +			if (bh[b] =3D=3D NULL)
> +				goto block_release;
> +			bytes +=3D msblk->devblksize;
> +		}
> +		ll_rw_block(READ, b, bh);
> +	} else {
> +		/*
> +		 * Metadata block.
> +		 */
> +		if ((index + 2) > msblk->bytes_used)
> +			goto read_failure;
> +
> +		bh[0] =3D get_block_length(sb, &cur_index, &offset, &length);
> +		if (bh[0] =3D=3D NULL)
> +			goto read_failure;
> +		b =3D 1;
> +
> +		bytes =3D msblk->devblksize - offset;
> +		compressed =3D SQUASHFS_COMPRESSED(length);
> +		length =3D SQUASHFS_COMPRESSED_SIZE(length);
> +		if (next_index)
> +			*next_index =3D index + length + 2;
> +
> +		TRACE("Block @ 0x%llx, %scompressed size %d\n", index,
> +				compressed ? "" : "un", length);
> +
> +		if (length < 0 || length > srclength ||
> +					(index + length) > msblk->bytes_used)
> +			goto block_release;
> +
> +		for (; bytes < length; b++) {
> +			bh[b] =3D sb_getblk(sb, ++cur_index);
> +			if (bh[b] =3D=3D NULL)
> +				goto block_release;
> +			bytes +=3D msblk->devblksize;
> +		}
> +		ll_rw_block(READ, b - 1, bh + 1);
> +	}
> +
> +	if (compressed) {

This looks like a prime candidate for a seperate function.

> +		int zlib_err =3D 0, zlib_init =3D 0;
> +
> +		/*
> +		 * Uncompress block.
> +		 */
> +
> +		mutex_lock(&msblk->read_data_mutex);
> +
> +		msblk->stream.avail_out =3D 0;
> +		msblk->stream.avail_in =3D 0;
> +
> +		bytes =3D length;
> +		do {
> +			if (msblk->stream.avail_in =3D=3D 0 && k < b) {
> +				avail =3D min(bytes, msblk->devblksize - offset);
> +				bytes -=3D avail;
> +				wait_on_buffer(bh[k]);
> +				if (!buffer_uptodate(bh[k]))
> +					goto release_mutex;
> +
> +				if (avail =3D=3D 0) {
> +					offset =3D 0;
> +					put_bh(bh[k++]);
> +					continue;
> +				}
> +
> +				msblk->stream.next_in =3D bh[k]->b_data + offset;
> +				msblk->stream.avail_in =3D avail;
> +				offset =3D 0;
> +			}
> +
> +			if (msblk->stream.avail_out =3D=3D 0) {
> +				msblk->stream.next_out =3D buffer[page++];
> +				msblk->stream.avail_out =3D PAGE_CACHE_SIZE;
> +			}
> +
> +			if (!zlib_init) {

Could be moved outside the main loop.

> +				zlib_err =3D zlib_inflateInit(&msblk->stream);
> +				if (zlib_err !=3D Z_OK) {
> +					ERROR("zlib_inflateInit returned"
> +						" unexpected result 0x%x,"
> +						" srclength %d\n", zlib_err,
> +						srclength);
> +					goto release_mutex;
> +				}
> +				zlib_init =3D 1;
> +			}
> +
> +			zlib_err =3D zlib_inflate(&msblk->stream, Z_NO_FLUSH);
> +
> +			if (msblk->stream.avail_in =3D=3D 0 && k < b)
> +				put_bh(bh[k++]);
> +		} while (zlib_err =3D=3D Z_OK);
> +
> +		if (zlib_err !=3D Z_STREAM_END) {
> +			ERROR("zlib_inflate returned unexpected result"
> +				" 0x%x, srclength %d, avail_in %d,"
> +				" avail_out %d\n", zlib_err, srclength,
> +				msblk->stream.avail_in,
> +				msblk->stream.avail_out);
> +			goto release_mutex;
> +		}
> +
> +		zlib_err =3D zlib_inflateEnd(&msblk->stream);
> +		if (zlib_err !=3D Z_OK) {
> +			ERROR("zlib_inflateEnd returned unexpected result 0x%x,"
> +				" srclength %d\n", zlib_err, srclength);
> +			goto release_mutex;
> +		}
> +		length =3D msblk->stream.total_out;
> +		mutex_unlock(&msblk->read_data_mutex);
> +	} else {

Another candidate for a seperate function.  The complete condition coul=
d
look roughly like this:

	if (compressed)
		err =3D read_compressed_block(...);
	else
		err =3D read_uncompressed_block(...);

out:
	kfree(bh);
	if (err) {
		ERROR("sb_bread failed reading block -1x%llx\n", cur_index);
		return -EIO;
	}
	return length;

The only disadvantage I can see is the put_bh() loop in the error case
that would be duplicated in both read_*_block() functions.

> +		/*
> +		 * Block is uncompressed.
> +		 */
> +		int i, in, pg_offset =3D 0;
> +
> +		for (i =3D 0; i < b; i++) {
> +			wait_on_buffer(bh[i]);
> +			if (!buffer_uptodate(bh[i]))
> +				goto block_release;
> +		}
> +
> +		for (bytes =3D length; k < b; k++) {
> +			in =3D min(bytes, msblk->devblksize - offset);
> +			bytes -=3D in;
> +			while (in) {
> +				if (pg_offset =3D=3D PAGE_CACHE_SIZE) {
> +					page++;
> +					pg_offset =3D 0;
> +				}
> +				avail =3D min_t(int, in, PAGE_CACHE_SIZE -
> +						pg_offset);
> +				memcpy(buffer[page] + pg_offset,
> +						bh[k]->b_data + offset, avail);
> +				in -=3D avail;
> +				pg_offset +=3D avail;
> +				offset +=3D avail;
> +			}
> +			offset =3D 0;
> +			put_bh(bh[k]);
> +		}
> +	}
> +
> +	kfree(bh);
> +	return length;
> +
> +release_mutex:
> +	mutex_unlock(&msblk->read_data_mutex);
> +
> +block_release:
> +	for (; k < b; k++)
> +		put_bh(bh[k]);
> +
> +read_failure:
> +	ERROR("sb_bread failed reading block 0x%llx\n", cur_index);
> +	kfree(bh);
> +	return -EIO;
> +}
> --=20
> 1.5.6.3
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

J=C3=B6rn

--=20
Optimizations always bust things, because all optimizations are, in
the long haul, a form of cheating, and cheaters eventually get caught.
-- Larry Wall
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
