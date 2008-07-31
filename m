From: David Miller <davem@davemloft.net>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
 features not needed on embedded devices
Date: Thu, 31 Jul 2008 02:55:47 -0700 (PDT)
Message-ID: <20080731.025547.35826309.davem@davemloft.net>
References: <20080731092703.661994657@free-electrons.com>
	<20080731.024027.162488608.davem@davemloft.net>
	<1217497912.3454.95.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1217497912.3454.95.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: dwmw2@infradead.org
Cc: torvalds@linux-foundation.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 31 Jul 2008 10:51:52 +0100

> But there are a lot of people who really don't need these features
> and really want the option of leaving them out.

I'll say it one last time.

If you have ipv4 enabled, you need ETHTOOL.
