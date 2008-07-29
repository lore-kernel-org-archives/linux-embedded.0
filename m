From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: prevalence of C++ in embedded linux?
Date: Tue, 29 Jul 2008 10:58:06 +0200
Message-ID: <200807291058.06240.neundorf@eit.uni-kl.de>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain> <200807290951.34563.neundorf@eit.uni-kl.de> <1217319612.24988.15.camel@spike.firmix.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1217319612.24988.15.camel@spike.firmix.at>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

On Tuesday 29 July 2008 10:20:12 you wrote:
> On Tue, 2008-07-29 at 09:51 +0200, Alexander Neundorf wrote:
...
> Yes, one *can* use the above features and get small features. But most
> people simply can't - if only that they use some tool/lib written in C++
> (and coming from the "normal" world) which simply uses them without
> thinking about space and wonder why the device won't run with "only"
> 128MB flash and run in 16MB RAM.

Well, if somebody carelessly uses general purpose apps/libs in a tiny embedded 
project he will have problems, no matter if it's C or C++.

> BTW why should I use C++ if I don't use any "fancy features"?

If you just skip RTTI and exceptions you have enough fancy features left :-)

Just know what you're doing if you're using templates and multiple 
inheritance, there is no problem with them. Templates are so much better than 
macros, and if used carefully they don't bloat the code size.

Alex
