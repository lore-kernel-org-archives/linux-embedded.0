From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Sun, 4 Jan 2009 18:59:56 -0600
Message-ID: <200901041859.57645.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901041303.12687.rob@landley.net> <49611E88.6010204@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <49611E88.6010204@zytor.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Sam Ravnborg <sam@ravnborg.org>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Sunday 04 January 2009 14:39:36 H. Peter Anvin wrote:
> Rob Landley wrote:
> > C) The only calculation which can overflow 64 bits (the ADJ32 one) turns
> > out not to need arbitrary precision math, just 72 bits, and if it ever
> > uses more than 32 then bottom 32 are all zero before the divide so you
> > can do it in three lines.
>
> ... for the current code (32 bits).  When we get an overflow-less 64-bit
> implementation, this code will have to be redone, which is not true for
> a properly done implementation.

One extra mask and add is a strange definition of "redone", but I can add it 
now if you like.  (I'd personally prefer to wait for something to actually 
need it, but...)

> 	-hpa

Rob
