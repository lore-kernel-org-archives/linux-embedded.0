From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: LZMA inclusion
Date: Tue, 16 Dec 2008 10:55:30 +0200
Message-ID: <200812161055.30590.lasse.collin@tukaani.org>
References: <492BA3FA.9010204@openwrt.org> <200812091220.29616.lasse.collin@tukaani.org> <Pine.LNX.4.64.0812091136080.7244@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0812091136080.7244@vixen.sonytel.be>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

Geert Uytterhoeven wrote:
> On Tue, 9 Dec 2008, Lasse Collin wrote:
> > Is it OK that the decoder allocates memory in the middle of
> > decoding, or must all the memory be preallocated when the decoder
> > is initialized? If everything has to be preallocated, then the
> > initialization function needs an argument to specify how big
> > dictionary must be supported. It doesn't make sense to allocate 1
> > MiB just in case if the caller knows that 128 KiB dictionary is the
> > maximum that will ever be needed.
>
> If you want to make it available through the crypto API, you cannot
> allocate memory in the (de)compression routines theirselves, only in
> the initialization function.

OK, thanks.

My work on the upcoming xz package has been progressing quite OK in the 
past two weeks. I suppose that I could start working on the kernel .xz 
decoder at some point in January 2009. I will post to linux-embedded 
once I have some working code to show (hopefully in February).

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
