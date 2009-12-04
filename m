From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Fri, 4 Dec 2009 09:02:06 +0100
Message-ID: <20091204080206.GK22533@pengutronix.de>
References: <4B15AAFE.4030705@am.sony.com> <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com> <4B16E03D.3000202@am.sony.com> <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com> <20091203062503.4300CE6D391@gemini.denx.de> <9c9fda240912030538j14ea07bdr7fa2f4c1b902405c@mail.gmail.com> <20091203205447.GJ22533@pengutronix.de> <ed62800912031929i59f9d136s31f135ae6f56a884@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ed62800912031929i59f9d136s31f135ae6f56a884@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aras Vaichas <arasv@magellan-technology.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Fri, Dec 04, 2009 at 02:29:12PM +1100, Aras Vaichas wrote:
> > In barebox (aka u-boot-v2) we have USB DFU support, in a very flexible
> > way. Would that fit your needs?
>
> That would probably be better than TFTP over ethernet. A USB DFU
> upgrade would only require the microcontroller to be functioning for
> the upgrade to work and it doesn't require TCP/IP stack or ethernet
> chip drivers.

Yup. Barebox has Kconfig as it's configuration system, so you can make
components y/n/m. It follows the same module mechanism as the kernel, so
you can insmod drivers if you need them.

> I maintain a family of devices which can be built with or without
> ethernet. Currently we attach an ethernet daughterboard to the device
> to bootstrap it, and for development, but remove it for commercial
> use.

Sounds like a usecase for insmod :-)

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
