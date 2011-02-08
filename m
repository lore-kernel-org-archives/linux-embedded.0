From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Tue, 8 Feb 2011 14:15:39 +0000
Message-ID: <20110208141539.GI29850@opensource.wolfsonmicro.com>
References: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <4D50AFD0.9020704@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D50AFD0.9020704@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frank.rowand@am.sony.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org

On Mon, Feb 07, 2011 at 06:52:00PM -0800, Frank Rowand wrote:
> On 02/07/11 04:22, Mark Brown wrote:

> > Since having the configuration option requires non-zero effort to
> > maintain, with ifdefery in most drivers, but it is used with vanishing
> > rarity it is simpler to just remove the option.

> Proof by assertion that it is used with vanishing rarity.

Sure, hopefully if it's incorrect people will come out of the woodwork
to correct me :)

> That is not a good method of getting feedback from users.

>  1) It immediately removes the ability to have CONFIG_PM undefined,
>     without first giving active users a chance to provide feedback.

Note that it's not a terribly difficult change to reverse; if someone
urgently does need to do so then I'd be surprised if they were able to
build a kernel but not cope with that change.

>  2) The removal of that ability is not obvious ("make oldconfig" does
>     not say anything about CONFIG_PM).  It is easy to overlook a
>     config change that happens silently.

It will expose the sub-options which actually do stuff, though - it's
only the top level option for PM.

> Would it be appropriate to use Documentation/feature-removal-schedule.txt
> if this truly will be removed?

I guess, though I'm a bit pessimistic about anyone actually noticing.
With Raphael's version it's not such a big deal as CONFIG_PM is selected
by other options that previously depended on it instead of being enabled
all the time.
