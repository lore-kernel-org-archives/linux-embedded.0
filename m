From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 0/9] Squashfs: Add support for LZMA compressed filesystems
Date: Tue, 08 Dec 2009 17:59:01 +0000
Message-ID: <4B1E93E5.8090104@lougher.demon.co.uk>
References: <E1NHYun-000287-Vq@dylan.lougher.demon.co.uk> <87tyw3p3vu.fsf@macbook.be.48ers.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <87tyw3p3vu.fsf@macbook.be.48ers.dk>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com

Peter Korsgaard wrote:
>>>>>> "root" == root  <root@lougher.demon.co.uk> writes:
> 
>  root> Hi,
>  root> The following patches add LZMA decompression support to Squashfs, using the
>  root> in-kernel LZMA decompression library.
> 
>  root> The patches also add a decompression framework to Squashfs.
>  root> This allows LZMA decompression to be added cleanly, and it allows
>  root> additional decompressors to be easily added in the future.
> 
>  root> To enable the in-kernel LZMA decompression code to be used by Squashfs,
>  root> there are two patches to the lzma code itself: one to make lzma available
>  root> to non-init code, and one to make lzma reentrant.  These are obviously
>  root> not restricted to Squashfs, but are needed by any non-init code that
>  root> may wish to use lzma compression.
> 
> Nice, do you also have an mksquashfs with lzma support?
> 

Yes, in Squashfs CVS (http://sourceforge.net/projects/squashfs/develop).
You'll need to edit the squashfs-tools Makefile to enable LZMA support.
The comments in the Makefile should, hopefully, explain how to
build LZMA support into Mksquashfs/Unsquashfs.

Once built-in, LZMA support can be specified using the -comp lzma option, i.e.

mksquashfs dir dir.img -comp lzma

Unsquashfs doesn't need any extra options, it automatically detects which
compression has been used.

You can tell which compression algorithms Mksquashfs/Unsquashfs support by
just typing the command on its own (i.e. mksquashfs, or unsquashfs).  The
(de-)compressors available are displayed at the end of the output.

Phillip






