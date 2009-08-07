From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/6] Add support for LZO-compressed kernels for ARM
Date: Fri, 7 Aug 2009 10:34:59 +0100
Message-ID: <20090807093459.GB20011@n2100.arm.linux.org.uk>
References: <20090731093107.GA29704@merkur.ravnborg.org> <1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-4-git-send-email-albin.tonnerre@free-electrons.com> <20090806224055.GH31579@n2100.arm.linux.org.uk> <20090807092423.GA4455@laptop>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:In-Reply-To:
	Sender; bh=hkW4hqsAif7EHHlczj0KQmYDWjP4vButX8U9BaOp+9U=; b=eU/zR
	HjemZvRZ66tzVExCd3As86GYdgdVPZr1sxHl4FullGQbHEYqUx0L6FXAlzf/MJi4
	YFHsxFr9o3XuJ0eNLa4H03to4wOH20MN3Sz3ZGIb/5Ga2fF/fnlrKQ975/fLJbly
	ivFWwPYe5GTPVufNibl0U9tIePtgPmqc+Loaz0=
Content-Disposition: inline
In-Reply-To: <20090807092423.GA4455@laptop>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Cc: sam@ravnborg.org, hpa@zytor.com, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, akpm@linux-foundation.org

On Fri, Aug 07, 2009 at 11:24:52AM +0200, Albin Tonnerre wrote:
> I also happen to have issues related to the linker not finding __aeabi_uidivmod,
> but only when compiling with CONFIG_CC_OPTIMIZE_FOR_SIZE. Is it similar for you,
> or does it also fail when compiling with -O2 ?

I tend not to build with -O2 because it seems to tickle compiler bugs
(which is the reverse of -Os on x86.)  I'll give it a go over the
next few days.
