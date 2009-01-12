From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Mon, 12 Jan 2009 18:41:22 +0900
Message-ID: <20090112094121.GD28564@linux-sh.org>
References: <200901020207.30359.rob@landley.net> <c384c5ea0901031454n451bc899w166bb146c96f6164@mail.gmail.com> <495FEEAF.5020005@zytor.com> <200901032006.47652.rob@landley.net> <20090104030619.GA21466@linux-sh.org> <c384c5ea0901040223l6e53f041s9f7cdea20c9d1d8d@mail.gmail.com> <1231677939.3517.5.camel@gimli.at.home> <31014a580901111936q41486efagcb90af2b6880a470@mail.gmail.com> <20090112082058.GB28564@linux-sh.org> <31014a580901120118u55256b51g448f22e9e0ef5d1f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <31014a580901120118u55256b51g448f22e9e0ef5d1f@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mark A. Miller" <mark@mirell.org>
Cc: Bernd Petrovitsch <bernd@firmix.at>, Leon Woestenberg <leon.woestenberg@gmail.com>, Rob Landley <rob@landley.net>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

On Mon, Jan 12, 2009 at 03:18:53AM -0600, Mark A. Miller wrote:
> On Mon, Jan 12, 2009 at 2:20 AM, Paul Mundt <lethal@linux-sh.org> wrote:
> 
> Paul:
> I initially wrote a rather details response to your e-mail. But
> instead, I shall quote a previous e-mail of yours:
> 
> > I will repeat again that no one has provided a
> > _single_ reason for why they are unable to provide perl within their
> > constrained environment. Until that happens, this entire thread is a
> > joke.
> 
> And I did so. And you have disregarded it. That makes me question the
> logic of your fervent vehemence against such "Perl is perhaps not a
> good idea in the kernel build infrastructure" people like myself.
> 
You have done no such thing. You have provided an example as to why you
personally find perl objectionable, and in your previous mail you even
noted that you have patches for perl to fix the build issues, so there is
no fundamental reason why you are _unable_ to provide perl in your
environment. It all comes down to the fact you don't want to be bothered
to put the effort in to getting perl setup in your environment, which
quite frankly is no one's problem but your own.

Personally I think perl (and python for that matter) is a terrible
language and I wouldn't use it for anything of consequence, but again,
that is my personal opinion and has nothing to do with regards to the
build system and whether it was the better tool for the job as perceived
by the people that elected to implemented infrastructure using it. I
choose not to use it for my own projects, but I have no qualms with those
that do.

The kernel does not need to provide justification for every change that
goes on as long as there is a reasonable attempt not to break things for
other people. The onus is (and always has been) on you to demonstrate why
perl is an unreasonable dependency to push on embedded developers, and
you have failed utterly at demonstrating this in any sort of coherent
fashion.

I will repeat, there has not been a single coherent argument against what
makes perl inherently incapable of being supported. Every single thing
you have presented as a rebuttal has been your personal preference, which
in this case is simply irrelevant.
