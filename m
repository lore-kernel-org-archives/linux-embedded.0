From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: commit 432dc821 breaks machines
Date: Wed, 27 Oct 2010 11:18:50 -0500
Message-ID: <0D753D10438DA54287A00B027084269764819C5D74@AUSP01VMBX24.collaborationhost.net>
References: <Pine.LNX.4.64.1010270842580.7190@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.64.1010270842580.7190@axis700.grange>
Content-Language: en-US
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Tuesday, October 26, 2010 11:52 PM, Guennadi Liakhovetski wrote:
>
> Hi
>
> commit 432dc821c90114f9b0e00f6752a700e937516ade
> Author: H Hartley Sweeten <hartleys@visionengravers.com>
> Date:   Thu Aug 19 18:18:21 2010 -0700
>
>     mtd: cleanup Kconfig dependencies
>
> breaks machines by undefining macros like CONFIG_MTD_MAP_BANK_WIDTH_*. 
> Previously the Kconfig entries like
>
> config MTD_MAP_BANK_WIDTH_1
> 	bool "Support  8-bit buswidth" if MTD_CFI_GEOMETRY
> 	default y
>
> meant, that if MTD_CFI_GEOMETRY is not selected, this config entry is not 
> _displayed_, and default selections are used. Now, with that "if" removed 
> and all these Kconfig entries put under a common

Yah, I overlooked that part.

>
> if MTD_CFI_GEOMETRY
>
> none of these options get selected by default. Please, revert or otherwise 
> fix this part.

I believe David Woodhouse has already reverted the commit.

Sorry for the trouble,
Hartley
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
