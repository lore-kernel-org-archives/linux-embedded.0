From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Mon, 7 Feb 2011 15:21:32 +0000
Message-ID: <20110207152132.GM10564@opensource.wolfsonmicro.com>
References: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20110208011324.d5371c4c.sfr@canb.auug.org.au>
 <20110207141829.GK10564@opensource.wolfsonmicro.com>
 <20110208014432.2c9288e4.sfr@canb.auug.org.au>
 <20110207145031.GL10564@opensource.wolfsonmicro.com>
 <AANLkTikw7j5Q7CGZK=Xbcgubt9LYBGiXf01wQ4nbg8NR@mail.gmail.com>
 <20110208021045.699654ca.sfr@canb.auug.org.au>
 <20110208021916.68b33b37.sfr@canb.auug.org.au>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110208021916.68b33b37.sfr@canb.auug.org.au>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Tue, Feb 08, 2011 at 02:19:16AM +1100, Stephen Rothwell wrote:

> At least some of the powerpc defconfigs were added with CONFIG_PM
> disabled.  I assume that was on purpose (though it may not have been).

I'd not be so sure - since it's a bool without an explicit default set
Kconfig will default to disabling it and if anything enabling it is the
option that requires special effort.
