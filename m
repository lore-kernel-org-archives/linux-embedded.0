From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Sun, 04 Jan 2009 12:39:36 -0800
Message-ID: <49611E88.6010204@zytor.com>
References: <200901020207.30359.rob@landley.net> <200901031932.51873.rob@landley.net> <20090104120735.72840fdb@lxorguk.ukuu.org.uk> <200901041303.12687.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901041303.12687.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Sam Ravnborg <sam@ravnborg.org>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Rob Landley wrote:
> 
> C) The only calculation which can overflow 64 bits (the ADJ32 one) turns out 
> not to need arbitrary precision math, just 72 bits, and if it ever uses more 
> than 32 then bottom 32 are all zero before the divide so you can do it in 
> three lines.
> 

... for the current code (32 bits).  When we get an overflow-less 64-bit
implementation, this code will have to be redone, which is not true for
a properly done implementation.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
