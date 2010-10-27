From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: commit 432dc821 breaks machines
Date: Wed, 27 Oct 2010 09:31:15 +0100 (BST)
Message-ID: <alpine.LFD.2.00.1010270930230.23421@dwoodhou-mobl2.ger.corp.intel.com>
References: <Pine.LNX.4.64.1010270842580.7190@axis700.grange>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1010270842580.7190@axis700.grange>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: linux-mtd@lists.infradead.org, H Hartley Sweeten <hartleys@visionengravers.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, 27 Oct 2010, Guennadi Liakhovetski wrote:

> Hi
>
> commit 432dc821c90114f9b0e00f6752a700e937516ade
> Author: H Hartley Sweeten <hartleys@visionengravers.com>
> Date:   Thu Aug 19 18:18:21 2010 -0700
>
>    mtd: cleanup Kconfig dependencies
>
> breaks machines by undefining macros like CONFIG_MTD_MAP_BANK_WIDTH_*.

Thanks. This should be fixed in today's linux-next.

-- 
dwmw2
