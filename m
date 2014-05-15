From: Manuel Reimer <Manuel.Spam@nurfuerspam.de>
Subject: "make oldconfig" kills config options when cross compiling
Date: Thu, 15 May 2014 17:02:31 +0200
Message-ID: <ll2ku7$uu$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Hello,

I want to build an up-to-date kernel (3.14.4) based on this config:

<https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/linux-olinuxino/config>

To do so, I copied this config file as ".config" into the kernel source 
tree and executed

$ make ARCH=arm CROSS_COMPILE=/path/to/compiler/ oldconfig

My problem is, that this always drops important entries like 
"CONFIG_ARCH_MXS=y".

If I start with "make mxs_defconfig" and run "make oldconfig" on this 
default config, then no entries are killed.

What's wrong with the config, I want to start with?

Thanks in advance.

Greetings,

Manuel Reimer
