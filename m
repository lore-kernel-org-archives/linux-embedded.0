From: "Mark A. Miller" <mark@mirell.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Mon, 12 Jan 2009 04:03:32 -0600
Message-ID: <31014a580901120203v593ce9bdn6876263770efbeae@mail.gmail.com>
References: <200901020207.30359.rob@landley.net> <495FEEAF.5020005@zytor.com>
	 <200901032006.47652.rob@landley.net>
	 <20090104030619.GA21466@linux-sh.org>
	 <c384c5ea0901040223l6e53f041s9f7cdea20c9d1d8d@mail.gmail.com>
	 <1231677939.3517.5.camel@gimli.at.home>
	 <31014a580901111936q41486efagcb90af2b6880a470@mail.gmail.com>
	 <20090112082058.GB28564@linux-sh.org>
	 <31014a580901120118u55256b51g448f22e9e0ef5d1f@mail.gmail.com>
	 <20090112094121.GD28564@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090112094121.GD28564@linux-sh.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Mundt <lethal@linux-sh.org>, "Mark A. Miller" <mark@mirell.org>, Bernd Petrovitsch <bernd@firmix.at>, Leon Woestenberg <leon.woestenberg@gmail.com>, Rob Landley <rob@lan>

On Mon, Jan 12, 2009 at 3:41 AM, Paul Mundt <lethal@linux-sh.org> wrote:

> I will repeat, there has not been a single coherent argument against what
> makes perl inherently incapable of being supported.

You're right, this thread is worthless with that particular mindset,
Paul. Not, perhaps that the tool in question is brittle, and prone to
potentially break on more architectures than the current make and C
code infrastructure, no, your stance is, unless Perl *cannot* run on
that particular architecture and environment, it has a valid place in
the kernel because it was chosen by certain developers.

And you're right, I did patch around Perl in order to get it to build
under a MIPSEL uclibc environment.

But yes, this particular thread with you *is* worthless, because it's
an argument who's stance is not worth fighting against because of it's
flawed premise.

-- 
Mark A. Miller
mark@mirell.org
