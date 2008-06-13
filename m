From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Cross Compiler and loads of issues
Date: Fri, 13 Jun 2008 15:46:58 +0100
Message-ID: <20080613144658.GA21071@shareable.org>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com> <20080613092449.GO27937@knossos.aleph1.co.uk> <7b740b700806130500u17bf3adel3b2139e50d7b029f@mail.gmail.com> <0af6abe442d0b93a10a96b27153f04e9.squirrel@www.geekisp.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0af6abe442d0b93a10a96b27153f04e9.squirrel@www.geekisp.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Traynor <wmat@naoi.ca>
Cc: Shaz <shazalive@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>

Bill Traynor wrote:
> Maybe I'm being dense, but what's specifically wrong with the current
> toolchain universe?

Back in ye olde days, you could download GCC and Binutils from
gnu.org, configure for whatever is your architecture, and most times
it just worked.

For some reason, that stopped a while ago, and you had to go to
different places to get working basic tools.  And often, the place to
go wasn't clear.  Different people advertised their "ARM toolchain",
"m68k toolchain" etc.  and they were slightly different sets of
patches on top of mainline tools.  Central authorities you might
believe in existed, but they were always a few patches behind what you
actually needed.

When I last needed a toolchain, Google led to confusing results, and I
had to try more than one.  I still use mutiple GCC versions (from
different people) to compile different programs for the same
architecture: each one fails some things in a different way, including
run-time failures in the precompiled toolchains.

Just Google for "uclinux toolchain" and the top hits lead to very old
releases, with bugs that have long been fixed elsewhere.  "uclinux arm
toolchain" is no better.

Perhaps current versions (e.g. from Codesourcery?) are more dependable
for embedded architectures, but I don't have the time to thoroughly
test them, and my last experience warns me to be careful.

It seems people release tools, release patches, publish on an obscure
web page, then forget about the page.  More authoritative-sounding
uclinux web pages tend to be out of date.  Google isn't finding good
current authorities in this area, which suggests the space is rather
fragmented with people pulling in different directions and not working
together enough to create stable, common places for these things.

Contrast with kernel.org: everyone knows where to get a good working
Linux kernel for the mainstream architectures, and the quality work
tends to be quite good at reaching mainline there nowadays.

-- Jamie
