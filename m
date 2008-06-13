From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Fri, 13 Jun 2008 10:16:37 +1000
Message-ID: <4851BC65.4030501@snapgear.com>
References: <1522484831@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1522484831@web.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcus Tangermann <Marcus.Tangermann@web.de>
Cc: linux-embedded@vger.kernel.org

Hi Marcus,

Marcus Tangermann wrote:
> we currently try to boot a 2.6.21 kernel on a custom IXP422 based board. The boot loader (U-Boot) works fine so far, memory and flash test run successfully, the NPE is also able to ping a host. So we assume the board itself is more or less working at least.
> When we try to boot a 2.6.21 kernel after uncompressing the kernel the boot process dies somehow. We've figured out so far that the kernel dies somewhere between  the gunzip and start_kernel.
> I would be glad for any hint to be able to solve the problem. 

The most common problem like this I have seen are that the
ARM machine type set by the boot loader does not match those
compiled into the kernel. Also make sure that the RAM
size being passed to the kernel is correct too.

Enable the kernels CONFIG_DEBUG_LL and it may give you some
early debug output (like an id not supported message). That
assumes a serial console...

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
Secure Computing Corporation                PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
