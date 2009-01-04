From: Markus Heidelberg <markus.heidelberg@web.de>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sun, 4 Jan 2009 04:38:13 +0100
Message-ID: <200901040438.14610.markus.heidelberg@web.de>
References: <200901020207.30359.rob@landley.net> <c384c5ea0901031637k3b571313m934c8881dce1c81@mail.gmail.com> <200901032054.00018.rob@landley.net>
Reply-To: markus.heidelberg@web.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901032054.00018.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

Rob Landley, 04.01.2009:
> On Saturday 03 January 2009 18:37:12 Leon Woestenberg wrote:
> > My argument on thin dependencies indeed mostly holds for run-time
> > dependencies (to reduce size) but also for build dependency (to reduce
> > complexity)*.
> 
> I usually just point to the gnucash 1.6 release as where this sort of thing 
> leads if you ignore it long enough:
> http://lwn.net/2001/0614/
> 
> These days, a more modern example is the way that after even the gentoo folks 
> gave up on trying to build openoffice (and shipped prebuilt binaries of it in 
> their "build everything from source code" OS), Open Office's own developers 
> described that project "profoundly sick" and "stagnating" ( 
> http://developers.slashdot.org/article.pl?sid=08/12/28/0124230 ).

Now that you mention this the second time, I have to ask where you have
this information from. Since I use Gentoo, I was always able to compile
OpenOffice (version 1, 2 and now 3) myself.

At the same time, it was always possible to use prebuilt packages as an
alternative - the same way as it is possible for a few other packages
(Firefox, Thunderbird, Seamonkey, maybe more). But AFAIK compiling from
source is still the preferred method.

Markus
