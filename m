From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: LZMA inclusion
Date: Wed, 3 Dec 2008 23:48:36 +0200
Message-ID: <200812032348.36921.lasse.collin@tukaani.org>
References: <492BA3FA.9010204@openwrt.org> <4936DFCD.2010204@am.sony.com> <20081203195852.GB8563@mx.loc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081203195852.GB8563@mx.loc>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

Bernhard Reutner-Fischer wrote:
> On Wed, Dec 03, 2008 at 11:36:45AM -0800, Tim Bird wrote:
> >Gregers Petersen wrote:
> >> There was a small talk a few days ago involving a few of the
> >> OpenWrt developers and David Woodhouse. One of the topics
> >> discussed, was a question about the potential of including LZMA in
> >> the kernel. Such an inclusion would be quite benefitial in terms
> >> of embedded systems, but the major hurdle seems to be the code
> >> quality of LZMA itself. This leads to the question I would like to
> >> raise; are there ongoing plans (or considerations) to rewrite and
> >> merge LZMA, and has anyone started working on it in practical
> >> terms?
> >
> >Did anyone answer this?  CELF is currently considering funding
> >a project to do this (add LZMA support to the kernel), and
> >it would be good to get a feel for the current status...
> > -- Tim
>
> AFAIK xz will be/is incompatible with this older LZMA, perhaps
> larhzu wants to chime in on that.

There's the LZMA algorithm, which is used at least in the .7z and .lzma 
file formats. There are two command line tools called lzma with 
different command line syntax: the one shipped in LZMA SDK (7-zip.org) 
and the gzip-like lzma tool from LZMA Utils (tukaani.org). Both of 
these lzma tools use the same .lzma format, which has only a very 
primitive header prefixed to the actual raw LZMA data (no magic bytes 
and no integrity check like CRC32).

The .lzma format will be deprecated once the new .xz format and related 
tools are available. The .xz format will be supported by 7-Zip and LZMA 
Utils; LZMA Utils will probably be renamed to plain "xz". The xz 
package will include a zlib-like compression library called liblzma, 
and gzip-like command line tool named xz. While .lzma and .xz are 
incompatible file formats, the xz package will also support the 
old .lzma format to ease transition to the .xz format.

The primary compression algorithm of the .xz format is LZMA2. It fixes 
some practical problems of the original LZMA. The .xz format also 
supports filters for executable data (x86, ARM and a few others), which 
combined with LZMA2 usually improve compression ratio 5-10 % over plain 
LZMA or LZMA2. I suppose such filters would be useful in the kernel, 
since the kernel image and iniramfs contain mostly executable code.

Final version of the .xz format specification will be released in this 
month. I try to get the first stable release or at least a good beta 
release of the xz package out in this month too.

Once the stable release of the xz package is out, I could be willing to 
write an easy-to-use .xz decoder that is suitable for inclusion to 
Linux (including proper coding style with comments). I have understood, 
that for kernel and initramfs compression as well as for SquashFS, it 
would be enough to support single-call buffer-to-buffer decoding 
(comparable to uncompress() in zlib). Such code can be significantly 
simpler than stateful multi-call implementation.

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
