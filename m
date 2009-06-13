From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Sun, 14 Jun 2009 00:59:56 +0200
Message-ID: <200906140059.57362.arnd@arndb.de>
References: <4A33A7EC.6070008@gmail.com> <20090613140459.GC30053@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090613140459.GC30053@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Marco <marco.stornelli@gmail.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Saturday 13 June 2009, Sam Ravnborg wrote:
> > +     union {
> > +             struct {
> > +                     /*
> > +                      * ptr to row block of 2D block pointer array,
> > +                      * file block #'s 0 to (blocksize/4)^2 - 1.
> > +                      */
> > +                     off_t row_block;
> 
> It is my understanding that we shall use: __kernel_off_t
> in exported headers.

That is a correct understanding in general, however this case is
different, because it describes an on-disk data structure,
not a kernel to user space interface. Here, __kernel_off_t is just
as wrong as off_t, because it will differ between 32 and 64 bit
architectures, making the fs layout incompatible. I'd suggest
simply defining this as __u64.

Moreover, file system layout should be described in terms of
big-endian or little-endian types (e.g. __be64 or __le64),
together with the right accessor functions.

	Arnd <><
