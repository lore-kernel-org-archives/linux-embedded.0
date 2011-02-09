From: Frank Rowand <frank.rowand@gmail.com>
Subject: Re: [PATCH] Remove CONFIG_PM altogether, enable power management
 all the time
Date: Wed, 09 Feb 2011 11:00:17 -0800
Message-ID: <4D52E441.2000805@am.sony.com>
References: <4D51D341.3040209@am.sony.com> <20110209114137.GA10163@opensource.wolfsonmicro.com> <201102091807.03094.rjw@sisk.pl> <4D52DD81.7050401@am.sony.com> <20110209184010.GB23747@opensource.wolfsonmicro.com>
Reply-To: frank.rowand@am.sony.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:reply-to:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=dj/woO4IQzPvnOKp+6IzXp/PcLMdrq7IaD9vJzXZbJw=;
        b=gM5rdHYBZCDs/GWzcJefQyETwpMzdrUYBPEldF0pHiXielQkO4s88zzbhVmsEOSJun
         rQJas02J6qS+JWe9i0vJdo6ykpkmT59PFPXUVI+5pjii+Al+Z2wdwTtF5PCgS9UHAfQX
         FbgULUNsrU4H7Rwsab7QYpeXssRfLyE61m530=
In-Reply-To: <20110209184010.GB23747@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On 02/09/11 10:40, Mark Brown wrote:
> On Wed, Feb 09, 2011 at 10:31:29AM -0800, Frank Rowand wrote:
> 
>> Raphael's patch will turn on CONFIG_PM in the correct circumstances, and
>> leave it off when not needed by other config options.  That means that
>> the size overhead will _not_ be an issue for me because CONFIG_PM
>> will not be enabled when not needed.
> 
> That's not the issue you seemed to be raising, though.  While PM is now
> turned on by PM_SLEEP that'll end up getting turned on by default due to
> the dependency on SUSPEND - you appeared to be raising the concern that
> this could happen and surprise users.

No, that is not my concern.  I was saying that Raphael's patches do
not trigger any concern from me.

My concern was that in your very first email that started this thread,
you wrote:

On 02/07/11 04:22, Mark Brown wrote:
> It is very rare to find a current system which is both sufficiently
> resource constrained to want to compile out power management support
> and sufficiently power insensitive to be able to tolerate doing so.
> Since having the configuration option requires non-zero effort to
> maintain, with ifdefery in most drivers, but it is used with vanishing
> rarity it is simpler to just remove the option.

and my understanding of this proposal was a goal to remove the ability
to have CONFIG_PM disabled, which results in increased memory usage
for some configurations.

-Frank
