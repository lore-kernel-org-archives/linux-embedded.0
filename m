From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 11:32:55 +0200
Message-ID: <200806131132.55543.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806131106.18487.neundorf@eit.uni-kl.de> <1213348320.26255.231.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213348320.26255.231.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

On Friday 13 June 2008 11:12:00 you wrote:
> On Fri, 2008-06-13 at 11:06 +0200, Alexander Neundorf wrote:
> > > Why on earth does someone need this explicitly during the build?
> > > If you have portable software, all of that should be hidden in the code
> > > and use "sizeof(int)".
> >
> > From the "developer of a buildsystem" POV: there will be users who will
> > need it.
>
> I think that epitomises what's wrong with autoconf. Sometimes, the best

Actually I think autoconf itself is not that bad. What is bad is "autotools", 
i.e. that you get a combination of several tools which have to work together, 
all huge shell scripts, all using different syntax, etc.

> thing to do is tell your users that they _don't_ need whatever it is
> they're asking you for.

We agree that if possible, tests which run something should be avoided. 
But seriously, sometimes this is really very hard.
I don't dare to say impossible, but I'm tempted. 
E.g. in python there are tests which call functions and check their result to 
see if we are currently on a platform where that function is broken (I think 
there was such a test for poll() and some other functions).

Alex
