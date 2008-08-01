From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
	features
Date: Fri, 1 Aug 2008 09:17:27 +0200
Message-ID: <20080801071727.GI8254@pengutronix.de>
References: <200807311850.m6VIoqCE015883@arbas.nms.ulrich-teichert.org> <1217533588.2328.1.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1217533588.2328.1.camel@localhost.localdomain>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Boyer <jwboyer@gmail.com>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Tim Bird <tim.bird@am.sony.com>, David Miller <davem@davemloft.net>, dwmw2@infradead.org, torvalds@linux-foundation.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

On Thu, Jul 31, 2008 at 03:46:28PM -0400, Josh Boyer wrote:
> > I do not think of NTP as desktop or server application, but that's
> > probably just me,
>
> No, it's not just you. NTP is useful in cases where things do care
> about time but hardware designers were too cheap to put an RTC on the
> board.

Yes, we also have such customer systems, i.e. one which is used in a
Telemetry application where you can have hundrets of PXA270 data
concentrators that collect data from FPGAs and push them to a PC via
ethernet. As the system does not work without the PC, the hardware
designers decided that they can save hundrets of RTCs.

Or another autonomous data collection system where only one system of
several tens has an RTC...

We used chrony in these cases, as the standard ntputils seem to be
optimized for scenarios where you have permanent network connection,
which is often not the case in embedded applications.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
