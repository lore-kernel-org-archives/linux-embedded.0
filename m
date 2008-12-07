From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: LZMA inclusion
Date: Sun, 07 Dec 2008 23:32:32 +0000
Message-ID: <493C5D10.1040604@lougher.demon.co.uk>
References: <492BA3FA.9010204@openwrt.org> <200812032348.36921.lasse.collin@tukaani.org> <Pine.LNX.4.64.0812050914380.8749@vixen.sonytel.be> <200812062356.50734.lasse.collin@tukaani.org> <20081207160140.GA13387@logfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081207160140.GA13387@logfs.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Cc: Lasse Collin <lasse.collin@tukaani.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

J=C3=B6rn Engel wrote:
> On Sat, 6 December 2008 23:56:50 +0200, Lasse Collin wrote:
>> Since you are improving the crypto API, maybe it would be a good ide=
a to=20
>> add a flag to tell the decoder that the whole output buffer will be=20
>> kept available to the multi-call decoder.
>=20
> I'm not convinced this is the right direction.  One of the constraint=
s
> of kernel programming is that large contiguous are hard to come by.  =
The
> mm subsystem makes no guarantees that you will be able to allocate 1M=
iB
> or contiguous memory.  On a 32bit system with highmem, it may even
> become hard to get 1MiB from vmalloc.

This is an important issue, on the last Squashfs submission attempt, it=
s=20
  use of vmalloc to allocate up to 1MiB contiguous blocks for=20
decompression was brought up.  Any LZMA implementation which requires=20
1MiB vmalloced input and output buffers will probably face similar prob=
lems.

>=20
> So another approach would be to ignore the one-shot debate and
> concentrate on taking a pagevec instead of a buffer (as in a void *
> pointer).  That would certainly be useful for other compressed
> filesystems and without checking the code (I forgot where the squashf=
s
> git tree was) I claim it should be useful for squashfs as well.

Squashfs doesn't use one-shot decoding with zlib for performance and=20
memory issues.  Input data is split across buffer_heads (4 KiB or less=20
per buffer_head), and calling zlib repeatedly for each separate=20
buffer_head eliminates the necessary memcpy into a larger input buffer,=
=20
eliminates the memory overhead for this buffer, and ensures only the=20
first buffer_head needs to be waited on (for arrival off disk) before=20
decompression starts.

Currently, as mentioned above, Squashfs decompresses into a single=20
contiguous output buffer.  But, due to the linux kernel mailing list's=20
dislike of vmalloc, this is being changed.  In future Squashfs will=20
decompress into a sequence of 4 KiB output buffers (possibly in the pag=
e=20
cache).

One-shot LZMA decoding therefore isn't going to work very well with=20
future versions of Squashfs, obviously a solution (as is currently done=
=20
with the Squashfs-LZMA patches) is to use separately allocated=20
contiguous input/output buffers, and memcpy into and out of them, but=20
this isn't particularly ideal.

The discussion about using the output buffer as the temporary workspace=
=20
(as it isn't touched until after decompression is completely finished)=20
will work with the current version of Squashfs, but it isn't going to=20
work with later versions unless the LZMA code can be changed to work=20
with a list of discontiguous output buffers (i.e. a scatter-gather type=
=20
list).

So it looks inevitable that a separately vmalloced workspace buffer wil=
l=20
be required.

Phillip

>=20
> J=C3=B6rn
>=20
