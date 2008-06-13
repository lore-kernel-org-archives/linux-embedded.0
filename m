From: "Bill Traynor" <wmat@naoi.ca>
Subject: Re: Cross Compiler and loads of issues
Date: Fri, 13 Jun 2008 11:28:52 -0400 (EDT)
Message-ID: <c109f779883bf249397752373f3606d9.squirrel@www.geekisp.com>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
    <20080613092449.GO27937@knossos.aleph1.co.uk>
    <7b740b700806130500u17bf3adel3b2139e50d7b029f@mail.gmail.com>
    <0af6abe442d0b93a10a96b27153f04e9.squirrel@www.geekisp.com>
    <20080613144658.GA21071@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080613144658.GA21071@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Bill Traynor <wmat@naoi.ca>, Shaz <shazalive@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>

> Bill Traynor wrote:
>> Maybe I'm being dense, but what's specifically wrong with the current
>> toolchain universe?
>
> Back in ye olde days, you could download GCC and Binutils from
> gnu.org, configure for whatever is your architecture, and most times
> it just worked.

Yes, the difficulty is in the "configure" step.  But the GNU Toolchain is
a complex beast but the benefit is it flexibility and numerous supported
architectures.  Ye olde days perhaps was less complex, but also less
flexible and supporting less archs.

>
> For some reason, that stopped a while ago, and you had to go to
> different places to get working basic tools.  And often, the place to
> go wasn't clear.  Different people advertised their "ARM toolchain",
> "m68k toolchain" etc.  and they were slightly different sets of
> patches on top of mainline tools.  Central authorities you might
> believe in existed, but they were always a few patches behind what you
> actually needed.

I disagree with respect to ARM.  GNU toolchains for ARM have for the last
four or five years been relatively up to date for ARM hardware.  This is a
direct result of ARM paying for this support to be added.

>
> When I last needed a toolchain, Google led to confusing results, and I
> had to try more than one.  I still use mutiple GCC versions (from
> different people) to compile different programs for the same
> architecture: each one fails some things in a different way, including
> run-time failures in the precompiled toolchains.

You didn't have to try more than one, you chose to try more than one.  You
could have just as easily chosen to use only the current mainline GNU
toolchain and worked through your issues with the community, thereby
allowing mainline to benefit from your fixes, and you to benefit by
getting to use the most current toolchain.

>
> Just Google for "uclinux toolchain" and the top hits lead to very old
> releases, with bugs that have long been fixed elsewhere.  "uclinux arm
> toolchain" is no better.

The "fixed elsewhere" is the problem.  If everyone used the most current
release and worked through issues with the community, this problem would
go away.

>
> Perhaps current versions (e.g. from Codesourcery?) are more dependable
> for embedded architectures, but I don't have the time to thoroughly
> test them, and my last experience warns me to be careful.

I know from experience, having worked for CodeSourcery that their
toolchains are exhaustively tested.  And any problems reported to their
public mailing lists are fixed, if legitimate.  These fixes are typically
submitted upstream to the FSF very quickly when the bugs exist in mainline
as well.

>
> It seems people release tools, release patches, publish on an obscure
> web page, then forget about the page.  More authoritative-sounding
> uclinux web pages tend to be out of date.  Google isn't finding good
> current authorities in this area, which suggests the space is rather
> fragmented with people pulling in different directions and not working
> together enough to create stable, common places for these things.

But isn't the FSF repositories for the GNU Tools, and the uClinux projects
repositories the stable, common place for these things?

>
> Contrast with kernel.org: everyone knows where to get a good working
> Linux kernel for the mainstream architectures, and the quality work
> tends to be quite good at reaching mainline there nowadays.

IMHO, the same is true for the GNU toolchain.


>
> -- Jamie
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

