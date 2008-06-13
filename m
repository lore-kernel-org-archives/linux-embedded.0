From: "George G. Davis" <gdavis@mvista.com>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Thu, 12 Jun 2008 22:10:15 -0400
Message-ID: <20080613021015.GF2735@mvista.com>
References: <1522484831@web.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522484831@web.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcus Tangermann <Marcus.Tangermann@web.de>
Cc: linux-embedded@vger.kernel.org

On Thu, Jun 12, 2008 at 09:35:16PM +0200, Marcus Tangermann wrote:
> Hello,
> 
> we currently try to boot a 2.6.21 kernel on a custom IXP422 based board. The boot loader (U-Boot) works fine so far, memory and flash test run successfully, the NPE is also able to ping a host. So we assume the board itself is more or less working at least.
> When we try to boot a 2.6.21 kernel after uncompressing the kernel the boot process dies somehow. We've figured out so far that the kernel dies somewhere between  the gunzip and start_kernel.
> I would be glad for any hint to be able to solve the problem. 

Try enabling DEBUG_LL to see if it's an machine ID error.  If you see:

Error: unrecognized/unsupported processor variant.

or:

Error: unrecognized/unsupported machine ID...

Then you either don't have proper processor support enabled for your target
or your bootloader is passing in the wrong machine number.

If you still don't see anything, try hacking printk.c to call
printascii() (enabled for the DEBUG_LL case) to print directly to the
serial port w/o a driver, etc.,.  You can find more details on these
low-level debugging hacks via a little googling...

HTH!

--
Regards,
George
> 
> Thank you a lot in advance.
> Best regards
> Marcus
> _____________________________________________________________________
> Der WEB.DE SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen!
> http://smartsurfer.web.de/?mc=100071&distributionid=000000000066
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
