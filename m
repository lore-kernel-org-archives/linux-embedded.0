From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH V2 10/16] Squashfs: cache operations
Date: Fri, 31 Oct 2008 08:29:23 +0100
Message-ID: <20081031072923.GA18182@logfs.org>
References: <E1Kv0C4-0006HO-BC@dylan> <20081029093218.GA26456@logfs.org> <490A8D02.4090407@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <490A8D02.4090407@lougher.demon.co.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

On Fri, 31 October 2008 04:43:46 +0000, Phillip Lougher wrote:
>=20
> Simplicity and speed is extremely important.  The=20
> squashfs_metadata_read() wrapper around the cache is designed to step=
=20
> through the metadata a structure at a time (20 or so bytes), updating=
=20
> the read position in the metadata each call, with more metadata cache=
=20
> blocks being read and decompressed as necessary.  The common case whe=
re=20
> the metadata is already in the cache (because we're stepping through =
it=20
> 20 or so bytes at a time), is designed to be extremely fast - a spinl=
ock=20
> and array search only.  I recently optimised the cache to use spinloc=
ks=20
> rather than mutexes and reduced the lock holding time (necessary to m=
ove=20
> to spinlocks), and this resulted in a 20%+ speed improvement in readi=
ng=20
> squashfs filesystems.

=46or the page cache, you can use read_cache_page() and
page_cache_release().  This does not even take a spinlock, hence
multiple readers can work in parallel.  The radix tree walk will take a
similar time to your array search.

You are aware that multiple cpus will play pingpong with your spinlock?

> Given the above using an address space in the page cache will result =
in=20
> greater complexity, more memory overhead, and much slower operation.=20
> There's a number of reasons for this.
>=20
> 1. The amount and life-span of the data stored in the page cache is=20
> outside of Squashfs' control.  As explained above it only makes sense=
 to=20
> temporarily cache the last couple of metadata and fragment blocks.=20
> Using the page cache (if a 'large' address space is used) for these=20
> keeps more of them around for longer than necessary, and will=20
> potentially cause more worthy datablocks to be flushed on memory pres=
sure.

I personally find it hard to guess access patterns.  If I constructed a
workload just large enough that your cache is slightly too small, it
will start thrashing.  Hit rates will go close to zero.  And unless I
missed something, such a workload can be constructed and may even be
used in real life.  With growing numbers of cores, this becomes
increasingly likely.

In other cases, an idle squashfs will still hold the 64k of unused cach=
e
for ransom.  By giving up control, you allow your cache to grow and
shrink as desired and can avoid both cases.

> 2. The address space will be caching uncompressed data, the squashfs=20
> references to this data are the compressed locations within the=20
> filesystem.  There doesn't exist a one-to-one linear mapping from=20
> compressed location to decompressed location in the address space.  T=
his=20
> means a lookup table still needs to be used to store the mapping from=
=20
> compressed location to decompressed location in the address space.  N=
ow=20
> this lookup table (however implemented) is itself at least as complex=
 as=20
> my current cache implementation.

You are currently using physical offset of the medium to address blocks
in the cache, which are 64bit.  Page cache may use 32bit to address
pages.  And since blocks can be larger than pages, you effectively need
some bits extra.  This is indeed a problem.

> 3. Once the locations of the decompressed pages in the address space=20
> have been found, they'll need to be looked up in the page cache, and=20
> this has to be done for every 4K page.  With the default fragment siz=
e=20
> of 128 KiB this means 32 separate lookups.  Somewhat slower than one=20
> spinlock and array search per 128 KiB block in the squashfs cache=20
> implementation.

Above you claimed the complete cache to be just 64k in size.  How can
you access 128k blocks that way?  One of the numbers appears wrong.

Ignoring that, you don't need to take either the spinlock or do a looku=
p
in a fast path.  If you currently have this code:

	for (some condition) {
		err =3D squashfs_read_metadata(address, ...);
	}

You can transform it to:

	void *handle =3D squashfs_get_metadata(address, ...);
	for (some condition) {
		err =3D squashfs_read_metadata(handle, address, ...);
	}
	squashfs_put_metadata(handle);

With the handle you can keep a reference count to your cached object.
squashfs_read_metadata() only has to call squashfs_cache_get() or
squashfs_cache_put() when moving across object boundaries.  In the
common case it simply returns data from the object referenced through
the handle.

This might be a worthwhile optimization independently of whether you us=
e
the page cache or not.

> Comments, especially those of the form "you've got this completely=20
> wrong, and you can use the page cache like this, which will be simple=
r=20
> and faster than your current implementation" welcome :)  I'm not adve=
rse=20
>  to using the page cache, but I can't see how it will be simpler or=20
> faster than the current implementation.

Only one of your problems seems to be real.  Not sure if or how we can
solve that one, though.

J=C3=B6rn

--=20
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
