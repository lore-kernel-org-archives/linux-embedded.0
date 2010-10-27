From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: commit 432dc821 breaks machines
Date: Wed, 27 Oct 2010 08:52:29 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1010270842580.7190@axis700.grange>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org
Cc: H Hartley Sweeten <hartleys@visionengravers.com>, linux-embedded <linux-embedded@vger.kernel.org>

Hi

commit 432dc821c90114f9b0e00f6752a700e937516ade
Author: H Hartley Sweeten <hartleys@visionengravers.com>
Date:   Thu Aug 19 18:18:21 2010 -0700

    mtd: cleanup Kconfig dependencies

breaks machines by undefining macros like CONFIG_MTD_MAP_BANK_WIDTH_*. 
Previously the Kconfig entries like

config MTD_MAP_BANK_WIDTH_1
	bool "Support  8-bit buswidth" if MTD_CFI_GEOMETRY
	default y

meant, that if MTD_CFI_GEOMETRY is not selected, this config entry is not 
_displayed_, and default selections are used. Now, with that "if" removed 
and all these Kconfig entries put under a common

if MTD_CFI_GEOMETRY

none of these options get selected by default. Please, revert or otherwise 
fix this part.

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
