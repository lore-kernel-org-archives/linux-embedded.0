From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Fri, 02 Jan 2009 11:33:02 -0800
Message-ID: <495E6BEE.1000805@zytor.com>
References: <200901020207.30359.rob@landley.net> <200901020213.30658.rob@landley.net> <20090102090439.GA3057@uranus.ravnborg.org> <200901020600.47847.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901020600.47847.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Sam Ravnborg <sam@ravnborg.org>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Rob Landley wrote:
> 
> You mean "The new shell script is much simpler, about 1/4 the size, runs on 
> Red Hat 9 from 2003, and isn't perl?" :)
> 

And introduces unclear environment dependencies depending on how
external utilities are implemented.

The whole point of why that script was written in Perl was to have
access to arbitrary-precision arithmetic -- after it was shown that bc
would simply lock up on some systems.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
