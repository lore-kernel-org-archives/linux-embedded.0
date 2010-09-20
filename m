From: Kevin Hilman <khilman@deeprootsystems.com>
Subject: Re: Linux Plumbers Embedded microconference
Date: Mon, 20 Sep 2010 10:14:43 -0700
Message-ID: <8739t41gn0.fsf@deeprootsystems.com>
References: <AANLkTinqm-EsovG8c1mfX2zuAgHt5OoRCcD+owBbndNc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTinqm-EsovG8c1mfX2zuAgHt5OoRCcD+owBbndNc@mail.gmail.com>
	(Grant Likely's message of "Fri, 17 Sep 2010 17:32:42 -0600")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, Tim Bird <tim.bird@am.sony.com>, Scott Wood <scottwood@freescale.com>, linux-embedded <linux-embedded@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>, =?iso-8859-1?Q?Lo=EFc?= Minier <lool@dooz.org>, John Linn <John.Linn@xilinx.com>, Becky Bruce <Becky.Bruce@freescale.com>, Kumar Gala <kumar.gala@freescale.com>, Paul Walmsley <paul@pwsan.com>

Grant Likely <grant.likely@secretlab.ca> writes:

> I'm now getting around to drafting the agenda for the embedded
> microconference.  From looking at the proposals and some of the recent
> mailing list discussions, there are some topics that bubble up to the
> surface for me:
>
> 1) Device model usage - Support for runtime PM has been a hot topic,
> but the way the device model is populated and used on embedded
> platforms also has impact on correct initialization ordering, and how
> to instantiate 'system' devices composed of multiple discrete devices
> across the system.  ie. connecting a codec and a DAI in ASoC.
>
> 2) Device Tree, HWMOD, static pdata, SFI, and other methods for
> teaching the kernel about the machine.
>
> 3) Common infrastructure beyond the kernel.  Android has fastboot and
> other tools.  Many folks use u-boot for development, but something
> custom (smaller) for deployment.  Are there any other tools/techniques
> from Android/MeeGo/Linaro/WebOS/etc. that would be useful to a wider
> audience.  Tim Bird has offered to lead this discussion.
>
> 4) Asymmetric multiprocessing (AMP) intercommunication.  Cores are
> cheap, hardware is built with lots of them but how do they
> communicate?  This is an issues for DSPs and for embedded
> virtualization.  Syslink has been proposed.  Freescale PowerPC has
> multicore chips that can be carved up for AMP.  Patches have been
> circulated to repurpose virtio for interprocessor communication.
>
> ...
>
> 1 & 2 are somewhat interrelated as they are both aspects of embedded
> requirements on the device model.  I'm not sure, but I may end up
> merging these two topics to a degree.  My impression is that the same
> problems are being wrestled with in different problem domains.  I'd
> like to schedule 3 or 4 people to give a brief (10-15min) overview of
> how they need devices registered, and how it fits in with the driver
> model, followed by discussion.  Hopefully it will identify areas where
> common solution can/should be implemented.  Or in other words; take
> our own blinders off for a bit and see how other people are solving
> the same problems.  :-)
>
> Here is my draft list:
>
> Kevin: How HWMOD is used to describe interconnections between internal
> SoC devices.

For omap_hwmod, I would like Paul Walmsley (Cc'd) to lead this
discussion (or co-present) as he is the primary author and maintainer of
this for linux-omap.

Paul is planning to be at LPC already, so one or both of us will take
care of it.

Thanks for putting this together,

Kevin
