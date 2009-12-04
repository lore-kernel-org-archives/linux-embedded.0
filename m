From: Aras Vaichas <arasv@magellan-technology.com>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Fri, 4 Dec 2009 14:29:12 +1100
Message-ID: <ed62800912031929i59f9d136s31f135ae6f56a884@mail.gmail.com>
References: <4B15AAFE.4030705@am.sony.com>
	 <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com>
	 <4B16E03D.3000202@am.sony.com>
	 <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com>
	 <20091203062503.4300CE6D391@gemini.denx.de>
	 <9c9fda240912030538j14ea07bdr7fa2f4c1b902405c@mail.gmail.com>
	 <20091203205447.GJ22533@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20091203205447.GJ22533@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>

2009/12/4 Robert Schwebel <r.schwebel@pengutronix.de>:
> On Thu, Dec 03, 2009 at 10:38:07PM +0900, Kyungmin Park wrote:
>> How about the TFTP over USB? It's required feature for no ethernet devices
>
> In barebox (aka u-boot-v2) we have USB DFU support, in a very flexible
> way. Would that fit your needs?

That would probably be better than TFTP over ethernet. A USB DFU
upgrade would only require the microcontroller to be functioning for
the upgrade to work and it doesn't require TCP/IP stack or ethernet
chip drivers.

I maintain a family of devices which can be built with or without
ethernet. Currently we attach an ethernet daughterboard to the device
to bootstrap it, and for development, but remove it for commercial
use.

We are planning on using a PEEDI JTAG for production installation and
I have been working with the PEEDI developers to get UBI/UBIFS support
into the PEEDI (currently supports JFFS2). JTAG is good for production
installation but USB DFU is ideal for field upgrades or bricked-system
recovery.

Aras Vaichas
