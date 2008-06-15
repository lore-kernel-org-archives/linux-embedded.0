From: Rob Landley <rob@landley.net>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Sun, 15 Jun 2008 16:51:33 -0500
Message-ID: <200806151651.33892.rob@landley.net>
References: <1209577322.25560.402.camel@pmac.infradead.org> <48514E9A.3080901@billgatliff.com> <20080612183421.GD7423@nibiru.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080612183421.GD7423@nibiru.local>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: weigelt@metux.de
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Thursday 12 June 2008 13:34:21 Enrico Weigelt wrote:
> * Bill Gatliff <bgat@billgatliff.com> schrieb:
> > If the build system derives from autoconf, then a hacked-up
> > config.cache (or equivalent command-line args) often solves
> > problems for me.
>
> Only if you're working on *one specific* target for a long time.
> I, for example, have to support lots of different targets, so your
> approach does not work for me. Ah, and it's not *solving* any problem,
> just deferring it to some other day.

It's not deferring it, it's ripping out the failed automation and configuring 
it manually, answering each question by hand.  (That said, it's the approach 
I took to get bash to cross-compile in FWL.  Sometimes it's all you can 
do...)

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
