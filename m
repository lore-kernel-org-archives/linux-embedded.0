From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with
 kernel/timeconst.sh
Date: Sun, 4 Jan 2009 12:07:35 +0000
Message-ID: <20090104120735.72840fdb@lxorguk.ukuu.org.uk>
References: <200901020207.30359.rob@landley.net>
	<200901020600.47847.rob@landley.net>
	<495E6BEE.1000805@zytor.com>
	<200901031932.51873.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901031932.51873.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

> I note that sed and printf and such are all susv3.  I have an explicit test 
> for 32 bit math in the script that cares, and this worked in Red Hat 9 circa 
> 2003.

If you are trying to do arbitary precision maths using standard posix
tools just use dc. That way the standard is explicit about what you will
get.
