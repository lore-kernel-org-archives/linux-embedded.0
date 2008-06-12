From: Marcus Tangermann <Marcus.Tangermann@web.de>
Subject: Kernel boot problem on IXP422 Rev. A
Date: Thu, 12 Jun 2008 21:35:16 +0200
Message-ID: <1522484831@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hello,

we currently try to boot a 2.6.21 kernel on a custom IXP422 based board. The boot loader (U-Boot) works fine so far, memory and flash test run successfully, the NPE is also able to ping a host. So we assume the board itself is more or less working at least.
When we try to boot a 2.6.21 kernel after uncompressing the kernel the boot process dies somehow. We've figured out so far that the kernel dies somewhere between  the gunzip and start_kernel.
I would be glad for any hint to be able to solve the problem. 

Thank you a lot in advance.
Best regards
Marcus
_____________________________________________________________________
Der WEB.DE SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen!
http://smartsurfer.web.de/?mc=100071&distributionid=000000000066

