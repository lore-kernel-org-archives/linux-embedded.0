From: Matt Fleming <matt@console-pimps.org>
Subject: Re: New MMC maintainer needed
Date: Thu, 13 Aug 2009 09:21:17 +0100
Message-ID: <20090813082117.GA6837@console-pimps.org>
References: <20090714153601.6dfe70ff@mjolnir.ossman.eu> <20090722151744.fffd7bf5.akpm@linux-foundation.org> <20090728222334.0c543c47@mjolnir.ossman.eu> <20090731122623.254fd0f1@mjolnir.ossman.eu> <20090731105407.GA31900@console-pimps.org> <20090803123429.390a636f@mjolnir.ossman.eu> <4A76C658.6050002@nokia.com> <20090811140223.GA4278@console-pimps.org> <20090812152731.d07bd980.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090812152731.d07bd980.akpm@linux-foundation.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: adrian.hunter@nokia.com, pierre@ossman.eu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, david-b@pacbell.net, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, ppisa@pikron.com, jarkko.lavinen@nokia.com, ben@fluff.org, saschasommer@freenet.de, avorontsov@ru.mvista.com, oakad@yahoo.com, ian@mnementh.co.uk, HaraldWelte@viatech.com, JosephChan@via.com.tw

On Wed, Aug 12, 2009 at 03:27:31PM -0700, Andrew Morton wrote:
> 
> davem has set up linux-mmc@vger.kernel.org for us.  It will be archived
> at marc.info.  Thanks to both..
> 
> I was thinking that we wouldn't need a separate list but then I
> realised I didn't have anywhere to send MMC bug reports.
> 
> 	echo "subscribe linux-mmc" | mail majordomo@vger.kernel.org
> 

Unless someone has beaten me to it,

From a920e6c11635cab6261541a487db7b68b4892a74 Mon Sep 17 00:00:00 2001
From: Matt Fleming <matt@console-pimps.org>
Date: Thu, 13 Aug 2009 09:17:23 +0100
Subject: [PATCH] mmc: Add linux-mmc mailing list

A new linux-mmc mailing list has been set up at vger.kernel.org for all
things related to MMC/SD development.

Signed-off-by: Matt Fleming <matt@console-pimps.org>
---
 MAINTAINERS |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b1114cf..e16c7dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3420,6 +3420,7 @@ S:	Supported
 F:	drivers/mfd/
 
 MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND SDIO SUBSYSTEM
+L:	linux-mmc@vger.kernel.org
 S:	Orphan
 F:	drivers/mmc/
 F:	include/linux/mmc/
-- 
1.6.4.rc0
