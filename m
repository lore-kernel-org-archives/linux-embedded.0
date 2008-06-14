From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Sat, 14 Jun 2008 17:17:05 +1000
Message-ID: <48537071.6060902@snapgear.com>
References: <1522484831@web.de> <4851BC65.4030501@snapgear.com> <4852C582.9000508@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4852C582.9000508@web.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcus Tangermann <marcus.tangermann@web.de>
Cc: linux-embedded@vger.kernel.org


Hi Marcus,

Marcus Tangermann wrote:
> first, thanks for the hints.
>>
>> The most common problem like this I have seen are that the
>> ARM machine type set by the boot loader does not match those
>> compiled into the kernel. Also make sure that the RAM
>> size being passed to the kernel is correct too.
>>
> This seems to be set correctly.
> 
>> Enable the kernels CONFIG_DEBUG_LL and it may give you some
>> early debug output (like an id not supported message). That
>> assumes a serial console...
> Will try that,
> Today I downloaded the snapgear distribution and tried whether i can 
> generate a kernel image that works with it...and it boots (2.4 and 2.6)  
> :-) Then I downloaded a fresh 2.6.25 kernel and compiled it with 
> toolchain from the snapgear homepage...and it does not boot. Are there 
> any special patches in the 2.6.19-uc1 from the snapgear distribution
> that might have influence on a IXP422 based board?

I don't recall any specific fixes as such. There is support
for a few extra IXPxxx based boards.

Do a quick diff against a stock 2.6.19. There may be a number of
changes related to non-mmu arm in there, they won't have any impact
on IXP4xx support though.


> Additionally, it seems that we may have a little problem in the 
> bootloader (uboot) when passing kernel parameters (e.g."setenv bootargs 
> console=ttyS0,115200"). Setting such a paramter causes the same problem 
> with a dying kernel. Maybe there is a relation.

Kernel dying, not just no console?
Is your serial console on ttyS0 or ttyS1?

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear -- a Secure Computing Company      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
