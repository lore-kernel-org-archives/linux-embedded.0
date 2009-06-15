From: Marc Pignat <marc.pignat@hevs.ch>
Subject: Re: AT91SAM9G20 design and boot times
Date: Mon, 15 Jun 2009 08:32:36 +0200
Message-ID: <200906150832.36479.marc.pignat@hevs.ch>
References: <ed62800906102037q71f2a6bdq835793a1ac36c41b@mail.gmail.com> <4A30FD17.7060508@atmel.com> <20090612140626.GA10372@game.jcrosoft.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090612140626.GA10372@game.jcrosoft.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Aras Vaichas <arasv@magellan-technology.com>, linux-embedded@vger.kernel.org

Hi all!

> if the boottime is critical I'll recommend you NOR + XIP
Nak, please have a look at "interest in XIP? - boot time benchmarks"
(http://marc.info/?l=linux-arm-kernel&m=117198517723134&w=2)

But in brief : the kernel is started faster with xip, but is so slow that it
will end booting after the non-xip kernel.

NOR flash bandwidth is *very* slow compared to SDRAM.

Best regards

Marc
