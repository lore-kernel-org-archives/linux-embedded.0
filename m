From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 09:58:48 +0200
Message-ID: <200806160958.48157.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806121925.35883.rob@landley.net> <20080613145119.GF11760@nibiru.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080613145119.GF11760@nibiru.local>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Friday 13 June 2008 16:51:19 Enrico Weigelt wrote:
...
> That's why I prefer an purely descriptive paragidm (= subset of
> delcarative, but practically no logic): a buildfile should only
> describe the package's structure (eg.: "i have some executable foo
> which consists of source [...] and imports libs [...]), so the
> buildtool (and user's config) can cope with it all.

This was also the plan for cmake when it was started. But it turned out that 
this is not enough, and for more complex projects some programming logic is 
required. So cmake turned from quite declarative to quite imperative over 
time.
So while declarative sounds nice, in practice it just isn't powerful enough.

Alex
