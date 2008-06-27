From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH v4 4/6] dmaengine: Make DMA Engine menu visible for AVR32 users
Date: Fri, 27 Jun 2008 11:24:42 -0700
Message-ID: <200806271124.42783.david-b@pacbell.net>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com> <200806270937.21850.david-b@pacbell.net> <20080627174441.GB4306@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080627174441.GB4306@cs181140183.pp.htv.fi>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>, Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, "Nelson, Shannon" <shannon.nelson@intel.com>

On Friday 27 June 2008, Adrian Bunk wrote:
> The only effect of the HAVE_DMA_ENGINE would be to not show an empty 
> kconfig menu.

Well, no.  It would also make the network layer memcpy "acceleration"
option unavailable when there was no underlying engine ... similarly
with other pointless "we don't have that subsystem here" options.

Plus it would help ensure that the arch dependencies are comprehenible,
unlike that highmem thing.
