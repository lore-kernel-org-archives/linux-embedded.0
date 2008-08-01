From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
 features
Date: Fri, 1 Aug 2008 12:15:15 -0700 (PDT)
Message-ID: <alpine.LFD.1.10.0808011212430.3277@nehalem.linux-foundation.org>
References: <200807311850.m6VIoqCE015883@arbas.nms.ulrich-teichert.org> <1217533588.2328.1.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1217533588.2328.1.camel@localhost.localdomain>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Boyer <jwboyer@gmail.com>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Tim Bird <tim.bird@am.sony.com>, David Miller <davem@davemloft.net>, dwmw2@infradead.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com



On Thu, 31 Jul 2008, Josh Boyer wrote:
> On Thu, 2008-07-31 at 20:50 +0200, Ulrich Teichert wrote:
> > 
> > I do not think of NTP as desktop or server application, but that's
> > probably just me,
> 
> No, it's not just you.  NTP is useful in cases where things do care
> about time but hardware designers were too cheap to put an RTC on the
> board.

In fact, didn't one of the netgear firewall/switch/routers end up being 
famous for overloading some NTP service exactly because all the _millions_ 
of routers ended up using the same (incorrect) NTP host?

So NTP is very definitely an embedded thing too.

			Linus
