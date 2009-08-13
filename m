From: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Subject: Re: [PATCH 4/6] Add support for LZO-compressed kernels for ARM
Date: Thu, 13 Aug 2009 14:25:11 +0200
Message-ID: <20090813122511.GJ4051@pc-ras4041.res.insa>
References: <20090731093107.GA29704@merkur.ravnborg.org> <1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-4-git-send-email-albin.tonnerre@free-electrons.com> <20090806224055.GH31579@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090806224055.GH31579@n2100.arm.linux.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: sam@ravnborg.org, hpa@zytor.com, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, akpm@linux-foundation.org

On Thu, Aug 06, 2009 at 11:40:55PM +0100, Russell King - ARM Linux wrote :
> On Mon, Aug 03, 2009 at 04:58:19PM +0200, Albin Tonnerre wrote:
> > This is the second part of patch. This part includes:
> >  - changes to ach/arch/boot/Makefile to make it easier to add new
> >    compression types
> >  - new piggy.lzo.S necessary for lzo compression
> >  - changes in arch/arm/boot/compressed/misc.c to allow the use of lzo or
> >    gzip, depending on the config
> >  - Kconfig support
> 
> FYI, with these patches applied and selecting GZIP method, I get
> linker errors.  I've been unable to track down what's going on, but
> it appears to be a libgcc issue.
> 
> In spite of the decompressor being built as an EABI object, gcc seems
> to be issuing calls to __umodsi3, which isn't in the EABI libgcc
> (they're called something different - don't ask.)

Looks like this one is on its way to getting solved.

> So I think these patches need further testing and evaluation on ARM
> before they can be merged.  Moreover, I'd like to see some comparisons
> between the _current_ gzip method, the new gzip method and the lzo
> method on ARM.

The figures I posted with my patch were from an ARM (AT91SAM9263) 180MHz CPU.
For the record (average on 25 boots with each compression method):

Uncompressed size: 3.24Mo
gzip  1.61Mo 0.72s
lzo   1.75Mo 0.48s

Some tests with the current gzip code give about 1.64s decompression time.

Regards,
-- 
Albin Tonnerre, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
