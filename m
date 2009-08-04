From: David Brownell <david-b@pacbell.net>
Subject: Re: New MMC maintainer needed
Date: Mon, 3 Aug 2009 18:51:23 -0700
Message-ID: <200908031851.24375.david-b@pacbell.net>
References: <20090714153601.6dfe70ff@mjolnir.ossman.eu> <20090728222334.0c543c47@mjolnir.ossman.eu> <20090731122623.254fd0f1@mjolnir.ossman.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933898AbZHEA3K@vger.kernel.org>
In-Reply-To: <20090731122623.254fd0f1@mjolnir.ossman.eu>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Ossman <pierre@ossman.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, ppisa@pikron.com, jarkko.lavinen@nokia.com, ben@fluff.org, saschasommer@freenet.de, avorontsov@ru.mvista.com, oakad@yahoo.com, ian@mnementh.co.uk, HaraldWelte@viatech.com, JosephChan@via.com.tw, adrian.hunter@nokia.com

On Friday 31 July 2009, Pierre Ossman wrote:
> Restoring back the system state from MMC after a successful hibernation
> http://marc.info/?t=124818534700003&r=1&w=2
> 
> I don't agree with this approach. The point of the workqueue is so that
> the kernel can do things in parallel, so this patch is a step back. The
> problem is really with how the kernel doesn't properly cope with
> asynchronous disk scanning during bootup. The root_delay parameter was
> added for this for the "normal" case, but it seems more work is needed.

Doesn't handing of resumes needs more attention overall?

Example, root on eMMC (e.g. a 32-MByte non-removable chip) wouldn't
resume at all well the last time I checked ... mounted file systems
(not just root) made trouble.  Hardware that reliably reports card
insert/remove was rude in the same ways.

- Dave

