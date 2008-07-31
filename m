From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable features
 not needed on embedded devices
Date: Thu, 31 Jul 2008 10:59:49 -0700
Message-ID: <4891FD95.7090700@am.sony.com>
References: <1217498355.3454.103.camel@pmac.infradead.org>	<20080731.030205.153067850.davem@davemloft.net>	<1217499316.3454.118.camel@pmac.infradead.org> <20080731.032553.67275433.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080731.032553.67275433.davem@davemloft.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Miller <davem@davemloft.net>
Cc: dwmw2@infradead.org, torvalds@linux-foundation.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

David Miller wrote:
> Some folks might find it instructive to do a google code search
> or similar on the multicast socket options this things dikes out
> of the tree.
> 
> Even simple things like NTP will spew failures with this CONFIG_IGMP
> thing turned off.  And that's just the tip of the iceberg.

I don't know of any embedded products that ship with NTP turned
on.  It's best to assume, with embedded, that we're not shipping
ANY of the desktop or server applications you are familiar with.
Absent those, does something break in the kernel with multicast
support when IGMP is turned off?
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
