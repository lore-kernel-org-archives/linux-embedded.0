From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/6] Add support for LZO-compressed kernels for ARM
Date: Thu, 6 Aug 2009 23:40:55 +0100
Message-ID: <20090806224055.GH31579@n2100.arm.linux.org.uk>
References: <20090731093107.GA29704@merkur.ravnborg.org> <1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-4-git-send-email-albin.tonnerre@free-electrons.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754798AbZHFWmk@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:In-Reply-To:
	Sender; bh=hTBTULixSXGVdVHOuUnczKWHLotOL+Fz15D4XuEIQSs=; b=oecSl
	QBB63HGVQfu1t//Wf9liAD23vPhLtnT+ORxkeZeR3u7hHQuVt6G4DfhpaI9GSMDx
	YYbsZdj4qrkcA/DWUy1Fycokl96c/InPy+zlJ2vakMQYxC0xodq7NPs/6CbGB3Xj
	k5wZ3aMpxh+vhRu7iduz9m7R6DvlZoXqZjORPQ=
Content-Disposition: inline
In-Reply-To: <1249311501-23102-4-git-send-email-albin.tonnerre@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Cc: sam@ravnborg.org, hpa@zytor.com, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, akpm@linux-foundation.org

On Mon, Aug 03, 2009 at 04:58:19PM +0200, Albin Tonnerre wrote:
> This is the second part of patch. This part includes:
>  - changes to ach/arch/boot/Makefile to make it easier to add new
>    compression types
>  - new piggy.lzo.S necessary for lzo compression
>  - changes in arch/arm/boot/compressed/misc.c to allow the use of lzo or
>    gzip, depending on the config
>  - Kconfig support

FYI, with these patches applied and selecting GZIP method, I get
linker errors.  I've been unable to track down what's going on, but
it appears to be a libgcc issue.

In spite of the decompressor being built as an EABI object, gcc seems
to be issuing calls to __umodsi3, which isn't in the EABI libgcc
(they're called something different - don't ask.)

So I think these patches need further testing and evaluation on ARM
before they can be merged.  Moreover, I'd like to see some comparisons
between the _current_ gzip method, the new gzip method and the lzo
method on ARM.

I was going to get those numbers, but the platform I was going to run
the tests on has died on me today.
