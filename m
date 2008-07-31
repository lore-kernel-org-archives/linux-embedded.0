From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
	features not needed on embedded devices
Date: Thu, 31 Jul 2008 10:51:52 +0100
Message-ID: <1217497912.3454.95.camel@pmac.infradead.org>
References: <20080731092703.661994657@free-electrons.com>
	 <20080731.024027.162488608.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080731.024027.162488608.davem@davemloft.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Miller <davem@davemloft.net>, torvalds@linux-foundation.org
Cc: thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

On Thu, 2008-07-31 at 02:40 -0700, David Miller wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date: Thu, 31 Jul 2008 11:27:03 +0200
> 
> > Changes since previous post:
> > 
> >  * Add Matt Mackall's Signed-off-by on all patches
> >  * Make bonding and bridging select ethtool in the ethtool-related
> >    patch.
> 
> The ethtool config option needs to be selected by CONFIG_INET as well,
> as per the things I described today.  Which erodes it's usefulness
> tremendously.
> 
> I also am keeping my stance that I have no current intention of
> applying these patches.

I would very much like you to reconsider, Dave.

We can make them default to 'y' and hide them behind CONFIG_EMBEDDED,
and put in a scary help text that tells people _never_ to turn it off --
and hell, you can even make a taint flag for it if you like. But there
are a lot of people who really don't need these features and really want
the option of leaving them out.

Perhaps we should add a warning printk when one of these features is
'required' but absent. That would help to make it clear when someone has
disabled a feature which they shouldn't have disabled.

Refusing to apply the patches just means that either those people will
get them from elsewhere, or that their kernel will be more bloated than
it needs to be.

-- 
dwmw2
