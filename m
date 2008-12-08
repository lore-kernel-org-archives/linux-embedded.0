From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: LZMA inclusion
Date: Mon, 08 Dec 2008 19:00:09 +0000
Message-ID: <493D6EB9.4040907@lougher.demon.co.uk>
References: <492BA3FA.9010204@openwrt.org> <20081207160140.GA13387@logfs.org> <493C5D10.1040604@lougher.demon.co.uk> <200812082023.23450.lasse.collin@tukaani.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200812082023.23450.lasse.collin@tukaani.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

Lasse Collin wrote:
> Phillip Lougher wrote:
>> Currently, as mentioned above, Squashfs decompresses into a single
>> contiguous output buffer.  But, due to the linux kernel mailing
>> list's dislike of vmalloc, this is being changed.  In future Squashfs
>> will decompress into a sequence of 4 KiB output buffers (possibly in
>> the page cache).
> 
> To my understanding, using 4 KiB output buffers can make sense only if 
> the dictionary size is significantly smaller than the Squashfs block 
> size. This is because an output buffer scattered to 4 KiB pieces means 
> that the the dictionary has to be vmalloced as part of the LZMA decoder 
> state.
> 
> For example, if the dictionary size is equal to the Squashfs block size, 
> the same amount of memory that earlier Squashfs versions vmalloced for 
> the output buffer is now vmalloced by the uncompression code for the 
> dictionary. Plus, memcpy is needed to get the data from the dictionary 
> to the 4 KiB output buffers.
> 

The issue that moving to 4 KiB output buffers solves is it reduces 
significantly the number of 1 MiB (or 128 KiB for the default block 
size) buffers that need to be vmalloced.  Squashfs caches the last 3 
fragment buffers read, and moving to 4 KiB buffers eliminates these 
vmallocs.

Obviously moving to 4 KiB output buffers will require a 1 MiB dictionary 
workspace to be vmalloced, but this is still much less than the 3 
buffers that currently need to be vmalloced.

Phillip
