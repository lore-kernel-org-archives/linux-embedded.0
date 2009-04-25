From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [Patch] Wait for console to become available, ver 3
Date: Sat, 25 Apr 2009 10:16:59 +0200
Message-ID: <20090425081657.GB2428@ucw.cz>
References: <20090417213148.GA27825@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090417213148.GA27825@cuplxvomd02.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David VomLehn <dvomlehn@cisco.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Hi!

> Parallelization to improve boot times has been successful enough that race
> conditions now exist between the init_post() open of /dev/console and
> initialization of the console device. When this occurs, opening /dev/console
> fails and any applications inherited from init have no standard in/out/error
> devices. This is expected behavior if no console device is available, but
> quite unfortunate in the case where the console is just a bit slow waking up.
> 
> Some buses, such as USB, offer no guarantees about how long it takes to
> discover devices, so there is no reliable way to distinguish between a missing
> console and a slow one.  The pragmatic approach taken in this patch is to
> wait for a while to see if a console shows up, and just go on if it doesn't.
> The default delay is 1000 msec (1 second).
> 
> There are two new command line parameters:
> consolewait		Wait forever for a console to be registered
> consoledelay=msec	Use the given number of milliseconds as the delay
> 			interval instead of the default

Could you use rootfsdelay for this? Root needs to be mounted for init
to run, so...?
								Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
