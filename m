From: David Miller <davem@davemloft.net>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
 features not needed on embedded devices
Date: Thu, 31 Jul 2008 03:25:53 -0700 (PDT)
Message-ID: <20080731.032553.67275433.davem@davemloft.net>
References: <1217498355.3454.103.camel@pmac.infradead.org>
	<20080731.030205.153067850.davem@davemloft.net>
	<1217499316.3454.118.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1217499316.3454.118.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: dwmw2@infradead.org
Cc: torvalds@linux-foundation.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 31 Jul 2008 11:15:16 +0100

> While I agree with Andrew's observation, I'd also respectfully submit
> that your argument is more fundamentally bogus than that. TCP and UDP
> are _not_ universally available. They go away if you set CONFIG_INET=n.

Like I said, people can locally patch their systems if they really
want to rip out fundamental things like multicast support.

Some folks might find it instructive to do a google code search
or similar on the multicast socket options this things dikes out
of the tree.

Even simple things like NTP will spew failures with this CONFIG_IGMP
thing turned off.  And that's just the tip of the iceberg.
