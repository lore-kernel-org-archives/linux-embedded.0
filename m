From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: about size optimizations (Re: Not as much ccache win as I expected)
Date: Sun, 15 Jun 2008 17:56:57 +0100
Message-ID: <8499950a0806150956k7173a3ebp3ab8110117e330c5@mail.gmail.com>
References: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
	 <1213429403.26255.298.camel@pmac.infradead.org>
	 <8499950a0806140256o45d3696o505c02b2f34d90db@mail.gmail.com>
	 <1213437917.26255.335.camel@pmac.infradead.org>
	 <20080615160049.GA2991@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=xi9Ir1RJidraYp05i1SsIeZ/OClWhyjj6p3v0a2M3IE=;
        b=qf1i9oAaOpQTpODaCu7n8j5hClEVQALukj6xqxueSwN4+dHJFdG76qHUxzRbzE5uO1
         2R/u1m4WcNXfGNfne4pk9WXpib25ciJ0OixplvNfWpslGSdPHChlQDJ2VrXX0NLMln04
         jeCmxqZ5tbI/bbslx0F32dCNheTk4fHrWyOSc=
In-Reply-To: <20080615160049.GA2991@shareable.org>
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org, segher@kernel.crashing.org

> You can do this without changin the Makefile, if you provide suitable
> scripts on $PATH for the make.

I want to add here whole issue of kbuild's way of dependency
calculation and rebuild technique.

1) This whole infrastructure is needed only for developers. But
developer while writing/updating  some code must know what is changed
and how it impacts all dependent/relevant code. Thus, one must create
list of all files *before* doing edit/build/run cycles (even with
git/quilt aid). And this list must be fed to build system to make sure
everything needed is rebuilt, and anything else is not (to save time).

This is matter of organizing tools and ways of doing things -- a very
important feature of doing anything effectively.

2) OTOH user needs no such thing at all. New kernel -- new build from
scratch. Distros are same. Also blind belief for correct rebuild using
old object pool is a naive thing.

3) Testers applying and testing patches. OK, now it's a rule to have
diffstat, thus list of changed files. But one can filter out them from
diff/patch with `sed` easily. It can be done even rejecting pure
whitespace/comment changes.

Now you have list of files, feed them to build system, like in (1). No
`make` (recursive or not, or whatever) is needed (use ccache-like
thing in general case to save build time). Its key-thing -- timestamps
-- is a lock for development somehow overcame by `make`-based kbuild
2.6. What an irony.

Problems:

* more flexible source-usage (thus dependency) tracking is needed
(per-variable, per-function, per-file). This must not be a random
comments near #include, it must be natural part of source files
themselves. Filenames are not subject to frequent changes. Big ones
can be split, but main prefix must be the same, thus no need of
changing it in all users. Small "ENOENT || prefix*" heuristics is
quite OK here.

* implemented features and their options must be described and
documented in-place in sources (distributed configuration). Licence
blocks are not needed, one has top file with it or MODULE_LICENSE().
Describe your source in a form, that will be easily parse-able for
creating dependency and configuration items/options.

* once all this in place, creating specific config sets by end users
must not be so painful for both sides as it now is.

#include's && #ifdef's are proven PITA; flexible text processing
(analysis, transformations) with basic tools like `sed` (or `perl`) is
the right way IMHO. On this stage no `gcc -E` for working `cat $all
>linux.c` is needed.

(My another stone to "The art of thinking in `make` and C". Hope, it's
constructive. Again all this i see as handled with very small set of
universal scripts.)
-- 
sed 'sed && sh + olecom = love'  <<  ''
-o--=O`C
 #oo'L O
<___=E M
