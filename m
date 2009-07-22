From: Joe Perches <joe@perches.com>
Subject: Re: [RFC] move __devinit or __init printk constant format strings
 to __devinitconst or __initdata?
Date: Tue, 21 Jul 2009 21:50:02 -0700
Message-ID: <1248238202.31365.576.camel@Joe-Laptop.home>
References: <1248211253.31365.337.camel@Joe-Laptop.home>
	 <1248212925.10466.143.camel@calx>
	 <1248213403.31365.343.camel@Joe-Laptop.home>
	 <1248217044.10466.202.camel@calx>
	 <1248217502.31365.381.camel@Joe-Laptop.home>
	 <4A665442.1010006@caviumnetworks.com>  <1248226085.10466.251.camel@calx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1248226085.10466.251.camel@calx>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>
Cc: David Daney <ddaney@caviumnetworks.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>

On Tue, 2009-07-21 at 20:28 -0500, Matt Mackall wrote:
> On Tue, 2009-07-21 at 16:50 -0700, David Daney wrote:
> > It would be tricky, the string data from the entire compilation unit is 
> > intermingled.  You would have to separate out only those strings 
> > referenced from __init sections into their own section and fix up all 
> > symbols and relocations that were affected.
> Exactly. Annoying but not impossible.

But faster and likely easier to do once in source.

> > Probably easier would be to use the plug-in feature that will be part of 
> > GCC-4.5 (or will that be called GCC-5.0??), and create a special Linux 
> > kernel GCC plug-in that just emits the __init literal strings to the 
> > proper section to begin with.

Which is what the proposed marking would
more or less do today.

> > We don't want the kernel to get left 
> > behind in the GCC plug-in race.

Any guess when gcc 4.5/5.0 might become available?
It's in stage 1 now.  Mid 2010 or so?

4.4.0 was April 21, 2009
4.3.0 was March 5, 2008
4.2.0 was May 13, 2007

Could you please send me what you think is a
reasonable .config for an embedded box.

cheers, Joe
