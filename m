From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: about size optimizations (Re: Not as much ccache win as I expected)
Date: Sat, 14 Jun 2008 10:56:45 +0100
Message-ID: <8499950a0806140256o45d3696o505c02b2f34d90db@mail.gmail.com>
References: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
	 <1213429403.26255.298.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=OQZdIMl7ksyxhZTQtneLuaSOaAM7hywJ6UfMqgtSrXw=;
        b=UwuAOExpqFlCGrnQ5EQRrEvKRbms072qD+LT/q78PFYOZHIp4dDqTXpBiUsrpqgJGN
         4gr6APGk0QQYHF0munMZHY1mlr/qIfQzbBBYtuoJWpkZhC6ukQKrle6otILZd70AVmCn
         zqcokpVQT8Ru37cw0dc1JNoVpjvmavgl8Rd1E=
In-Reply-To: <1213429403.26255.298.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org, segher@kernel.crashing.org

David Woodhouse:
> On Fri, 2008-06-13 at 22:52 +0100, Oleg Verych wrote:
>> Using same `gcc -E` principle, I once had a dream to create
>> build with something like "whole-kernel-at-time" optimising
>> compiler option:
>
> Doing it for the whole kernel probably doesn't buy you a whole lot more
> than doing it a bit more selectively, which is what I was doing in
> http://lkml.org/lkml/2006/8/24/212

I saw that. My point is pure text processing. But as it seems doing
`make` is a lot more fun than to do `sh` && `sed`. Latter, however, is basic
tool (`make` is system), which requires knowledge, experience and
commitment. Original `compilercache` (from its ideas ccache was
implemented in C) was simple shell script, and it beats `make` very hard in
general case. Even flex-based C semi-parser there is simple task for `sed`.

Understanding of non trivial `sed` scripts is also an issue as well as
maintaining. But if this creating and maintaining of let's say
"source profiles" is off-loaded for users, in the realm kernel developers
call the "wild", then things can be much easier.

If there was more than one kbuild developer or wide and skilled
community, then same ccache scheme with some kconfig fixes in form
of simple shell script could be available for kernel builds, including
external modules. If fact this is how up-to-date kbuild+kconfig can be
used and developed easily by other projects (klibc, busybox, ...).

It's nice to see how big Makefile now is going to be split, however.

> I think Segher has been playing with it a bit recently, and confirms my
> suspicion that combining kernel/ with arch/$ARCH/kernel, and mm/ with
> arch/$ARCH/mm, is also a big win.

The C with dumb #includes and #ifdef's is very-very obsolete technology.
Much more flexibility can be achieved with text processing, if size-
optimizing source annotations/transformation schemes, based on
human-developer knowledge, user's source profiles can be used.

> The GCC problems should mostly be fixed now, I think -- we just need to
> have another go at doing the Kbuild side of it properly.

One don't need to beg GCC developers for every feature, bug fix, that
kernel developers can actually use. Now almost nothing can be done without
compiler support.

One example: returning values && error codes using CPU/GPIO flags, thus
reducing size and CPU load.
-- 
sed 'sed && sh + olecom = love'  <<  ''
-o--=O`C
 #oo'L O
<___=E M
