From: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Subject: Re: [PATCH 3/6] Add support for LZO-compressed kernels
Date: Wed, 5 Aug 2009 11:19:21 +0200
Message-ID: <20090805091813.GC5854@laptop>
References: <20090731093107.GA29704@merkur.ravnborg.org>
 <1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com>
 <1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com>
 <1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com>
 <20090804160043.82b256d8.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090804160043.82b256d8.akpm@linux-foundation.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: sam@ravnborg.org, hpa@zytor.com, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Tue, Aug 04, 2009 at 04:00:43PM -0700, Andrew Morton wrote :
> On Mon,  3 Aug 2009 16:58:18 +0200
> Albin Tonnerre <albin.tonnerre@free-electrons.com> wrote:

> > This is the first part of the lzo patch
> > The lzo compressor is worse than gzip at compression, but faster at
> > extraction. Here are some figures for an ARM board I'm working on:

> > Uncompressed size: 3.24Mo
> > gzip  1.61Mo 0.72s
> > lzo   1.75Mo 0.48s

> > So for a compression ratio that is still relatively close to gzip, it's
> > much faster to extract, at least in that case.

> Is 3.2Mb a typical kernel size for small systems?  It sounds large.

This one actually embeds an initramfs which accounts for about half of the size.

> > +#ifdef STATIC

> What is this STATIC thing for?

That's what is currently used to test whether you're compiling the pre-boot
environment. eg. include/linux/decompress/mm.h uses this to determine whether it
should provide a malloc() implementation or simply #define malloc(a) kmalloc(a, GFP_KERNEL),
and a lot of similar things

-- 
Albin Tonnerre, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
