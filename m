From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Mon, 12 Jan 2009 19:34:43 +0900
Message-ID: <20090112103443.GE28564@linux-sh.org>
References: <495FEEAF.5020005@zytor.com> <200901032006.47652.rob@landley.net> <20090104030619.GA21466@linux-sh.org> <c384c5ea0901040223l6e53f041s9f7cdea20c9d1d8d@mail.gmail.com> <1231677939.3517.5.camel@gimli.at.home> <31014a580901111936q41486efagcb90af2b6880a470@mail.gmail.com> <20090112082058.GB28564@linux-sh.org> <31014a580901120118u55256b51g448f22e9e0ef5d1f@mail.gmail.com> <20090112094121.GD28564@linux-sh.org> <31014a580901120203v593ce9bdn6876263770efbeae@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <31014a580901120203v593ce9bdn6876263770efbeae@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mark A. Miller" <mark@mirell.org>
Cc: Bernd Petrovitsch <bernd@firmix.at>, Leon Woestenberg <leon.woestenberg@gmail.com>, Rob Landley <rob@landley.net>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

On Mon, Jan 12, 2009 at 04:03:32AM -0600, Mark A. Miller wrote:
> On Mon, Jan 12, 2009 at 3:41 AM, Paul Mundt <lethal@linux-sh.org> wrote:
> > I will repeat, there has not been a single coherent argument against what
> > makes perl inherently incapable of being supported.
> 
> You're right, this thread is worthless with that particular mindset,
> Paul. Not, perhaps that the tool in question is brittle, and prone to
> potentially break on more architectures than the current make and C
> code infrastructure, no, your stance is, unless Perl *cannot* run on
> that particular architecture and environment, it has a valid place in
> the kernel because it was chosen by certain developers.
> 
Nonsense. I singled out that point because that was the one you were
replying to in the first place. I itemized the objections in this thread
earlier on and attempted to indicate why they were not applicable in this
context, and asked people to add to it if anything had been overlooked.
If you want to play semantics, do it somewhere else.

If the tool is brittle and constantly breaking, we will see bug reports,
and re-evaluate the support position. This hasn't happened to date in the
context of the kernel build system, so there is no point in even bringing
this up.

Anyways, given that you haven't contributed anything to the kernel and
are therefore perhaps unfamiliar with how things work, I attempted to
show you why the kernel made the decision it did and what it would take
to change that. You have from the beginning only wanted to focus on idle
semantics and refused to re-evaluate your own position on what precisely
it is you find to be problematic in the first place.

So, with that, I am done with this thread, and it seems the key takeaways
from this entire thing has only been a few new lines in my killfile.
It's regrettable you didn't get anything else out of this thread, though
I think both the kernel and embedded linux will survive.
