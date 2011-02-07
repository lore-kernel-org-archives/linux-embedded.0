From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Mon, 7 Feb 2011 14:18:29 +0000
Message-ID: <20110207141829.GK10564@opensource.wolfsonmicro.com>
References: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20110208011324.d5371c4c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110208011324.d5371c4c.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Tue, Feb 08, 2011 at 01:13:24AM +1100, Stephen Rothwell wrote:
> On Mon,  7 Feb 2011 12:22:15 +0000 Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:

> > +	bool
> > +	default y if !IA64_HP_SIM

> Several powerpc configs have CONFIG_PM (implicitly) disabled (e.g. the
> server configs), so this will unexpectedly turn it on for them.

Do you mean that these systems require CONFIG_PM be turned off, or just
that people tend not to turn it on?  If the latter would you expect any
ill effects from doing so?
