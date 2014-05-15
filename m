From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: "make oldconfig" kills config options when cross compiling
Date: Thu, 15 May 2014 16:26:26 -0700
Message-ID: <53754D22.2060108@infradead.org>
References: <ll2ku7$uu$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <ll2ku7$uu$1@ger.gmane.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Reimer <Manuel.Spam@nurfuerspam.de>, linux-embedded@vger.kernel.org

On 05/15/2014 08:02 AM, Manuel Reimer wrote:
> Hello,
> 
> I want to build an up-to-date kernel (3.14.4) based on this config:
> 
> <https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/linux-olinuxino/config>
> 
> To do so, I copied this config file as ".config" into the kernel source tree and executed
> 
> $ make ARCH=arm CROSS_COMPILE=/path/to/compiler/ oldconfig
> 
> My problem is, that this always drops important entries like "CONFIG_ARCH_MXS=y".

In 3.7 (where that original config file came from), ARCH_MXS did NOT depend on
ARCH_MULTI_V5.  Somewhere between 3.7 and 3.14, someone decided that ARCH_MXS should
depend on ARCH_MULTI_V5.  You can probably enable that kconfig option and then
enable ARCH_MXS.

> If I start with "make mxs_defconfig" and run "make oldconfig" on this default config, then no entries are killed.
> 
> What's wrong with the config, I want to start with?

as explained above.

> Thanks in advance.

Good luck.

-- 
~Randy
