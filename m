From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH] MAINTAINERS: Remove Matt Mackall as his identity is
 obsolete
Date: Sun, 24 Oct 2021 02:24:48 -0500
Message-ID: <f7c3aabd-8916-a0d2-7859-7088fab3114e@landley.net>
References: <20210920080635.253826-1-u.kleine-koenig@pengutronix.de>
 <CA+bK7J741D=DgZMNeEC5xg9kDDSaJu19QsRunVvXkBGx1mKGnQ@mail.gmail.com>
 <YW5r61ZQx+E9xfuH@pendragon.ideasonboard.com>
 <57122a67509bebdf0d1b9f5bc15db116e0124e5d.camel@infradead.org>
 <YW6UGP10hfGJ2kYy@pendragon.ideasonboard.com>
 <CAMuHMdVCrC5_AjNDJN+nwrnn=EVTfD-8ddG=FaFBBh_0UY5acQ@mail.gmail.com>
 <7hlf2oejqv.fsf@baylibre.com>
 <BYAPR13MB250310153BF63EF3ED50F294FDBD9@BYAPR13MB2503.namprd13.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x7OYQwoYkeRckzPRsgtpX50uWtmx0YcUa+5Fv90jHdA=;
        b=k9Fenb2jDACs5xaVA0IoNAvx24b9tGvhpn3m6QA6xV5NDC3ucwjqxgTBPc09jH21BZ
         W7GGfi71r1ILeZIF34CdsTx1vW1jGY+X3+DPzSZWMR3+Wiwjx3SfkeNAS0t2aWmKuoqB
         r3HnjE830rKnSuG924s8YYUWGfHRh4U9FwHLfq7zVQEganzbUOc2P7jc2qD8fyU6A5eb
         p0fvc2JClWzASt++PEGz1K3QvWkI3EdSfbrqzISP62VrmEg2wpMNF0iYApz+6w5DoAen
         ZriJ3EZAUlyXkbVj3nskfRWICFRnyThSQoNKZOrBN/hxIGoQ4l9ePu3ME7/gEFnnMEhg
         I7QQ==
In-Reply-To: <BYAPR13MB250310153BF63EF3ED50F294FDBD9@BYAPR13MB2503.namprd13.prod.outlook.com>
Content-Language: en-US
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim.Bird@sony.com, khilman@baylibre.com, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com
Cc: dwmw2@infradead.org, tbird20d@gmail.com, u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org, paul.gortmaker@windriver.com, linux-embedded@vger.kernel.org, herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org, kernel@pengutronix.de, mporter@konsulko.com, tglx@linutronix.de, thomas.petazzoni@bootlin.com

On 10/19/21 5:54 PM, Tim.Bird@sony.com wrote:
> Well... Let me give some history, and then pontificate a little on the entry.
> 
> Originally, this entry was created after Andrew Morton gave a talk at
> an early Embedded Linux Conference, saying that there should be some
> "ombudsman" for embedded issues in the kernel.  This was in 2008.

