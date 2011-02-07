From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Mon, 7 Feb 2011 13:48:46 +0100
Message-ID: <20110207124846.GA10442@elte.hu>
References: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org


* Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:

> It is very rare to find a current system which is both sufficiently
> resource constrained to want to compile out power management support
> and sufficiently power insensitive to be able to tolerate doing so.
> Since having the configuration option requires non-zero effort to
> maintain, with ifdefery in most drivers, but it is used with vanishing
> rarity it is simpler to just remove the option.

Well, either make it dependent on CONFIG_EXPERT or remove the option altogether.

Thanks,

	Ingo
