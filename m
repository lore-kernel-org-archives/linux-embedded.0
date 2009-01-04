From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 22:57:48 -0600
Message-ID: <200901032257.48854.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901032054.00018.rob@landley.net> <200901040438.14610.markus.heidelberg@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901040438.14610.markus.heidelberg@web.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: markus.heidelberg@web.de
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

On Saturday 03 January 2009 21:38:13 Markus Heidelberg wrote:
> Rob Landley, 04.01.2009:
> Now that you mention this the second time, I have to ask where you have
> this information from. Since I use Gentoo, I was always able to compile
> OpenOffice (version 1, 2 and now 3) myself.

The gentoo panel last OLS.  (Either a BOF or a tutorial, I don't remember 
which.)  It's still _possible_ to build it from source, but they created a 
separate "openoffice-bin" package for the sole purpose of _not_ compiling it 
from source, and it's what they recommend installing.

> At the same time, it was always possible to use prebuilt packages as an
> alternative - the same way as it is possible for a few other packages
> (Firefox, Thunderbird, Seamonkey, maybe more). But AFAIK compiling from
> source is still the preferred method.

Apparently not for Open Office.

First hit googling "gentoo openoffice install":
http://grokdoc.net/index.php/Gentoo-OpenOffice.org

The next two hits are bug tracker entries, and the one after that:
http://www.linuxforums.org/forum/gentoo-linux-help/71086-installing-
openoffice-question.html

Contains this cut and paste from emerge output:

These are the packages that would be merged, in order:

Calculating dependencies
!!! All ebuilds that could satisfy "openoffice" have been masked.
!!! One of the following masked packages is required to complete your request:
- app-office/openoffice-2.0.4_rc1-r1 (masked by: package.mask, package.mask, 
~am d64 keyword)
# 2005/10/24 Simon Stelling <blubb@gentoo.org>
# Don't even try to compile openoffice-2.x, it won't work.

But not to go too far down this rathole, I'm just using openoffice as an 
example here.  If you want to talk about it more, take it off list please.

> Markus

Rob
