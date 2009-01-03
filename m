From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 03 Jan 2009 15:03:11 -0800
Message-ID: <495FEEAF.5020005@zytor.com>
References: <200901020207.30359.rob@landley.net> <c384c5ea0901031454n451bc899w166bb146c96f6164@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <c384c5ea0901031454n451bc899w166bb146c96f6164@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Cc: Rob Landley <rob@landley.net>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

Leon Woestenberg wrote:
> 
> I agree with Rob that the amount of required dependencies should be
> kept to a minimum.
> 
> If we only use 0.5% of a certain language (or: dependent package),
> then rather implement that 0.5% in the existing language.
> 
> Dependencies very quickly become dependency hell. If A requires B,
> then A also inherits all (future) requirements of B, etc. etc.
> 
> In my daily software development work with Linux and GNU software in
> general, 10% of it is spent fighting/removing these extremely "thin"
> or false depencies, so that it is usuable in embedded devices.
> 

First of all, I largely consider this a joke.  All real-life embedded
kernel builds take place on hosted platforms; anything else seems to be
done "just because it can be done", as a kind of show-off art project.
Cute, but hardly worth impeding the rest of the kernel community for.

We're not talking about general platform dependencies here, but build
dependencies for the kernel.  A platform that can build the kernel is
not a small platform.

Second of all, these patches are not fullworthy replacements.  The
original patch using bc had less dependencies, but bc failed on some
platforms, mysteriously.  The new patches have *more* environmental
dependencies than that ever did.

Third, if someone actually cares to do it right, I have a smallish
bignum library at http://git.zytor.com/?p=lib/pbn.git;a=summary that
might be a starting point.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
