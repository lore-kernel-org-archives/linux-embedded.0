From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
	features
Date: Thu, 31 Jul 2008 20:55:34 +0100
Message-ID: <1217534134.3454.300.camel@pmac.infradead.org>
References: <200807311850.m6VIoqCE015883@arbas.nms.ulrich-teichert.org>
	 <1217533588.2328.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1217533588.2328.1.camel@localhost.localdomain>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Josh Boyer <jwboyer@gmail.com>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Tim Bird <tim.bird@am.sony.com>, David Miller <davem@davemloft.net>, torvalds@linux-foundation.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

On Thu, 2008-07-31 at 15:46 -0400, Josh Boyer wrote:
> On Thu, 2008-07-31 at 20:50 +0200, Ulrich Teichert wrote:
> > Hi,
> > 
> > >I don't know of any embedded products that ship with NTP turned
> > >on.
> > 
> > Well, I do. To be exact, I've developed parts of it. But it's numbers
> > are only into the thousands, so that makes it insignificant ;-)
> > 
> > >It's best to assume, with embedded, that we're not shipping
> > >ANY of the desktop or server applications you are familiar with.
> > >Absent those, does something break in the kernel with multicast
> > >support when IGMP is turned off?
> > 
> > I do not think of NTP as desktop or server application, but that's
> > probably just me,
> 
> No, it's not just you.  NTP is useful in cases where things do care
> about time but hardware designers were too cheap to put an RTC on the
> board.
> 
> I will admit that it's use in embedded products is probably very limited
> though.

NTP is a red herring. It has a check for multicast support in its
configure script and wraps it all in #ifdef MCAST anyway.

So even if it _does_ crap out when I build my standard distro kernel
with !CONFIG_IGMP and use the standard distro build of ntpd, that still
isn't particularly relevant to the kind of application where someone
would built a kernel without IGMP support and build their own ntpd to
match.

-- 
dwmw2
