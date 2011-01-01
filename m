From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: Renaming of CONFIG_EMBEDDED to CONFIG_EXPERT
Date: Sat, 1 Jan 2011 17:47:45 -0500
Message-ID: <20110101224745.GE30150@windriver.com>
References: <AANLkTik90vOtkBKDiU5O_gtyWYHd-_VSeYCqRwn2Vcim@mail.gmail.com>
 <20110101080125.GA4040@opentech.at>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110101080125.GA4040@opentech.at>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

[Re: Renaming of CONFIG_EMBEDDED to CONFIG_EXPERT] On 01/01/2011 (Sat 09:01) Nicholas Mc Guire wrote:

> On Sat, 01 Jan 2011, Paul Gortmaker wrote:
> 
> > Given the high traffic on LKML, some folks probably haven't seen this
> > thread, which proposes to rename the CONFIG_EMBEDDED option to
> > CONFIG_EXPERT.
> > 
> > https://patchwork.kernel.org/patch/438671/
> >
> what would be the advantage of such a change ? is there an intent to introduce
> an actual CONFIG_EMBEDDED dedicated to embedded systems ?

I at first had a similar reaction, but the more I thought about it, the
more it seemed to make sense to me.

> 
> The argument in the above patch that it requires experts to modify these 
> settings holds for a lot of items in the kernel config and if that is the
> prime motivatino to flag these then an additional tag "EXPERT" along with
> "NEW" and "EXPERIMENTAL" might make more sense (Aside from the help text
> generally stating the sane-state any way with the common note that if you
> don't knwo what you are doing say N...)

Well, to be honest, the current EMBEDDED option allows you to see
options that you can easily shoot yourself in the foot with.  And if you
are going to put together an embedded device, you largely do need
someone who is more familiar with the options (or at least willing to
research them) then the average desktop user who is contemplating
building a kernel for the 1st time.  The term "expert" may be a bit
overdramatic, but at least it lets you know that you've strayed outside
the safety fence of the default playground.

THe guy who plays around with default /proc/sys/vm values to tune for a
64GB server has to know what he's doing just as another person tuning
the same settings for a 64MB router appliance -- both have to be an
"expert".  So having a Kconfig that exposes the boot up defaults for VM
tuning (I didn't check, possibly a hypothetical example) doesn't make
sense to be hidden under EMBEDDED, but it does make sense to be under
the superset category of EXPERT, I think.

> 
> The main objection I would have is that it will break documentation (out of
> tree docs that is) with little to no utility for the kernel developers.

The utility value is that we don't introduce yet another Kconfig option
that has a grey area of overlap with existing options.

Paul.

> 
> hofrat 
