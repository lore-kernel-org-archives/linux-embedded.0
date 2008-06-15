From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Sun, 15 Jun 2008 17:39:43 +0200
Message-ID: <c384c5ea0806150839l4b18b988pf69990bc87e52bcf@mail.gmail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>
	 <200806111941.51221.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=XJ9AmW3kAAM13WZX5ebMtKS0poYvX7MP2WGoCQPpRUg=;
        b=Vs7OVCiXM3HbFJj0q7mgBNn7LF0wsgguumjLmqXwgrPNew/ggHC1feuSLG1CdXxc7+
         hHwJLVD0jUUP8kretQC+OPjceBPPU/6G+eAf1lHKXu8m/8+4hbEWEV+i2Dcyrhp5O7qs
         W0i09r3Ng9NG7HfW6QP/pdvrKac3a+55p04wg=
In-Reply-To: <200806111941.51221.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

Hello all,

On Thu, Jun 12, 2008 at 2:41 AM, Rob Landley <rob@landley.net> wrote:
>
> Most packages don't cross compile at all.  Debian has somewhere north of
> 30,000 packages.  Every project that does large scale cross compiling
> (buildroot, gentoo embedded, timesys making fedora cross compile, etc) tends
> to have about 200 packages that cross compile more or less easily, another
> 400 or so that can be made to cross compile with _lot_ of effort and a large
> enough rock, and then the project stalls at about that size.
>

Agreed, OpenEmbedded has a few thousands, but your point is valid.
However, fleeing to target-native compilation is not the way to
improve the situation IMHO.

Moore's law on hardware also goes for the host, I think the progress
is even bigger on big iron.

Also, how much of the 30000 packages are useful for something like
your own firmware Linux?

> Distcc can take advantage of smp, but that won't help the ./configure stage
> and I need to do some work on distcc to teach it to understand more gcc
>
If you want to build 1000+ packages, you don't need to run configure
itself multithreaded. There are enough jobs available to keep 16/32
processors busy (beyond that, you probably end up in
inter-package-dependencies stalling the build). This is just a guess
from what I see during a multi-threaded bake and multi-threaded make
on OpenEmbedded.

> However, having one or more full-time engineers devoted to debugging
> cross-compile issues is quite a high price to pay too.  Moore's law really
> doesn't help that one.
>
How about 30+ volunteers.

> I'm not saying either solution is perfect, I'm just saying the "build under
> emulation" approach is a viable alternative that gets more attractive as time
> passes, both because of ongoing development on emulators and because of
> Moore's law on the hardware.
>
I cannot follow your reasoning - Moore's law will help you more on the
big iron side of things.

That said, I welcome any effort (such as yours) to help improve the
embedded Linux domain, I rather try to fix the cross-compile stuff of
the few thousand packages I am interested in.

Yes it hurts my brain.

Regards,
-- 
Leon
