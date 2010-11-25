From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: [PATCH RFC 1/3] Decompressors: Add XZ decompressor module
Date: Thu, 25 Nov 2010 16:34:03 +0200
Message-ID: <201011251634.04065.lasse.collin@tukaani.org>
References: <201011242251.52927.lasse.collin@tukaani.org> <20101124142549.c1b9ad14.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101124142549.c1b9ad14.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alain Knaff <alain@knaff.lu>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, Phillip Lougher <phillip@lougher.demon.co.uk>

On 2010-11-25 Andrew Morton wrote:
> On Wed, 24 Nov 2010 22:51:52 +0200
> Lasse Collin <lasse.collin@tukaani.org> wrote:
> > This patch: Add the main decompression code (xz_dec), testing
> > module (xz_dec_test), wrapper script (xz_wrap.sh) for the xz
> > command line tool, and documentation. The xz_dec module is
> > enough to have a usable XZ decompressor e.g. for Squashfs.
> 
> I'm not seeing any documentation which tells me how to create,
> install and execute xs-compressed kernels. There are new makefile
> targets?

The last paragraph under "XZ related components in the kernel" in 
Documentation/xz.txt mentions xzkern and xzmisc commands available for 
makefiles. They are defined in scripts/Makefile.lib and have some 
comments as documentation there too.

The Kconfig options to enable XZ-compressed kernel are added in the 
second patch. There is already an option to select the kernel 
compression method so I only added XZ to that list. I assume that people 
will find this option just like they have been able to find the other 
compression methods.

> > +#define bcj_x86_test_msbyte(b) ((b) == 0x00 || (b) == 0xFF)
> 
> This should be written in C.  It looks nicer, and so
> bcj_x86_test_msbyte(*p++) won't explode.

Thanks. It's fixed in XZ Embedded git repository now:

    git clone http://git.tukaani.org/xz-embedded.git
    (clone only, no WWW for now)

I will post updated patches when needed.

> > +static noinline_for_stack size_t bcj_x86(
> 
> hm, but it uses little stack space.

I wrote that code 19 months ago and now it looks odd to me too. I 
remember that my idea was to minimize stack usage in this call stack:

    xz_dec_run() -> xz_dec_bcj_run() -> xz_dec_lzma2_run() -> ...

I wanted to prevent the BCJ filters from being inlined into 
xz_dec_bcj_run() because inlining would have increased the maximum 
stack usage by 100-150 bytes.

The BCJ filters are called via bcj_apply() which is called in two places 
from xz_dec_bcj_run(). Since there are two calls to bcj_apply(), GCC 
won't inline it. It will only inline the BCJ filters into bcj_apply() 
and that's OK. So noinline_for_stack does nothing good here. Maybe my 
early version had only one call to bcj_apply() or something like that.

Anyway, I removed noinline_for_stacks. I tested it also when only 
one BCJ filter is enabled and with a few different GCC versions.

> > +static noinline_for_stack size_t bcj_x86(
> > +             struct xz_dec_bcj *s, uint8_t *buf, size_t size)
> 
> The preferred style is
> 
> static noinline_for_stack size_t bcj_x86(struct xz_dec_bcj *s, uint8_t *buf,
>                                         size_t size)
> 
> or
> 
> static noinline_for_stack size_t
> bcj_x86(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
> 
> (lots of dittoes)

Fixed.

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
