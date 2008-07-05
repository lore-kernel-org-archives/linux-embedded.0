From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: optimal hardware design for an ARM9 based single board
	computer to work with existing linux drivers
Date: Sat, 5 Jul 2008 13:32:55 +0200
Message-ID: <20080705113255.GO4319@pengutronix.de>
References: <486F38CF.40803@gmail.com> <20080705103509.GN4319@pengutronix.de> <486F557D.3090209@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <486F557D.3090209@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Sat, Jul 05, 2008 at 01:05:33PM +0200, Stefan Schoenleitner wrote:
> Where did you get your information from ?

Thought I had read something like that, but if they say so ...

> To quote one of the cirrus guys:
> ----------------------------------------------------------------------------------------
> "It is not being discontinued. We just will not be supporting the OS's
> like Wince and Linux anymore. The linux part is supported mostly by
> this forum and OE, and the cirrus-linux mailing list.

Has it been different in the past? Last time we had an EP93 project (has
been some time ago), the support for Maverick Crunch was horrible and
cirrus' effort to support Linux mainline was almost 0.

If you want to have something which has good community support, check
what the mainline Linux kernel supports and base your stuff on that.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
