From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable features
 not needed on embedded devices
Date: Thu, 31 Jul 2008 09:42:42 -0700
Message-ID: <4891EB82.9060703@am.sony.com>
References: <20080731092703.661994657@free-electrons.com>	<20080731.024027.162488608.davem@davemloft.net>	<1217497912.3454.95.camel@pmac.infradead.org> <20080731.025547.35826309.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080731.025547.35826309.davem@davemloft.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Miller <davem@davemloft.net>
Cc: dwmw2@infradead.org, torvalds@linux-foundation.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

David Miller wrote:
> From: David Woodhouse <dwmw2@infradead.org>
> Date: Thu, 31 Jul 2008 10:51:52 +0100
> 
>> But there are a lot of people who really don't need these features
>> and really want the option of leaving them out.
> 
> I'll say it one last time.
> 
> If you have ipv4 enabled, you need ETHTOOL.

I've been using and administering Linux for 16 years,
and using it successfully in embedded projects for 10.
Until I stumbled upon this patch in Linux-tiny, I had
never heard of ethtool.  Sony has shipped hundreds
of thousands of products with ETHTOOL turned off.

It sounds like you don't want to talk about it any more,
but could you please give me the 30-second overview
of why ETHTOOL is required for proper ipv4 operation?

If Sony is shipping network-buggy products I certainly
want to know about it.

Sorry if I missed an earlier explanation.

Thanks,
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
