From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 12:38:42 -0400
Message-ID: <8bd0f97a0806120938m4ee781e5v7c68f5a777c948a8@mail.gmail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>
	 <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com>
	 <1213285831.26255.152.camel@pmac.infradead.org>
	 <20080612160845.GB9327@linux-sh.org>
	 <48514E9A.3080901@billgatliff.com>
	 <20080612163155.GC9327@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=fasCecf5BbsOyFE7XF9nKqZSti3lyzSTzSHCMyIxKaI=;
        b=UluxSNC87e0D44DYu1R50BNLmfua41i1Q94pLkcm7NFDFjG1NXhZo/8IEI6H+DMhAw
         JBym43Yt8dAy3aPzhLh+icrdmDysCGFSgdgUNtFSuqAWWjhDKMdLQg0PXCfwMVJm7SDl
         B3S0px1hAYxTz6MAa7f2s9IR6rxJx4UDendZo=
In-Reply-To: <20080612163155.GC9327@linux-sh.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Mundt <lethal@linux-sh.org>
Cc: Bill Gatliff <bgat@billgatliff.com>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, Jun 12, 2008 at 12:31 PM, Paul Mundt wrote:
> On Thu, Jun 12, 2008 at 11:28:10AM -0500, Bill Gatliff wrote:
>> > If you opt to cross-compile, having to deal with those
>> > sorts of things is the price you pay.
>>
>>
>> If the build system derives from autoconf, then a hacked-up config.cache (or
>> equivalent command-line args) often solves problems for me.  Just give the cache
>> the answers that it would otherwise have to get by running code on the target
>> machine.
>>
>> That's how emdebian is doing a bunch of their stuff, and I have to admit that it
>> works pretty darned well.  It's also handy for configuration management, since
>> the cache file itself is plaintext and therefore svn/git/bzr/cvs/...-friendly.
>
> Yes, that's the easy case. It's things like perl that are the corner
> cases, and my objection comes from the fact that people think we ought to
> not have the kernel depend on perl rather than just fixing the package
> itself. Autoconf/libtool damage is an entirely different problem :-)

of the core packages, perl and openssl tend to be heavily damaged.
openssl because it depends on perl instead of a real build system.
-mike
