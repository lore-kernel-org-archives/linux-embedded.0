From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 02 Jan 2009 11:27:45 -0800
Message-ID: <495E6AB1.2060707@zytor.com>
References: <200901020207.30359.rob@landley.net> <20090102095023.GA28078@linux-sh.org> <20090102172540.GE8858@knossos.aleph1.co.uk> <20090102180134.GB5818@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090102180134.GB5818@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Sam Ravnborg wrote:
> Hi Wookey.
> 
>> Given the
>> simplicitly of these patches I can't see any reason not to put them
>> in
> 
> Please do NOT do the mistake and think this the same thing.
> 
> Rob's patch simplyfy the timecost stuff - and will be applied on
> this merit alone assuming comments will be addressed.
> 
> But the serie rased anohter topic: shall we ban use of perl
> for generating a kernel.
> And this is what primary is discussed and the outcome of
> that discussion will not prevent patches that stands on their
> own to be applied.
> 

My personal opinion on this is that this is ridiculous.  Given that you
need gcc, binutils, make etc. to build the kernel, and this is more than
inherent, you have to have a pretty bloody strangely constrained system
to disallow Perl, which is as close to a standard Unix utility you can
get without making it into SuS.

The only *real* motivation I have seen for this is a system that as far
I can tell is nothing other than a toy, specifically designed to show
off how little you need to build the kernel.  In other words, it's not a
practical application, it's a show-off art piece.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
