From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH V2 10/16] Squashfs: cache operations
Date: Fri, 31 Oct 2008 04:43:46 +0000
Message-ID: <490A8D02.4090407@lougher.demon.co.uk>
References: <E1Kv0C4-0006HO-BC@dylan> <20081029093218.GA26456@logfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20081029093218.GA26456@logfs.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

J=C3=B6rn Engel wrote:
> On Wed, 29 October 2008 01:49:56 +0000, Phillip Lougher wrote:
>> +/*
>> + * Blocks in Squashfs are compressed.  To avoid repeatedly decompre=
ssing
>> + * recently accessed data Squashfs uses two small metadata and frag=
ment caches.
>> + *
>> + * This file implements a generic cache implementation used for bot=
h caches,
>> + * plus functions layered ontop of the generic cache implementation=
 to
>> + * access the metadata and fragment caches.
>> + */
>=20
> I tend to agree with Andrew that a lot of this should be done by the
> page cache instead.  One of the problems seems to be that your blocks=
ize
> can exceed page size and there really isn't any infrastructure to dea=
l
> with such cases yet.  Bufferheads deal with blocks smaller than a pag=
e,
> not the other way around.
>=20

I thought about using the page cache, but, the fact that blocksizes=20
exceed the page cache size is only one of a number of reasons why I=20
prefer the current solution, there is also simplicity and speed to cons=
ider.

There are three types of compressed block in Squashfs: datablocks,=20
fragments, and metadata blocks.  Of these datablocks (by far the larges=
t=20
number of blocks) are decompressed and pushed into the page cache, and=20
are not otherwise cached by Squashfs.  This, obviously (?), is because=20
they contain data for only one file, and so at time of access there is =
a=20
readily available address space to push the data into.

Metadata and fragment blocks are different in that when accessed and=20
decompressed (say for an inode or for a particular tail-end block) they=
=20
will contain metadata or tail-ends for other files.  This data could be=
=20
thrown away but due to locality of reference it makes sense to=20
temporarily cache it in-case a near future file access references the=20
data.  But it doesn't make much sense to cache it more than temporarily=
,=20
  much of the data will probably not be reused, and it exists compresse=
d=20
in the buffer cache.

The squashfs cache is therefore designed to cache only the last couple=20
of metadata and fragment blocks.  It is also designed to be simple and=20
extremely fast.  The maximum size of the metadata cache is only 64 KiB.

Simplicity and speed is extremely important.  The=20
squashfs_metadata_read() wrapper around the cache is designed to step=20
through the metadata a structure at a time (20 or so bytes), updating=20
the read position in the metadata each call, with more metadata cache=20
blocks being read and decompressed as necessary.  The common case where=
=20
the metadata is already in the cache (because we're stepping through it=
=20
20 or so bytes at a time), is designed to be extremely fast - a spinloc=
k=20
and array search only.  I recently optimised the cache to use spinlocks=
=20
rather than mutexes and reduced the lock holding time (necessary to mov=
e=20
to spinlocks), and this resulted in a 20%+ speed improvement in reading=
=20
squashfs filesystems.

Given the above using an address space in the page cache will result in=
=20
greater complexity, more memory overhead, and much slower operation.=20
There's a number of reasons for this.

1. The amount and life-span of the data stored in the page cache is=20
outside of Squashfs' control.  As explained above it only makes sense t=
o=20
temporarily cache the last couple of metadata and fragment blocks.=20
Using the page cache (if a 'large' address space is used) for these=20
keeps more of them around for longer than necessary, and will=20
potentially cause more worthy datablocks to be flushed on memory pressu=
re.

2. The address space will be caching uncompressed data, the squashfs=20
references to this data are the compressed locations within the=20
filesystem.  There doesn't exist a one-to-one linear mapping from=20
compressed location to decompressed location in the address space.  Thi=
s=20
means a lookup table still needs to be used to store the mapping from=20
compressed location to decompressed location in the address space.  Now=
=20
this lookup table (however implemented) is itself at least as complex a=
s=20
my current cache implementation.

3. Once the locations of the decompressed pages in the address space=20
have been found, they'll need to be looked up in the page cache, and=20
this has to be done for every 4K page.  With the default fragment size=20
of 128 KiB this means 32 separate lookups.  Somewhat slower than one=20
spinlock and array search per 128 KiB block in the squashfs cache=20
implementation.

Comments, especially those of the form "you've got this completely=20
wrong, and you can use the page cache like this, which will be simpler=20
and faster than your current implementation" welcome :)  I'm not advers=
e=20
  to using the page cache, but I can't see how it will be simpler or=20
faster than the current implementation.

Phillip
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
