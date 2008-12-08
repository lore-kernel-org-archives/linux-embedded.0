From: Jamie Lokier <jamie@shareable.org>
Subject: Re: LZMA inclusion
Date: Mon, 8 Dec 2008 13:46:40 +0000
Message-ID: <20081208134640.GC16354@shareable.org>
References: <492BA3FA.9010204@openwrt.org> <200812032348.36921.lasse.collin@tukaani.org> <Pine.LNX.4.64.0812050914380.8749@vixen.sonytel.be> <200812062356.50734.lasse.collin@tukaani.org> <20081207160140.GA13387@logfs.org> <493C5D10.1040604@lougher.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <493C5D10.1040604@lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, Lasse Collin <lasse.collin@tukaani.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

Phillip Lougher wrote:
> One-shot LZMA decoding therefore isn't going to work very well with 
> future versions of Squashfs, obviously a solution (as is currently done 
> with the Squashfs-LZMA patches) is to use separately allocated 
> contiguous input/output buffers, and memcpy into and out of them, but 
> this isn't particularly ideal.
> 
> The discussion about using the output buffer as the temporary workspace 
> (as it isn't touched until after decompression is completely finished) 
> will work with the current version of Squashfs, but it isn't going to 
> work with later versions unless the LZMA code can be changed to work 
> with a list of discontiguous output buffers (i.e. a scatter-gather type 
> list).
> 
> So it looks inevitable that a separately vmalloced workspace buffer will 
> be required.

If the kernel has trouble even vmallocing 1MiB, the LZMA algorithm
will need reworking to explicitly use discontiguous workspace buffers
anyway, regardless of whether the output buffer is used as workspace.

If the kernel can vmalloc 1MiB easily, then in principle it could map
the discontiguous output buffer temporarily into a contiguous region
of vmalloc address space, avoiding the allocation.

Instead of memcpy, you'd have some cache coherency fun on some
architectures.

-- Jamie
