From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Sat, 03 Jan 2009 17:35:53 -0800
Message-ID: <49601279.8070603@zytor.com>
References: <200901020207.30359.rob@landley.net> <200901020600.47847.rob@landley.net> <495E6BEE.1000805@zytor.com> <200901031932.51873.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901031932.51873.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Sam Ravnborg <sam@ravnborg.org>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Rob Landley wrote:
> 
> I consider this a step up from code with an implicit dependency on a CPAN 
> library.
> 

There is no CPAN library in use.  Math::BigInt is a standard part of
Perl, and the canned values is there only to support extremely old
versions of Perl, or weird system configurations, as a
belt-and-suspenders measure.

	-hpa
