From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: Embedded Linux Flag Version
Date: Tue, 9 Nov 2010 18:25:01 +0100
Message-ID: <20101109172501.GA18326@opentech.at>
References: <4CD32EA0.4070805@am.sony.com> <AANLkTikusrr073mUz3BQ3wP=y7E8WcDDayVms=PPhH8A@mail.gmail.com> <4CD98220.40806@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CD98220.40806@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Tue, 09 Nov 2010, Tim Bird wrote:

> On 11/09/2010 03:19 AM, Mike Frysinger wrote:
> > On Thu, Nov 4, 2010 at 18:07, Tim Bird wrote:
> >> It was noted at the summit that several CE companies and embedded
> >> projects will be using (or are already using) 2.6.35 for upcoming
> >> products or releases. This includes Sony, Google, Meego, and Linaro. On
> >> behalf of the CE Linux Forum and a number of consumer electronics
> >> companies, projects and community developers, we therefore declare
> >> 2.6.35 as a flag version of the kernel for embedded use. Several
> >> companies will be investing in development, integration and testing of
> >> this version. Entities wanting to do business with those companies would
> >> therefore be well-advised to make sure their hardware, drivers and
> >> enhancements work well with this version of the kernel.
> > 
> > wouldnt it make more sense to piggy back the extensive work going into
> > the "stable" tree ?  many of the points you raise after all are the
> > entire founding point of it.  plus, all the main distros form around
> > that, are spending time working on that, is marked as supported for 2
> > or 3 years, and there is already infrastructure/framework/process in
> > place (stable@kernel.org).
> > 
> > so instead of picking arbitrary versions (like 2.6.35) and needlessly
> > replicating the huge work load, simply declare these stable trees as
> > the "flag" versions.  that means today it'd be 2.6.32.y.
> 
> The fact that this tree is already a year old, and not likely to be
> brought forward for at least another 2 years is the reason we didn't
> choose it this time.  Most of the high-profile, active embedded projects
> are already on 2.6.35.  For companies looking to adopt a new base kernel
> in the next 12 months, I don't want to have them start with a year-old
> kernel.  We did consider the utility of synchronizing with the enterprise
> stable tree, but the timing just didn't work too well this time around.
>
I guess one of the key issues is that it would need to be defined beforehand
what version will be used as the next "flag" version so vendors could make
sure that there drivers are available. Further if such a selection were to
be made then there would need to be consesus on maintaining the respective
version for a sufficiently long time to allow for the next "flag" version
to evolve. Finally for those working on products even if you would now define
the current version as the "flag" version it would not help much as they
would hardly be able to shift to a different kernel short term - so again the
key is defining what version would be atleast planed for the next "flag" 
version - something like now defining it to be 2.6.38 - and then testing 
appropriately in the runup to 2.6.38 to deliver, most notably for the 
embedded architectures.

thx!
hofrat 
