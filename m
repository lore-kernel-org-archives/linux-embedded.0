From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 11:11:39 +0200
Message-ID: <200806131111.39462.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806121925.35883.rob@landley.net> <1213347028.17853.40.camel@tara.firmix.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213347028.17853.40.camel@tara.firmix.at>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

On Friday 13 June 2008 10:50:28 you wrote:
> On Don, 2008-06-12 at 19:25 -0500, Rob Landley wrote:
...
> > in C (anybody remember X11's imake?)  KDE switched to cmake:
>
> That generated "only" a Makefile IIRC.

Yes, cmake doesn't actually build the stuff itself, it generates input files 
for the actual build tool you want to use.
For KDE4 all buildtools supported by cmake are working: the various makes, 
XCode, MSVC projects.

Alex
