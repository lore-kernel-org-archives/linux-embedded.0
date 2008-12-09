From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: LZMA inclusion
Date: Tue, 9 Dec 2008 12:20:29 +0200
Message-ID: <200812091220.29616.lasse.collin@tukaani.org>
References: <492BA3FA.9010204@openwrt.org> <200812082023.23450.lasse.collin@tukaani.org> <493D6EB9.4040907@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <493D6EB9.4040907@lougher.demon.co.uk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

Phillip Lougher wrote:
> The issue that moving to 4 KiB output buffers solves is it reduces
> significantly the number of 1 MiB (or 128 KiB for the default block
> size) buffers that need to be vmalloced.  Squashfs caches the last 3
> fragment buffers read, and moving to 4 KiB buffers eliminates these
> vmallocs.
>
> Obviously moving to 4 KiB output buffers will require a 1 MiB
> dictionary workspace to be vmalloced, but this is still much less
> than the 3 buffers that currently need to be vmalloced.

Thanks for explaining.

Is it OK that the decoder allocates memory in the middle of decoding, or 
must all the memory be preallocated when the decoder is initialized? If 
everything has to be preallocated, then the initialization function 
needs an argument to specify how big dictionary must be supported. It 
doesn't make sense to allocate 1 MiB just in case if the caller knows 
that 128 KiB dictionary is the maximum that will ever be needed.

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
