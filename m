From: David Miller <davem@davemloft.net>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
 features not needed on embedded devices
Date: Thu, 31 Jul 2008 03:02:05 -0700 (PDT)
Message-ID: <20080731.030205.153067850.davem@davemloft.net>
References: <1217497912.3454.95.camel@pmac.infradead.org>
	<20080731.025547.35826309.davem@davemloft.net>
	<1217498355.3454.103.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1217498355.3454.103.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: dwmw2@infradead.org
Cc: torvalds@linux-foundation.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 31 Jul 2008 10:59:15 +0100

> I have drivers which don't even _have_ ethtool support, and they seem to
> work fine. But leaving aside the debate on that point, your statement
> also seemed to be covering the other patches, such as the IGMP one and
> others which haven't been seen (or perhaps even imagined) yet.

I explained why I didn't want to apply the IGMP one too.

Andrew didn't like my objections, but that doesn't mean I
need to defend my position further.

Show me a size reduction patch for networking that actually
makes real sense and I'll apply it.
