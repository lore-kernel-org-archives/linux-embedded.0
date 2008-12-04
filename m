From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: LZMA inclusion
Date: Thu, 4 Dec 2008 22:46:42 +0100
Message-ID: <20081204214642.GF7336@game.jcrosoft.org>
References: <492BA3FA.9010204@openwrt.org> <4936DFCD.2010204@am.sony.com> <20081203195852.GB8563@mx.loc> <200812032348.36921.lasse.collin@tukaani.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200812032348.36921.lasse.collin@tukaani.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

> The primary compression algorithm of the .xz format is LZMA2. It fixes 
> some practical problems of the original LZMA. The .xz format also 
> supports filters for executable data (x86, ARM and a few others), which 
> combined with LZMA2 usually improve compression ratio 5-10 % over plain 
> LZMA or LZMA2. I suppose such filters would be useful in the kernel, 
> since the kernel image and iniramfs contain mostly executable code.
> 
> Final version of the .xz format specification will be released in this 
> month. I try to get the first stable release or at least a good beta 
> release of the xz package out in this month too.
> 
> Once the stable release of the xz package is out, I could be willing to 
> write an easy-to-use .xz decoder that is suitable for inclusion to 
> Linux (including proper coding style with comments). I have understood, 
> that for kernel and initramfs compression as well as for SquashFS, it 
> would be enough to support single-call buffer-to-buffer decoding 
> (comparable to uncompress() in zlib). Such code can be significantly 
> simpler than stateful multi-call implementation.

This sound very good.
Please note that we also use it in U-Boot so if could help us to have it also
in it. It will be usefull

Best Regards,
J.
