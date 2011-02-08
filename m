From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Tue, 8 Feb 2011 15:29:01 +0100
Message-ID: <20110208142901.GB1437@ucw.cz>
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

Hi!

> It is very rare to find a current system which is both sufficiently
> resource constrained to want to compile out power management support
> and sufficiently power insensitive to be able to tolerate doing so.

Ok, how much memory do we talk about here?

Lots of embedded systems are AC powered or powered from some powerful
source -- such as alternator in car. PM can be unwanted complexity
there.

Ot maybe they are running under realtime hypervisor...

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
