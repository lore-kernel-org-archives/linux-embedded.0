From: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Subject: Re: [PATCH 4/6 v2] Add support for LZO-compressed kernels for ARM
Date: Fri, 4 Sep 2009 17:31:17 +0200
Message-ID: <20090904153117.GG18963@pc-ras4041.res.insa>
References: <20090731093107.GA29704@merkur.ravnborg.org>
 <1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com>
 <1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com>
 <1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com>
 <1249311501-23102-4-git-send-email-albin.tonnerre@free-electrons.com>
 <20090806224055.GH31579@n2100.arm.linux.org.uk>
 <20090814100828.GD5985@pc-ras4041.res.insa>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090814100828.GD5985@pc-ras4041.res.insa>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: sam@ravnborg.org, hpa@zytor.com, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, akpm@linux-foundation.org

On Fri, Aug 14, 2009 at 12:08:28PM +0200, Albin Tonnerre wrote :
> This is the second part of patch. This part includes:
>  - changes to ach/arch/boot/Makefile to make it easier to add new
>    compression types
>  - new piggy.lzo.S necessary for lzo compression
>  - changes in arch/arm/boot/compressed/misc.c to allow the use of lzo or
>    gzip, depending on the config
>  - Kconfig support
> 
> Signed-off-by: Albin Tonnerre <albin.tonnerre@free-electrons.com>
> ---
> Changes:
>  Compiling with -Os failed due to missing __aeabi_uidivmod.
>  Link using arch/arm/lib/lib1funcs.o which provides this symbol, and
>  define a dummy __div0 function in arch/arm/boot/compressed/misc.c, as
>  this symbol is required by lib1funcs.

Hi Russell,
Does that solve the concerns/issues you had with this patch?
If so, it might be worth getting the updaed version in Andrew's branch.

Regards,
-- 
Albin Tonnerre, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
