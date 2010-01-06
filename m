From: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Subject: Re: [PATCH V2 6/8] lzma: Make lzma available to non
 initramfs/initrd code
Date: Wed, 6 Jan 2010 23:45:10 +0100
Message-ID: <20100106224510.GC24551@pc-ran3241.res.insa>
References: <E1NIuOW-0001ol-RC@dylan.lougher.demon.co.uk>
 <20100106140409.ba0f63d1.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932560Ab0AFWpV@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100106140409.ba0f63d1.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, 06 Jan 2010 14:04 -0800, Andrew Morton wrote :
> On Fri, 11 Dec 2009 01:34:08 +0000
> Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
> 
> > Add a config option DECOMPRESS_LZMA_NEEDED which allows subsystems to
> > specify they need the unlzma code.  Normally decompress_unlzma.c is
> > compiled with __init and unlzma is not exported to modules.
> > 
> > Move INIT definition into separate header files for bzip2/lzma/inflate
> > so it can be defined differently for each decompressor.
> > 
> 
> This patch (which is in linux-next) breaks
> lib-add-support-for-lzo-compressed-kernels.patch, below.  The
> definition of INIT is no longer available in lib/decompress_unlzo.c, and
> 
> lib/decompress_unlzo.c: In function 'unlzo':
> lib/decompress_unlzo.c:106: error: 'error' undeclared (first use in this function)
> lib/decompress_unlzo.c:106: error: (Each undeclared identifier is reported only once
> lib/decompress_unlzo.c:106: error: for each function it appears in.)
> lib/decompress_unlzo.c:111: error: implicit declaration of function 'error'
> 
> 
> I'm planning on merging 
> 
> zlib-optimize-inffast-when-copying-direct-from-output.patch
> lib-add-support-for-lzo-compressed-kernels.patch
> arm-add-support-for-lzo-compressed-kernels.patch
> x86-add-support-for-lzo-compressed-kernels.patch
> add-lzo-compression-support-for-initramfs-and-old-style-initrd.patch
> 
> into 2.6.33.  I don't immediately remember why I decided that - perhaps
> because the patches did arrive in time for .33, but got stalled because
> people were screwing around in other trees.
> 
> So if I go ahead with that merge, linux-next will need fixing.  And I
> didn't get down and work what the appropriate fix is, and I don't want
> to break linux-next in serious ways.
> 
> 
> So what to do?  I guess I could go ahead with the mainline merge, and
> Stephen drops <whatever that tree was> from linux-next until it has
> been fixed up?

I'd go for that one, although I'm obviously biaised. IMHO the linux-next fix
should be easy enough not to postpone the above five patches until 2.6.34.

Regards,
-- 
Albin Tonnerre, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
