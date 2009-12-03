From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Thu, 3 Dec 2009 21:54:47 +0100
Message-ID: <20091203205447.GJ22533@pengutronix.de>
References: <4B15AAFE.4030705@am.sony.com> <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com> <4B16E03D.3000202@am.sony.com> <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com> <20091203062503.4300CE6D391@gemini.denx.de> <9c9fda240912030538j14ea07bdr7fa2f4c1b902405c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9c9fda240912030538j14ea07bdr7fa2f4c1b902405c@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Dec 03, 2009 at 10:38:07PM +0900, Kyungmin Park wrote:
> How about the TFTP over USB? It's required feature for no ethernet devices

In barebox (aka u-boot-v2) we have USB DFU support, in a very flexible
way. Would that fit your needs?

> I wish some filesystem to share between u-boot and kernel. Of course
> ext2 or fat is possbile. but current u-boot implementation depends on
> block device or NOR device. not for NAND/OneNAND devices.

That would indeed be interesting.

> Finally very very small jpeg or png library for u-boot (under 30KiB).

What's your use case for that, a splash screen?

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
