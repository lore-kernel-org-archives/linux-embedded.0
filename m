From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH v4 5/6] dmaengine: Driver for the Synopsys DesignWare
 DMA controller
Date: Fri, 4 Jul 2008 18:10:40 +0200
Message-ID: <20080704181040.27bb82b4@siona.local>
References: <f12847240806270224h696e78a1v4a1aa6a87fb4a171@mail.gmail.com>
	<7F38996F7185A24AB9071ED4950AD8C101C4D314@swsmsx413.ger.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <7F38996F7185A24AB9071ED4950AD8C101C4D314@swsmsx413.ger.corp.intel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Sosnowski, Maciej" <maciej.sosnowski@intel.com>
Cc: "Williams, Dan J" <dan.j.williams@intel.com>, drzeus-list@drzeus.cx, lkml <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org, kernel@avr32linux.org, "Nelson, Shannon" <shannon.nelson@intel.com>, david-b@pacbell.net

On Fri, 4 Jul 2008 16:33:53 +0100
"Sosnowski, Maciej" <maciej.sosnowski@intel.com> wrote:
> Coulpe of questions and comments from my side below.
> Apart from that the code looks fine to me.
> 
> Acked-by: Maciej Sosnowski <maciej.sosnowski@intel.com>

Thanks a lot for reviewing!

> > +/* Called with dwc->lock held and bh disabled */
> > +static void dwc_dostart(struct dw_dma_chan *dwc, struct dw_desc
> *first)
> > +{
> > +       struct dw_dma   *dw = to_dw_dma(dwc->chan.device);
> > +
> > +       /* ASSERT:  channel is idle */
> > +       if (dma_readl(dw, CH_EN) & dwc->mask) {
> > +               dev_err(&dwc->chan.dev,
> > +                       "BUG: Attempted to start non-idle channel\n");
> > +               dev_err(&dwc->chan.dev,
> > +                       "  SAR: 0x%x DAR: 0x%x LLP: 0x%x CTL:
> 0x%x:%08x\n",
> > +                       channel_readl(dwc, SAR),
> > +                       channel_readl(dwc, DAR),
> > +                       channel_readl(dwc, LLP),
> > +                       channel_readl(dwc, CTL_HI),
> > +                       channel_readl(dwc, CTL_LO));
> > +
> > +               /* The tasklet will hopefully advance the queue... */
> > +               return;
> 
> Should not at this point an error status be returned 
> so that it can be handled accordingly by dwc_dostart() caller?

There's not a whole lot of meaningful things to do for the caller. It
should never happen in the first place, but if the channel _is_ active
at this point, we will eventually get an xfer complete interrupt when
the currently pending transfers are done. The descriptors have already
been added to the list, so the driver should recover from this kind of
bug automatically.

I've never actually triggered this code, so I can't really say for
certain that it works, but at least in theory it makes much more sense
to fix things up when the channel eventually becomes idle.

> > +       ctllo = DWC_DEFAULT_CTLLO
> > +                       | DWC_CTLL_DST_WIDTH(dst_width)
> > +                       | DWC_CTLL_SRC_WIDTH(src_width)
> > +                       | DWC_CTLL_DST_INC
> > +                       | DWC_CTLL_SRC_INC
> > +                       | DWC_CTLL_FC_M2M;
> > +       prev = first = NULL;
> > +
> > +       for (offset = 0; offset < len; offset += xfer_count <<
> src_width) {
> > +               xfer_count = min_t(size_t, (len - offset) >>
> src_width,
> > +                               DWC_MAX_COUNT);
> 
> Here it looks like the maximum xfer_count value can change - it depends
> on src_width, 
> so it may be different for different transactions.
> Is that ok?

Yes, the maximum tranfer count is defined as the maximum number of
source transactions on the bus. So if the controller is set up to do 32
bits at a time on the source side, the maximum transfer _length_ is
four times the maximum transfer _count_.

The value written to the descriptor is also a transaction count, not a
byte count.

> This driver does not perform any self-test during initialization.
> What about adding some initial HW checking?

I'm not sure if it makes a lot of sense -- this device is typically
integrated on the same silicon as the CPU, so if there are any issues
with the DMA controller, they should be caught during production
testing.

I'm using the dmatest module for validating the driver, so I feel the
self-test stuff becomes somewhat redundant.

Haavard
