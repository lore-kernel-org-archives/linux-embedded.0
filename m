From: "Mark A. Miller" <mark@mirell.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sun, 11 Jan 2009 21:36:58 -0600
Message-ID: <31014a580901111936q41486efagcb90af2b6880a470@mail.gmail.com>
References: <200901020207.30359.rob@landley.net>
	 <c384c5ea0901031454n451bc899w166bb146c96f6164@mail.gmail.com>
	 <495FEEAF.5020005@zytor.com> <200901032006.47652.rob@landley.net>
	 <20090104030619.GA21466@linux-sh.org>
	 <c384c5ea0901040223l6e53f041s9f7cdea20c9d1d8d@mail.gmail.com>
	 <1231677939.3517.5.camel@gimli.at.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1231677939.3517.5.camel@gimli.at.home>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernd Petrovitsch <bernd@firmix.at>
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>, Paul Mundt <lethal@linux-sh.org>, Rob Landley <rob@landley.net>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

On Sun, Jan 11, 2009 at 6:45 AM, Bernd Petrovitsch <bernd@firmix.at> wrote:
>
> On Son, 2009-01-04 at 11:23 +0100, Leon Woestenberg wrote:
> [...]
> > On Sun, Jan 4, 2009 at 4:06 AM, Paul Mundt <lethal@linux-sh.org> wrote:
> [...]
>
> I'm ignoring the "cross-compile perl" issue - haven't tried it for
> years.
>
> > 5. Tool *version* dependency is hard to get right. When cross-building
> > 30 software packages all requiring native perl, we probably need to
> > build a few versions of perl (native), one for each set of packages.
>
> perl is IMHO special (and quite different to others - including
> especially autotools): perl5 is used widely enough so that "one somewhat
> recent version" should cover all of 30 software packages.
> The hard part are the CPAN modules and their versions which are really a
> PITA.
> As long as you don't use modules from CPAN, "perl5" should be specific
> enough.
>
>        Bernd
> --
> Firmix Software GmbH                   http://www.firmix.at/
> mobil: +43 664 4416156                 fax: +43 1 7890849-55
>          Embedded Linux Development and Services

Actually, something that has amused me during this discussion, is that
right now, the latest stable Perl (5.8.8) does not compile correctly
on a uclibc host, which is typically what you want for embedded
systems, which is why you'd bother to cross compile. (Albeit I was
doing this natively under QEMU with a gcc/uclibc toolchain).

I'll have a patch submitted upstream shortly, but basically the
hints/linux.sh assumes *obviously* you're linking to glibc. I've made
that less libc dependent, looking for either glibc or uclibc.

So without patching Perl, by adding it to the kernel configuration,
it's broken being able to compile the kernel on most embedded
architectures.

And for H. Peter Anvin, before you refer to such uses as compiling the
kernel under a native environment as a "piece of art", please be aware
that the mainstream embedded development environment, buildroot, is
also attempting to utilize QEMU for a "sanity check" on the
environment.

There are several other packages which are broken for embedded
architectures, which I will hopefully attempt to fix by submitting
patches upstream. But this is why we should be cautious about
including new tools for compiling the kernel. Sam Ravnborg was correct
in that a C program to do the work would be the proper way. But by not
addressing a currently existing problem with an adequate replacement
with something that does not exist currently, seems faulty.
--
Mark A. Miller
mark@mirell.org