I've been doing this sort of thing on and off for a while, but I admit to
gradually burning out over the years (sometime between
https://www.spinics.net/lists/linux-embedded/msg00148.html and
https://lkml.org/lkml/2017/9/13/651) as linux-kernel became actively hostile to
hobbyists.

> The linux-embedded mailing list was created about the same time.
> The thinking was that there are issues that transcend any particular
> sub-system, directory, or file, such as boot time or system size or
> real-time. Changes to keep these system-wide metrics in check might
> need the assistance of a respected upstream maintainer, who could
> guide developers working in these areas, or who could help keep
> other kernel maintainers apprised of requirements in these areas
> for embedded products.

Greg KH wouldn't listen to me when I was Documention maintainer. He wouldn't
listen when I was busybox maintainer. Maintainer-without-portfolio ain't gonna
get him to start.

Keep in mind Greg and Kay Sievers were joined at the hip until Linus threw Kay
out of Linux dev and he bogged off to systemd. If you point out things like
"sysfs should to present a stable API to userspace" or "it's a bad idea to
depend on magic packages like udev or systemd as things every Linux system must
not only use verbatim from a single upstream supplier but must replace every
time they upgrade the kernel", Greg is reliably against them.

> I would say that realtime has been shepherded pretty well by Thomas
> Gleixner (and it's almost all upstream!), independent of this entry.
> The other system-wide issues (boot time and system size), people
> have pretty much given up on,

Nah, I've gotten them trimmed/working acceptably well in my systems. I just
don't bother trying to poke linux-kernel about it anymore. Not since the Linux
Foundation chased hobbyists out of Linux to the point where people literally
started asking if hobbysts had ever really existed (circa
https://lwn.net/Articles/563578/).

Peter Anvin is actively hostile to the idea of reducing build-time dependencies
(http://lkml.iu.edu/hypermail/linux/kernel/0802.1/4400.html) to the point that
when my perl removal patches finally got traction in 2013 (after 5 years of
follow-through), he switched one of his perl scripts to use bc instead so things
like Gentoo and Linux From Scratch had to add a new build dependency for him
(neither was installing bc before). This was after I'd convinced Denys to make
ash do 64 bit math on 32 bit hosts so my shell translation ran under bash dash
and ash, and then when that was rejected rewrote it in C, and when Andrew Morton
went around him to take my patches THEN he piped up with a patch to keep the
build complex. Circa 2018 or so when they made kconfig turing complete (so make
oldconfig on a new kernel can "rm -rf ~" if it wants to) they added flex and
bison as dependencies needed to run kconfig, when previously kconfig had
.shipped versions of those files so as NOT to require that.

I just bisected the v5.14 regression where building x86-64 breaks trying to
#include "gelf.h" (from Jim Henson's Dark Crystal package), which I already
personally fought off in 2018 for my own builds:

  https://twitter.com/landley/status/1064994639487426560

And the commit I just bisected it to
(http://lkml.iu.edu/hypermail/linux/kernel/2110.3/00009.html) EXPLICITLY broke
x86-64 (and only x86-64) to have a unique build-time dependency. In a patch that
did NOTHING ELSE. Because why not?

> although there is the occasional
> patch to address a micro-symptom of the problem.  But no one
> is riding herd over the entire kernel to make sure that it doesn't
> get too big, or boot too slow (or use too much power).

Because the lkml clique is circling the wagons tighter and tighter until they
achieve a black hole via proctology? There doesn't seem to be any actual malice,
just a whole lot of territoriality and disdain for outsiders.

It's not a thing that somebody's gonna do for fun, a topic you and I emailed
about earlier this year if I recall.

> This entry, and the linux-embedded mailing list itself, have not
> functioned as originally intended in years, and I doubt anyone
> uses this information. The tools don't use it
> (e.g. get_maintainers.pl is never going to use this entry to
> recommend someone be CC'ed on an "embedded" patch).

Because that perl script matches files and the maintainers entry has no files.
(Not that cc-ing random patches to lists strikes me as particularly useful. It
usually just drives down the signal to noise ratio of the list in my experience.
Patch 22/47 applies to arch/sh and thus the whole series is cc'd there...)

> So, I guess I'd vote to get rid of it as well.
> 
> But, I'm a little sad to see it go... :-(
> I'll probably never see Linux on a cereal box.

Oh there's plenty of people doing good work.

I talk to Jeff Dionne daily, he's working on that sort of thing. I email Elliott
Hughes (basically the android maintainer) multiple times per week. I talk to
Rich Felker by voice every week (we're on the same wednesday call), and email or
irc more often. (I feel guilty about dragging Elliott and Rich into
https://www.mail-archive.com/austin-group-l@opengroup.org/msg08569.html because
I underestimated the amount of bikeshedding on a list that's primarily posts
from the bug tracker and meeting announcements/minutes.)

None of them particularly participate in linux-kernel (despite Rich being
arch/sh maintainer, and yes I poke him about that every wednesday) because that
community comes across to us outsiders as a toxic insular clique that does not
remotely understand any of our needs, and acts threatened if we try to explain
them. Not because we CAN'T, but because it DOESN'T HELP WHEN WE TRY.

I'm the one who's considered weird for still (occasionally) engaging. Mostly as
bug reports like the above, or patches I post so when somebody sues I can go
"here it is in the list archives, not my fault they didn't merge it", or
one-offs I expect to be ignored (ala
http://lkml.iu.edu/hypermail/linux/kernel/2110.1/03713.html) although sometimes
there's a discussion that peters out without resolution instead (ala
http://lkml.iu.edu/hypermail/linux/kernel/2110.1/09327.html).

*shrug* Just stubborn I guess.

>  -- Tim

Rob
