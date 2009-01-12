From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Mon, 12 Jan 2009 06:35:52 +0100
Message-ID: <20090112053552.GA9061@uranus.ravnborg.org>
References: <200901020207.30359.rob@landley.net> <c384c5ea0901031454n451bc899w166bb146c96f6164@mail.gmail.com> <495FEEAF.5020005@zytor.com> <200901032006.47652.rob@landley.net> <20090104030619.GA21466@linux-sh.org> <c384c5ea0901040223l6e53f041s9f7cdea20c9d1d8d@mail.gmail.com> <1231677939.3517.5.camel@gimli.at.home> <31014a580901111928u586e2246uccf370ff941c8a01@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <31014a580901111928u586e2246uccf370ff941c8a01@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mark A. Miller" <mark@mirell.org>
Cc: Bernd Petrovitsch <bernd@firmix.at>, Leon Woestenberg <leon.woestenberg@gmail.com>, Paul Mundt <lethal@linux-sh.org>, Rob Landley <rob@landley.net>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

> There are several other packages which are broken for embedded
> architectures, which I will hopefully attempt to fix by submitting patches
> upstream. But this is why we should be cautious about including new tools
> for compiling the kernel. Sam Ravnborg was correct in that a C program to do
> the work would be the proper way. But by not addressing a currently existing
> problem with an adequate replacement with something that does not exist
> currently, seems faulty.

Why are "make headers_install" such a crucial thing for your
embedded environmnet?

I would assume that if this of such improtance then there is also
someone to step up and contribute a C version of it.

	Sam
