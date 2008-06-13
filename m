From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 15:40:15 +0200
Message-ID: <200806131540.15558.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <1213351433.17853.61.camel@tara.firmix.at> <20080613131753.GA19549@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080613131753.GA19549@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

On Friday 13 June 2008 15:17:54 you wrote:
> Bernd Petrovitsch wrote:
> > Actually the size of ints (or any other type) can be easily deduced
> > without running a (for the target) compiled binary:
> > - compile the binary (for the target) with an initialized variable with
> >   that value.
> > - use cross nm (or a similar tool) to read it from there.
>
> Or the method autoconf uses - binary search, using a compile-time
> numeric comparison which resolves to a successful or failed compile.

How does it do that compile-time numeric comparison ?

Alex
