From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 19:01:34 +0100
Message-ID: <20090102180134.GB5818@uranus.ravnborg.org>
References: <200901020207.30359.rob@landley.net> <20090102095023.GA28078@linux-sh.org> <20090102172540.GE8858@knossos.aleph1.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090102172540.GE8858@knossos.aleph1.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux->

Hi Wookey.

> Given the
> simplicitly of these patches I can't see any reason not to put them
> in

Please do NOT do the mistake and think this the same thing.

Rob's patch simplyfy the timecost stuff - and will be applied on
this merit alone assuming comments will be addressed.

But the serie rased anohter topic: shall we ban use of perl
for generating a kernel.
And this is what primary is discussed and the outcome of
that discussion will not prevent patches that stands on their
own to be applied.

	Sam
