From: Joe Perches <joe@perches.com>
Subject: Re: [RFC] move __devinit or __init printk constant format strings
 to __devinitconst or __initdata?
Date: Tue, 21 Jul 2009 16:05:02 -0700
Message-ID: <1248217502.31365.381.camel@Joe-Laptop.home>
References: <1248211253.31365.337.camel@Joe-Laptop.home>
	 <1248212925.10466.143.camel@calx>
	 <1248213403.31365.343.camel@Joe-Laptop.home>
	 <1248217044.10466.202.camel@calx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1248217044.10466.202.camel@calx>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>

On Tue, 2009-07-21 at 17:57 -0500, Matt Mackall wrote:
> On Tue, 2009-07-21 at 14:56 -0700, Joe Perches wrote:
> > On Tue, 2009-07-21 at 16:48 -0500, Matt Mackall wrote:
> > > On Tue, 2009-07-21 at 14:20 -0700, Joe Perches wrote:
> > > > Is moving constant string formats to __devinitconst or __initdata
> > > > useful for embedded environments?
> > > Interesting notion, but not worth the trouble in my mind. I think it's
> > > more worthwhile to look into automatic such stuff in the build somehow.
> > I think it's not possible today to get gcc to mark
> > the format strings without source modification.
> Yep, that's why I specifically said 'build'. It can probably be done in
> a post-processing step with some ELF wizardry. 

Know any elven wizards?

> > It's pretty easy to script a source conversion.
> 
> And that script has to be run how often?

Once.

>  I don't think people will find
> the churn (and general extra ugliness) acceptable. For a typical
> stripped-down embedded kernel, the amount of gain here will be fairly
> minimal. I'd be surprised if you got as much as 1K out of it.

Got a typical config that uses printks I could try?

