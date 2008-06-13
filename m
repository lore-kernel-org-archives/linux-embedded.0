From: Jamie Lokier <jamie@shareable.org>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 14:17:54 +0100
Message-ID: <20080613131753.GA19549@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806130843.05704.neundorf@eit.uni-kl.de> <1213346316.17853.28.camel@tara.firmix.at> <200806131106.18487.neundorf@eit.uni-kl.de> <1213351433.17853.61.camel@tara.firmix.at>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1213351433.17853.61.camel@tara.firmix.at>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Petrovitsch <bernd@firmix.at>
Cc: Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

Bernd Petrovitsch wrote:
> Actually the size of ints (or any other type) can be easily deduced
> without running a (for the target) compiled binary:
> - compile the binary (for the target) with an initialized variable with
>   that value.
> - use cross nm (or a similar tool) to read it from there.

Or the method autoconf uses - binary search, using a compile-time
numeric comparison which resolves to a successful or failed compile.

That seems more portable to me.

Relying on 'nm 'finding the variable, and not accidentally matching
another variable with the wrong value, does not work for all C
environments.  E.g. some compile to compressed executables; some
produce intermediate objects with incomplete or lazy compiles or
symbolic, to be finished at link stage, and some are even more
abstract.

And it requires the 'nm' tool, which you might not have for
cross-compilation, or might not find the right one.

-- Jamie
