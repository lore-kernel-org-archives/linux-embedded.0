From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Fri, 20 Jun 2008 10:08:03 +1000
Message-ID: <485AF4E3.80000@snapgear.com>
References: <1522484831@web.de> <4851BC65.4030501@snapgear.com> <4852C582.9000508@web.de> <48537071.6060902@snapgear.com> <485A9E6F.6070006@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <485A9E6F.6070006@web.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcus Tangermann <marcus.tangermann@web.de>
Cc: linux-embedded@vger.kernel.org

Hi Marcus,

Marcus Tangermann wrote:
>> Kernel dying, not just no console?
> To be honest I don't know ;-) Maybe it's only an issue with the console. 
> It should be ttyS0 as this works with 2.6.19-uc1. The snapgear kernel 
> works when I use the settings for the MonteJade board.
> Today I took a look at the sources of the snapgear kernel where the 
> CONFIG_MARCH_MONTEJADE is used, and there are some modifications within 
> the 8250 serial driver for this board.  I will take a closer look at it 
> tomorrow.

Over the years there have been some changes to the serial
setup on those boards. Some setups leave out the first
serial port definition, and so what is otherwise considered
ttyS1 will be ttyS0. Something to look out for anyway.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
Secure Computing Corporation                PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
