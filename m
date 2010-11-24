From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RFC 1/3] Decompressors: Add XZ decompressor module
Date: Wed, 24 Nov 2010 14:25:49 -0800
Message-ID: <20101124142549.c1b9ad14.akpm@linux-foundation.org>
References: <201011242251.52927.lasse.collin@tukaani.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <201011242251.52927.lasse.collin@tukaani.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alain Knaff <alain@knaff.lu>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, Phillip Lougher <phillip@lougher.demon.co.uk>

On Wed, 24 Nov 2010 22:51:52 +0200
Lasse Collin <lasse.collin@tukaani.org> wrote:

> From: Lasse Collin <lasse.collin@tukaani.org>
> 
> In userspace, the .lzma format has become mostly a legacy
> file format that got superseded by the .xz format. Similarly,
> LZMA Utils was superseded by XZ Utils.
> 
> These patches add support for XZ decompression into
> the kernel. Most of the code is as is from XZ Embedded
> <http://tukaani.org/xz/embedded.html>. It was written for
> the Linux kernel but is usable in other projects too.
> 
> Advantages of XZ over the current LZMA code in the kernel:
>   - Nice API that can be used by other kernel modules; it's
>     not limited to kernel, initramfs, and initrd decompression.
>   - Integrity check support (CRC32)
>   - BCJ filters improve compression of executable code on
>     certain architectures. These together with LZMA2 can
>     produce a few percent smaller kernel or Squashfs images
>     than plain LZMA without making the decompression slower.
> 
> This patch: Add the main decompression code (xz_dec), testing
> module (xz_dec_test), wrapper script (xz_wrap.sh) for the xz
> command line tool, and documentation. The xz_dec module is
> enough to have a usable XZ decompressor e.g. for Squashfs.

I'm not seeing any documentation which tells me how to create, install
and execute xs-compressed kernels. There are new makefile targets?

>
> ...
>
> +#define bcj_x86_test_msbyte(b) ((b) == 0x00 || (b) == 0xFF)

This should be written in C.  It looks nicer, and so
bcj_x86_test_msbyte(*p++) won't explode.

> +static noinline_for_stack size_t bcj_x86(

hm, but it uses little stack space.

> +static noinline_for_stack size_t bcj_x86(
> +		struct xz_dec_bcj *s, uint8_t *buf, size_t size)

The preferred style is

static noinline_for_stack size_t bcj_x86(struct xz_dec_bcj *s, uint8_t *buf,
					size_t size)

or

static noinline_for_stack size_t
bcj_x86(struct xz_dec_bcj *s, uint8_t *buf, size_t size)

(lots of dittoes)
