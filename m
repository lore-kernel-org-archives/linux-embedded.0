From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
	features not needed on embedded devices
Date: Thu, 31 Jul 2008 10:59:15 +0100
Message-ID: <1217498355.3454.103.camel@pmac.infradead.org>
References: <20080731092703.661994657@free-electrons.com>
	 <20080731.024027.162488608.davem@davemloft.net>
	 <1217497912.3454.95.camel@pmac.infradead.org>
	 <20080731.025547.35826309.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080731.025547.35826309.davem@davemloft.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Miller <davem@davemloft.net>
Cc: torvalds@linux-foundation.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

On Thu, 2008-07-31 at 02:55 -0700, David Miller wrote:
> From: David Woodhouse <dwmw2@infradead.org>
> Date: Thu, 31 Jul 2008 10:51:52 +0100
> 
> > But there are a lot of people who really don't need these features
> > and really want the option of leaving them out.
> 
> I'll say it one last time.
> 
> If you have ipv4 enabled, you need ETHTOOL.

I have drivers which don't even _have_ ethtool support, and they seem to
work fine. But leaving aside the debate on that point, your statement
also seemed to be covering the other patches, such as the IGMP one and
others which haven't been seen (or perhaps even imagined) yet.

-- 
dwmw2
