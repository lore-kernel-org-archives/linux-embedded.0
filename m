From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH V2 10/16] Squashfs: cache operations
Date: Wed, 29 Oct 2008 10:32:18 +0100
Message-ID: <20081029093218.GA26456@logfs.org>
References: <E1Kv0C4-0006HO-BC@dylan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1Kv0C4-0006HO-BC@dylan>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

On Wed, 29 October 2008 01:49:56 +0000, Phillip Lougher wrote:
> +/*
> + * Blocks in Squashfs are compressed.  To avoid repeatedly decompres=
sing
> + * recently accessed data Squashfs uses two small metadata and fragm=
ent caches.
> + *
> + * This file implements a generic cache implementation used for both=
 caches,
> + * plus functions layered ontop of the generic cache implementation =
to
> + * access the metadata and fragment caches.
> + */

I tend to agree with Andrew that a lot of this should be done by the
page cache instead.  One of the problems seems to be that your blocksiz=
e
can exceed page size and there really isn't any infrastructure to deal
with such cases yet.  Bufferheads deal with blocks smaller than a page,
not the other way around.

Another is that address spaces are limited ot 16TB on 32bit
architectures.  I guess that should be good enough for a while.  I've
heard some rumors that btrfs actually uses multiple address spaces to
handle this problem, so a good strategy may be to sit back, wait and
simply copy what btrfs does once the issue becomes pressing.

To deal with large blocks, you most likely want to keep you struct
squashfs_cache_entry around and have page->private point to it.  But be
warned, as the whole page->private business is - shall we say - fragile=
=2E
You need to supply a number of methods to make things work.  And if you
fail to set any one of them, core code will assume a default, which is
to call into the bufferhead code.  And the backtrace you will receive
some time later has little or no indication that you actually only
missed one method.  I've been meaning to clean this up, but never found
the courage to actually do it.

> +/*
> + * Look-up block in cache, and increment usage count.  If not in cac=
he, read
> + * and decompress it from disk.
> + */
> +struct squashfs_cache_entry *squashfs_cache_get(struct super_block *=
sb,
> +	struct squashfs_cache *cache, long long block, int length)

I personally prefer u64 instead of long long.  It is a device address
for a 64bit filesystem after all.  Same for next_index.

> +		if (i =3D=3D cache->entries) {
> +			/*
> +			 * Block not in cache, if all cache entries are locked
> +			 * go to sleep waiting for one to become available.
> +			 */
> +			if (cache->unused =3D=3D 0) {
> +				cache->waiting++;
> +				spin_unlock(&cache->lock);
> +				wait_event(cache->wait_queue, cache->unused);
> +				spin_lock(&cache->lock);
> +				cache->waiting--;

Maybe rename to no_waiters?  "waiting" looks more like a boolean.

> +			entry->length =3D squashfs_read_data(sb, entry->data,
> +				block, length, &entry->next_index,
> +				cache->block_size);
> +
> +			spin_lock(&cache->lock);
> +
> +			if (entry->length < 0)
> +				entry->error =3D entry->length;

entry->error is of type char.  We actually have errno's defined up to
131, so if by whatever freak chance the error is -ENOTRECOVERABLE, this
will convert it to a positive number.  I wouldn't want to debug that.

> +void squashfs_cache_put(struct squashfs_cache *cache,
> +				struct squashfs_cache_entry *entry)
> +{
> +	spin_lock(&cache->lock);
> +	entry->locked--;
> +	if (entry->locked =3D=3D 0) {

You might want to rename this to "refcount", just to make the name matc=
h
the behaviour.

J=C3=B6rn

--=20
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
