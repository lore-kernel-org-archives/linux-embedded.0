From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Tue, 3 Jun 2008 16:31:08 -0500
Message-ID: <200806031631.09104.rob@landley.net>
References: <48447615.5050806@am.sony.com> <48449FAE.70404@zytor.com> <1212507964.3953.67.camel@calx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1212507964.3953.67.camel@calx>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Tuesday 03 June 2008 10:46:04 Matt Mackall wrote:
> On Mon, 2008-06-02 at 18:34 -0700, H. Peter Anvin wrote:
> > Tim Bird wrote:
> > > With CONSOLE_TRANSLATIONS turned off, this saves about 6K
> > > on my kernel configured for an ARM development board (OMAP
> > > 5912 OSK).  In embedded products I'm familiar with,
> > > console translations are not needed.
> >
> > On most embedded products I'm familiar with, you wouldn't have virtual
> > consoles at all...?
>
> Actually, lots have frame buffers these days.

Cell phones, for instance.

My research is out of date now, but back in 2007 I tried to give a sense of
scale at my cross compiling tutorial at OLS.  A cut and paste from my
(18 month old) notes:

--------------------------------------------------------------------------

According to http://eetimes.eu/showArticle.jhtml?articleID=199702110

  Arm shipped the processors in 250 million "smart phones" in 2006 (83%
  market share in that niche).

According to ARM Inc. quarterly results for Q1 2007:
  http://media.corporate-ir.net/media_files/irol/19/197211/press/Q12007EarningsRelease.pdf

  In the first quarter of 2007, the licensees of ARM Inc. shipped 724 million
  ARM processors.  In one quarter.  (ARM Inc. collected $45 million in license
  fees, which is an average of 6.2 cents/processor.)

In a May 23 2006 presentation to ARM investors, ARM Inc. estimated its 2006
market share at 80-90% of the cell phone market, but only 21% of the larger
market.  (The embedded world is big, folks.)

  Drew highlighted five key growth areas for ARM between now and 2010...

  [The first four are] set-top-box, high-definition television and DVD systems,
  solid-state and hard disk drive storage, automotive electronics and 32-bit
  microcontrollers.  In these areas in 2006, ARM had market shares of 14, 20,
  5 and 13 percent respectively...  They are also market sectors that will
  represent a total available annual market of nearly a billion cores or more
  each in 2010. The biggest annual market opportunities are likely to be
  automotive and 32-bit microcontrollers at 2.0 billion and 1.9 billion cores
  each.

  ARM's fifth key target market is the smart phone, where it is already
  enjoying success. In this area the company shipped 250 million units in 2006
  and has a market share of 83 percent, according to its own estimates.

--------------------------------------------------------------------------

(And that's why Apple did the iPhone.)

Speaking of set-top boxes (another thing with a framebuffer), Netflix is
transitioning its business model to video-on-demand, with a $99 set top box
that runs Linux on Arm:
http://www.linuxdevices.com/news/NS8633598605.html

Here's the CEO of netflix saying the DVD-by-mail business will peak within
the next 5 years:
http://www.reuters.com/article/marketsNews/idINN2843042120080528?rpc=44

And the manufacturer almost immediately went to a 10 day wait on delivery of
new devices:
http://forums.roku.com/viewtopic.php?t=16722

(And that's why Apple did Apple TV.)

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
