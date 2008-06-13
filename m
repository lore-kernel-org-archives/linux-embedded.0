From: Marcus Tangermann <marcus.tangermann@web.de>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Fri, 13 Jun 2008 21:07:46 +0200
Message-ID: <4852C582.9000508@web.de>
References: <1522484831@web.de> <4851BC65.4030501@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4851BC65.4030501@snapgear.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Hi Greg,

first, thanks for the hints.
>
> The most common problem like this I have seen are that the
> ARM machine type set by the boot loader does not match those
> compiled into the kernel. Also make sure that the RAM
> size being passed to the kernel is correct too.
>
This seems to be set correctly.

> Enable the kernels CONFIG_DEBUG_LL and it may give you some
> early debug output (like an id not supported message). That
> assumes a serial console...
Will try that,
Today I downloaded the snapgear distribution and tried whether i can 
generate a kernel image that works with it...and it boots (2.4 and 2.6)  
:-) Then I downloaded a fresh 2.6.25 kernel and compiled it with 
toolchain from the snapgear homepage...and it does not boot. Are there 
any special patches in the 2.6.19-uc1 from the snapgear distribution 
that might have influence on a IXP422 based board?
Additionally, it seems that we may have a little problem in the 
bootloader (uboot) when passing kernel parameters (e.g."setenv bootargs 
console=ttyS0,115200"). Setting such a paramter causes the same problem 
with a dying kernel. Maybe there is a relation.

Regards
Marcus
