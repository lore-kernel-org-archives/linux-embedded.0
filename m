From: David Vrabel <david.vrabel@csr.com>
Subject: Re: PATCH [1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
 (v2)
Date: Sun, 04 Jan 2009 02:48:21 +0000
Message-ID: <49602375.6020409@csr.com>
References: <200901020207.30359.rob@landley.net> <200901031924.15869.rob@landley.net> <200901031927.07670.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901031927.07670.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

Rob Landley wrote:
> From: Rob Landley <rob@landley.net>
> 
> Replace kernel/timeconst.pl with kernel/timeconst.sh.  The new shell script
> is much simpler, about 1/4 the size, and runs on Red Hat 9 from 2003.
> 
> It requires a shell which can do 64 bit math, such as bash, busybox ash,
> or dash running on a 64 bit host.

I use Ubuntu (hence dash) on 32 bit systems so I think this needs to 
work with dash on 32 bit hosts.

David
