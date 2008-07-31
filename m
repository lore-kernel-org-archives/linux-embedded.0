From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
	features not needed on embedded devices
Date: Thu, 31 Jul 2008 11:15:16 +0100
Message-ID: <1217499316.3454.118.camel@pmac.infradead.org>
References: <1217497912.3454.95.camel@pmac.infradead.org>
	 <20080731.025547.35826309.davem@davemloft.net>
	 <1217498355.3454.103.camel@pmac.infradead.org>
	 <20080731.030205.153067850.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080731.030205.153067850.davem@davemloft.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Miller <davem@davemloft.net>
Cc: torvalds@linux-foundation.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

On Thu, 2008-07-31 at 03:02 -0700, David Miller wrote:
> I explained why I didn't want to apply the IGMP one too.
>
> Andrew didn't like my objections, but that doesn't mean I
> need to defend my position further.

You said that it was part of the core BSD socket API and "Like TCP and
UDP, multicast capabilities are something applications can always depend
upon being available".

Andrew's response was that embedded devices have full control over their
userspace and that they are in a position to _know_ that they never use
multicast, so your argument is bogus. If they _know_ they don't want
multicast, it makes a lot of sense for them to turn it off.

While I agree with Andrew's observation, I'd also respectfully submit
that your argument is more fundamentally bogus than that. TCP and UDP
are _not_ universally available. They go away if you set CONFIG_INET=n.

-- 
dwmw2
