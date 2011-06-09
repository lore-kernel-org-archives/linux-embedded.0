From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] Revised patch
Date: Thu, 09 Jun 2011 10:40:02 -0700
Message-ID: <1307641202.13329.22.camel@Joe-Laptop>
References: <AANLkTikbPwMS0VGsMH64CGhDUEmvOwUzYnXSV0q3eW9_@mail.gmail.com>
	 <1307640826-22618-1-git-send-email-amurray@mpcdata.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1307640826-22618-1-git-send-email-amurray@mpcdata.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Murray <amurray@mpcdata.com>
Cc: w.sang@pengutronix.de, geert@linux-m68k.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, rdunlap@xenotime.net, udknight@gmail.com, namhyung@gmail.com, Andrew Murray <amurray@mpc-data.co.uk>

On Thu, 2011-06-09 at 18:33 +0100, Andrew Murray wrote:
> Hi,
> I've updated this patch based on your feedback. This covers all the recent feedback.

Hey Andrew.

You're missing the "%pB" backtrace extension.

It's be better if the "Hi, I've updated" comment stuff
came after the --- content separator in the patch so that
the commit log is a bit neater.

Otherwise, looks great, thanks.

cheers, Joe
