From: David Miller <davem@davemloft.net>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
 features not needed on embedded devices
Date: Thu, 31 Jul 2008 02:40:27 -0700 (PDT)
Message-ID: <20080731.024027.162488608.davem@davemloft.net>
References: <20080731092703.661994657@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080731092703.661994657@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: thomas.petazzoni@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2008 11:27:03 +0200

> Changes since previous post:
> 
>  * Add Matt Mackall's Signed-off-by on all patches
>  * Make bonding and bridging select ethtool in the ethtool-related
>    patch.

The ethtool config option needs to be selected by CONFIG_INET as well,
as per the things I described today.  Which erodes it's usefulness
tremendously.

I also am keeping my stance that I have no current intention of
applying these patches.
