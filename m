From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH v4 6/6] Atmel MCI: Driver for Atmel on-chip MMC
 controllers
Date: Sat, 28 Jun 2008 16:01:21 +0200
Message-ID: <20080628160121.10c7c1b0@hskinnemo-gx745.norway.atmel.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-4-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-5-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-6-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-7-git-send-email-haavard.skinnemoen@atmel.com>
	<20080627211014.0e80db04@siona.local>
	<20080627215627.5d75639c@mjolnir.drzeus.cx>
	<20080628144313.353bbf18@hskinnemo-gx745.norway.atmel.com>
	<20080628154515.0eb002f6@mjolnir.drzeus.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753744AbYF1OBk@vger.kernel.org>
In-Reply-To: <20080628154515.0eb002f6@mjolnir.drzeus.cx>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Ossman <drzeus-list@drzeus.cx>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, David Brownell <david-b@pacbell.net>

Pierre Ossman <drzeus-list@drzeus.cx> wrote:
> On Sat, 28 Jun 2008 14:43:13 +0200
> Haavard Skinnemoen <haavard.skinnemoen@atmel.com> wrote:
> 
> > Tests 15 and 17 return -EILSEQ instead of -ETIMEDOUT. The at91_mci
> > driver has the same problem, and I think it's a hardware issue -- the
> > controller wrongly flags a CRC error instead of a data timeout error
> > if the card doesn't respond with any CRC status after a write. I don't
> > know how to work around that problem.  
> 
> If that's how the hardware behaves, then EILSEQ will have to do. The
> test is more about forcing people to do proper error management in the
> driver than anything else. Have a check that you don't report a bad
> bytes_xfered though.

bytes_xfered is 0 if any block failed. If I understand correctly, this
is good enough, but not optimal. I want to improve this later, but I
might need some more feedback from the DMA engine subsystem (e.g.
adding "actual" and "status" fields to the descriptor.)

The DMA slave interface isn't perfect yet, but I think the current
incarnation is actually useful and performs well even though it's very
basic. We can make incremental improvements later to improve error
reporting, offer more advanced control over the transfers, and support
other use cases better (e.g. audio.)

Haavard
