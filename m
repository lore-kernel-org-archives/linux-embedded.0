From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Embedded Linux Flag Version
Date: Tue, 9 Nov 2010 09:17:20 -0800
Message-ID: <4CD98220.40806@am.sony.com>
References: <4CD32EA0.4070805@am.sony.com> <AANLkTikusrr073mUz3BQ3wP=y7E8WcDDayVms=PPhH8A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTikusrr073mUz3BQ3wP=y7E8WcDDayVms=PPhH8A@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 11/09/2010 03:19 AM, Mike Frysinger wrote:
> On Thu, Nov 4, 2010 at 18:07, Tim Bird wrote:
>> It was noted at the summit that several CE companies and embedded
>> projects will be using (or are already using) 2.6.35 for upcoming
>> products or releases. This includes Sony, Google, Meego, and Linaro. On
>> behalf of the CE Linux Forum and a number of consumer electronics
>> companies, projects and community developers, we therefore declare
>> 2.6.35 as a flag version of the kernel for embedded use. Several
>> companies will be investing in development, integration and testing of
>> this version. Entities wanting to do business with those companies would
>> therefore be well-advised to make sure their hardware, drivers and
>> enhancements work well with this version of the kernel.
> 
> wouldnt it make more sense to piggy back the extensive work going into
> the "stable" tree ?  many of the points you raise after all are the
> entire founding point of it.  plus, all the main distros form around
> that, are spending time working on that, is marked as supported for 2
> or 3 years, and there is already infrastructure/framework/process in
> place (stable@kernel.org).
> 
> so instead of picking arbitrary versions (like 2.6.35) and needlessly
> replicating the huge work load, simply declare these stable trees as
> the "flag" versions.  that means today it'd be 2.6.32.y.

The fact that this tree is already a year old, and not likely to be
brought forward for at least another 2 years is the reason we didn't
choose it this time.  Most of the high-profile, active embedded projects
are already on 2.6.35.  For companies looking to adopt a new base kernel
in the next 12 months, I don't want to have them start with a year-old
kernel.  We did consider the utility of synchronizing with the enterprise
stable tree, but the timing just didn't work too well this time around.

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Network Entertainment
=============================
