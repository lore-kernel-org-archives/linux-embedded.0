From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Thu, 12 Jun 2008 20:50:12 +0200
Message-ID: <20080612185011.GB14337@mx.loc>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org> <20080612160845.GB9327@linux-sh.org> <48514E9A.3080901@billgatliff.com> <20080612163155.GC9327@linux-sh.org> <8bd0f97a0806120938m4ee781e5v7c68f5a777c948a8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=SdwxP8QAIlt5rmx7tVczyZ1vvuomqtuzT+ktlreZtfk=;
        b=E45sKD9izVAsEHkwqZRp9va7vp15QOhpBFzCWRUjUEE6OJ1XwAeyLpuliOTJUZH7FM
         7DynblKavzEi6Qej9y/ERfwOohPI9EW0r4XoE5l2tYgipsKqn0GqtOhsrNv2oa/TxOBF
         7XdjbyHLvUYy+BcdxS2AT6hKm+fUBXaxpoWu4=
Content-Disposition: inline
In-Reply-To: <8bd0f97a0806120938m4ee781e5v7c68f5a777c948a8@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Bill Gatliff <bgat@billgatliff.com>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, Jun 12, 2008 at 12:38:42PM -0400, Mike Frysinger wrote:
>On Thu, Jun 12, 2008 at 12:31 PM, Paul Mundt wrote:
>> On Thu, Jun 12, 2008 at 11:28:10AM -0500, Bill Gatliff wrote:

>>> That's how emdebian is doing a bunch of their stuff, and I have to admit that it
>>> works pretty darned well.  It's also handy for configuration management, since
>>> the cache file itself is plaintext and therefore svn/git/bzr/cvs/...-friendly.
>>
>> Yes, that's the easy case. It's things like perl that are the corner
>> cases, and my objection comes from the fact that people think we ought to
>> not have the kernel depend on perl rather than just fixing the package
>> itself. Autoconf/libtool damage is an entirely different problem :-)
>
>of the core packages, perl and openssl tend to be heavily damaged.
>openssl because it depends on perl instead of a real build system.

It's also a pity that automake doesn't work with microperl. And even for
the most simple .pm you have to do perlward^Wawkward stuff like

ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
        # we need to build a perl for the host just for Errno.pm
        (cd $(MICROPERL_DIR); ./Configure -de; \
         $(MAKE) CC="$(HOSTCC)"; \
         $(SHELL) ext/util/make_ext nonxs Errno MAKE="$(firstword $(MAKE))"; \
        )
endif
        (cd $(MICROPERL_DIR); chmod u+w uconfig.h; . ./uconfig.sh; \
         $(MAKE) -f Makefile.micro regen_uconfig; \
[snip rest of the misery]
