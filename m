From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH v4 4/6] dmaengine: Make DMA Engine menu visible for
 AVR32 users
Date: Fri, 27 Jun 2008 20:13:04 +0200
Message-ID: <20080627201304.188458be@siona.local>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	<20080626164601.712bf048@hskinnemo-gx745.norway.atmel.com>
	<1214528379.32709.51.camel@dwillia2-linux.ch.intel.com>
	<200806270937.21850.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806270937.21850.david-b@pacbell.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Brownell <david-b@pacbell.net>
Cc: Dan Williams <dan.j.williams@intel.com>, Adrian Bunk <bunk@kernel.org>, Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, "Nelson, Shannon" <shannon.nelson@intel.com>

On Fri, 27 Jun 2008 09:37:21 -0700
David Brownell <david-b@pacbell.net> wrote:

> On Thursday 26 June 2008, Dan Williams wrote:
> > I agree with removing the arch dependency, and I do not think we
> > necessarily need to add HAVE_DMA_ENGINE.
> 
> I think a HAVE_DMA_ENGINE would be better than what you're doing
> below:  moving the arch dependency into the network code, and
> adding this !HIGHMEM64G thing (which is really just a more subtle
> arch dependency).

The !HIGHMEM64G dependency wasn't added; it was there before. I happen
to believe the code that breaks HIGHMEM64G is rather ugly, but that's no
reason to NAK this particular patch. Besides, I'm not really that
interested in the XOR parts of the framework.

> Note that HAS_DMA is very different from having DMA engine support...
> one is a specific interface, the other is the generic mechanism with
> any of its numerous (and often peripheral-specific) interfaces.

They may be different, but you can't have DMA engine support on
platforms that don't provide the DMA mapping API. At least not at the
moment.

The patch looks good to me.

Haavard
