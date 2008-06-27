From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [PATCH v4 4/6] dmaengine: Make DMA Engine menu visible for
	AVR32 users
Date: Fri, 27 Jun 2008 20:44:41 +0300
Message-ID: <20080627174441.GB4306@cs181140183.pp.htv.fi>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com> <20080626164601.712bf048@hskinnemo-gx745.norway.atmel.com> <1214528379.32709.51.camel@dwillia2-linux.ch.intel.com> <200806270937.21850.david-b@pacbell.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806270937.21850.david-b@pacbell.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <david-b@pacbell.net>
Cc: Dan Williams <dan.j.williams@intel.com>, Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, "Nelson, Shannon" <shannon.nelson@intel.com>

On Fri, Jun 27, 2008 at 09:37:21AM -0700, David Brownell wrote:
> On Thursday 26 June 2008, Dan Williams wrote:
> > I agree with removing the arch dependency, and I do not think we
> > necessarily need to add HAVE_DMA_ENGINE.
> 
> I think a HAVE_DMA_ENGINE would be better than what you're doing
> below:  moving the arch dependency into the network code, and
> adding this !HIGHMEM64G thing (which is really just a more subtle
> arch dependency).
>...

The only effect of the HAVE_DMA_ENGINE would be to not show an empty 
kconfig menu.

That's IMHO too much effort for a purely cosmetical kconfig issue.

And I speak as the one who originally added the arch dependency...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
