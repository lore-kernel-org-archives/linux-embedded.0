From: Jamie Lokier <jamie@shareable.org>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 15:49:20 +0100
Message-ID: <20080613144920.GB21071@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <1213351433.17853.61.camel@tara.firmix.at> <20080613131753.GA19549@shareable.org> <200806131540.15558.neundorf@eit.uni-kl.de> <48527C96.4070404@parrot.com> <20080613144118.GE11760@nibiru.local>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613144118.GE11760@nibiru.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enrico Weigelt <weigelt@metux.de>
Cc: linux-embedded@vger.kernel.org

Enrico Weigelt wrote:
> But: the question is whether you'll need such a test at all
> or if just using sizeof() at the right place won't do the trick ;-P

It's best to do that if you can, and nearly always possible.  There
are a few coding techniques - especially performance sensitive - where
that's not feasible.

-- Jamie
