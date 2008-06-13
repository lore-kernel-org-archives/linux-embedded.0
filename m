From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 15:28:44 +0200
Message-ID: <1213363724.17853.63.camel@tara.firmix.at>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806130843.05704.neundorf@eit.uni-kl.de>
	 <1213346316.17853.28.camel@tara.firmix.at>
	 <200806131106.18487.neundorf@eit.uni-kl.de>
	 <1213351433.17853.61.camel@tara.firmix.at>
	 <20080613131753.GA19549@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080613131753.GA19549@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

On Fre, 2008-06-13 at 14:17 +0100, Jamie Lokier wrote:
> Bernd Petrovitsch wrote:
> > Actually the size of ints (or any other type) can be easily deduced
> > without running a (for the target) compiled binary:
> > - compile the binary (for the target) with an initialized variable with
> >   that value.
> > - use cross nm (or a similar tool) to read it from there.
> 
> Or the method autoconf uses - binary search, using a compile-time
> numeric comparison which resolves to a successful or failed compile.

Good, I didn't know that.

> That seems more portable to me.

Yes, just using the compiler is better.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


