From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: LZMA inclusion
Date: Mon, 8 Dec 2008 20:23:23 +0200
Message-ID: <200812082023.23450.lasse.collin@tukaani.org>
References: <492BA3FA.9010204@openwrt.org> <20081207160140.GA13387@logfs.org> <493C5D10.1040604@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <493C5D10.1040604@lougher.demon.co.uk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

Phillip Lougher wrote:
> Currently, as mentioned above, Squashfs decompresses into a single
> contiguous output buffer.  But, due to the linux kernel mailing
> list's dislike of vmalloc, this is being changed.  In future Squashfs
> will decompress into a sequence of 4 KiB output buffers (possibly in
> the page cache).

To my understanding, using 4 KiB output buffers can make sense only if 
the dictionary size is significantly smaller than the Squashfs block 
size. This is because an output buffer scattered to 4 KiB pieces means 
that the the dictionary has to be vmalloced as part of the LZMA decoder 
state.

For example, if the dictionary size is equal to the Squashfs block size, 
the same amount of memory that earlier Squashfs versions vmalloced for 
the output buffer is now vmalloced by the uncompression code for the 
dictionary. Plus, memcpy is needed to get the data from the dictionary 
to the 4 KiB output buffers.

LZMA decoder accesses the dictionary contents quite randomly, copying 
1-273 bytes at a time from some unpredictable offset to the end of the 
dictionary. The offsets are relative to the end of the dictionary (i.e. 
the current write position). I suppose the dictionary buffer has to be 
contiguous in the virtual address space. Otherwise the decoder needs to 
emulate it to find the offsets in the dictionary. That would probably 
make things very slow.

Naturally it might be OK to decrease the maximum dictionary size allowed 
in multi-call decoder. I'm not sure if going from 1 MiB to e.g. 128 KiB 
dictionary while keeping the 1 MiB Squashfs block size affects 
compression ratio too much. I guess it means 2-8 % bigger result, but 
someone should test it with real-world file system data. 

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
