From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: LZMA inclusion
Date: Sat, 6 Dec 2008 23:56:50 +0200
Message-ID: <200812062356.50734.lasse.collin@tukaani.org>
References: <492BA3FA.9010204@openwrt.org> <200812032348.36921.lasse.collin@tukaani.org> <Pine.LNX.4.64.0812050914380.8749@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0812050914380.8749@vixen.sonytel.be>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

Geert Uytterhoeven wrote:
> SquashFS does not do one-shot decompression, it calls the
> decompressor multiple times, after reading each block. I guess that
> can be changed, but it will increase memory pressure, as blocks
> cannot be released until the decompression has finished.

I read the code more carefully now. SquashFS does use multi-call 
decoding, but SquashFS-LZMA has been modified to use single-call 
decoding. It copies the input first to a 1 MiB buffer, and then decodes 
it with a single function call. I can understand if this isn't desired.

> Other compressed file systems that use (de)compression through the
> crypto API do use one-shot (de)compression, as the current crypto API
> doesn't support partial (de)compression. That includes Ubifs. Note
> that I'm working on enhancing the crypto API to relax this
> limitation.
>
> So please provide a stateful multi-call implementation ;-)

OK, I can do that once I have a stable release of the xz package out. 
Multi-call decoder will be a little bit bigger than a single-call 
version, but probably it's not too bad in practice.

Keeping the memory usage of the multi-call decoder reasonably low may be 
worth some extra effort. This needs some very basic understanding of 
the algorithms in use. Sorry if the next paragraphs don't contain any 
new information to you; I just thought that it is good to explain it 
just in case.

Both Deflate (zlib) and LZMA are LZ77-based algorithms. The decoder has 
a history buffer (i.e. dictionary), that holds the most recently 
decoded data. With single-call decoding, the output buffer can be used 
as the history buffer. Thus, even if the data was encoded using a big 
dictionary for better compression ratio, it doesn't increase the memory 
requirements of the decoder.

In a multi-call implementation, the history buffer is needed as part of 
the decoder state. The decoder first decodes the data into the history 
buffer, and then uses memcpy to copy the new data to the actual output 
buffer. With Deflate, the history buffer is almost always 32 KiB. Thus, 
the most recently decoded 32 KiB of data is always kept in memory as 
part of the multi-call decoder state.

With LZMA, 8 MiB is a typical size for the dictionary in user space 
applications. With SquashFS, the maximum reasonable dictionary size is 
1 MiB because that's the maximum size of the SquashFS block. (Making 
the dictionary bigger than the data being compressed doesn't improve 
the compression ratio.)

While LZMA compresses better than Deflate even with small dictionaries, 
I suppose that people will want to use big dictionary with LZMA and 
SquashFS. For example, with patches from squashfs-lzma.org, mksquashfs 
by default sets the LZMA dictionary size to the same value as the 
SquashFS block size, because this gives the best compression ratio.

I suppose that it is not nice to need 1 MiB (maximum SquashFS block 
size) of extra memory as part of multi-call decoder state. This can be 
avoided if the code using the multi-call decoder keeps the whole output 
buffer available and doesn't look at its contents until the decoding 
has been successfully finished. This way even the multi-call decoder 
can use the output buffer as a history buffer.

To my understanding, this trick would be OK in SquashFS (with or without 
the patches from squashfs-lzma.org), since SquashFS doesn't touch the 
output buffer until decoding has been finished. So by using multi-call 
decoding, it is possible to avoid needing the whole compressed input in 
memory at once, and by keeping the whole output buffer available until 
the end of the decoding, it is possible to keep the multi-call 
decoder's state more reasonable (below 100 KiB).

Since you are improving the crypto API, maybe it would be a good idea to 
add a flag to tell the decoder that the whole output buffer will be 
kept available to the multi-call decoder. It is important that this 
flag requires that the caller doesn't touch the partial output buffer 
_at all_. This is because if some additional filter is combined with 
LZMA2 in a .xz file, the output buffer won't have any valid data until 
the decoding has been truly finished.

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
