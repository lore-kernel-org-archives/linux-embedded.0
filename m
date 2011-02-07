From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Mon, 7 Feb 2011 15:49:53 +0000
Message-ID: <20110207154953.GN10564@opensource.wolfsonmicro.com>
References: <20110207152132.GM10564@opensource.wolfsonmicro.com>
 <Pine.LNX.4.44L0.1102071035320.1924-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1102071035320.1924-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert@linux-m68k.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Len Brown <len.brown@intel.com>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Mon, Feb 07, 2011 at 10:36:31AM -0500, Alan Stern wrote:
> On Mon, 7 Feb 2011, Mark Brown wrote:

> > I'd not be so sure - since it's a bool without an explicit default set
> > Kconfig will default to disabling it and if anything enabling it is the
> > option that requires special effort.

> This may be a naive suggestion, but have you considered simply _asking_
> the people who added those defconfigs?

I'm rather hoping that they'll notice the mailing list thread or that
someone else who knows what's going on with them does - as Geert pointed
out there's a considerable number of defconfigs that have this turned
off.  It seems more sensible to get some idea if this seems sane to
people in the general case before going trying to identify and contact
so many individuals.

If there are systems that really require disabling CONFIG_PM we probably
need to add stuff to Kconfig to make sure it can't be enabled anyway;
this shouldn't enable any new configurations.
