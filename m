From: Marcus Tangermann <marcus.tangermann@web.de>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Thu, 19 Jun 2008 19:59:11 +0200
Message-ID: <485A9E6F.6070006@web.de>
References: <1522484831@web.de> <4851BC65.4030501@snapgear.com> <4852C582.9000508@web.de> <48537071.6060902@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48537071.6060902@snapgear.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Hello Greg,

> Kernel dying, not just no console?
To be honest I don't know ;-) Maybe it's only an issue with the console. 
It should be ttyS0 as this works with 2.6.19-uc1. The snapgear kernel 
works when I use the settings for the MonteJade board.
Today I took a look at the sources of the snapgear kernel where the 
CONFIG_MARCH_MONTEJADE is used, and there are some modifications within 
the 8250 serial driver for this board.  I will take a closer look at it 
tomorrow.

Best regards
Marcus
