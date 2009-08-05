From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/6] include/linux/unaligned/{l,b}e_byteshift.h: Fix
	usage for compressed kernels
Date: Wed, 5 Aug 2009 22:19:29 +0100
Message-ID: <20090805211929.GB9303@n2100.arm.linux.org.uk>
References: <20090731093107.GA29704@merkur.ravnborg.org> <1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com> <20090804155550.3203f5f4.akpm@linux-foundation.org> <20090805092956.GD5854@laptop>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:In-Reply-To:
	Sender; bh=dSmE3tRqNrmm2W9icgQyCo86BBgD87z1JZmD4QpV1X0=; b=PWBvK
	l2WvhXJifvzBBXXeiP2r74NlT/PtaM8fmYGHoW4kpqcXKtLbtPs7qXX+DHI6hlkZ
	3ivVI3FhTaptg0nGOTHJSYuwEDz/2wZ4OAXb76GuGk3ijeziXnxvok15FaKvRE8E
	oOKQgdX57XxRpfyPcGM6cBeKn8URl9fHIauu8Q=
Content-Disposition: inline
In-Reply-To: <20090805092956.GD5854@laptop>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, sam@ravnborg.org, hpa@zytor.com, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Wed, Aug 05, 2009 at 11:29:56AM +0200, Albin Tonnerre wrote:
> linux/kernel.h brings at least:
> extern int console_printk[];
> extern const char hex_asc[];
> which causes errors at link-time as they are not available when
> compiling the pre-boot environement. There are also a few others:

To be clear, for Andrew's benefit, the reason this happens is because
we disable the 'static' when building on ARM - this is because we build
the decompressor with -fPIC, so we can relocate _just_ the data segment
without writing at all to the text segment.

This is so that we can flash the compressed image into read only memory
and have the kernel boot directly from that memory, without having to
have an expensive and unnecessary copy.

Having static data and functions causes complications which make this
impossible to otherwise achieve.  I don't remember the details, I'm not
an expert on the ARM shared library stuff.
