From: Grant Likely <grant.likely@secretlab.ca>
Subject: Linux Plumbers Embedded microconference
Date: Fri, 17 Sep 2010 17:32:42 -0600
Message-ID: <AANLkTinqm-EsovG8c1mfX2zuAgHt5OoRCcD+owBbndNc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Hilman <khilman@deeprootsystems.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, Tim Bird <tim.bird@am.sony.com>, Scott Wood <sc>

I'm now getting around to drafting the agenda for the embedded
microconference.  From looking at the proposals and some of the recent
mailing list discussions, there are some topics that bubble up to the
surface for me:

1) Device model usage - Support for runtime PM has been a hot topic,
but the way the device model is populated and used on embedded
platforms also has impact on correct initialization ordering, and how
to instantiate 'system' devices composed of multiple discrete devices
across the system.  ie. connecting a codec and a DAI in ASoC.

2) Device Tree, HWMOD, static pdata, SFI, and other methods for
teaching the kernel about the machine.

3) Common infrastructure beyond the kernel.  Android has fastboot and
other tools.  Many folks use u-boot for development, but something
custom (smaller) for deployment.  Are there any other tools/techniques
from Android/MeeGo/Linaro/WebOS/etc. that would be useful to a wider
audience.  Tim Bird has offered to lead this discussion.

4) Asymmetric multiprocessing (AMP) intercommunication.  Cores are
cheap, hardware is built with lots of them but how do they
communicate?  This is an issues for DSPs and for embedded
virtualization.  Syslink has been proposed.  Freescale PowerPC has
multicore chips that can be carved up for AMP.  Patches have been
circulated to repurpose virtio for interprocessor communication.

...

1 & 2 are somewhat interrelated as they are both aspects of embedded
requirements on the device model.  I'm not sure, but I may end up
merging these two topics to a degree.  My impression is that the same
problems are being wrestled with in different problem domains.  I'd
like to schedule 3 or 4 people to give a brief (10-15min) overview of
how they need devices registered, and how it fits in with the driver
model, followed by discussion.  Hopefully it will identify areas where
common solution can/should be implemented.  Or in other words; take
our own blinders off for a bit and see how other people are solving
the same problems.  :-)

Here is my draft list:

Kevin: How HWMOD is used to describe interconnections between internal
SoC devices.
Mark or Liam: ASoC - How what needs to be done to collect disparate
devices (codecs, audio controllers, etc) into a single SoC device.
Jeremy: Populating the device model with device tree external data (why and how)
(I'm also open to other suggestions)

Mark and Liam, I know you haven't made a proposal to do this, but if
you'd be willing I think it would be valuable.

...

The AMP IPC topic is interesting to me, but I'd like to get some
feedback before I commit to it.  I would schedule it the same way that
the device model discussion is organized; 3-4 overviews 10-15 minutes
each followed by discussion.  Right now I've got a proposal from the
TI folks to talk about Syslink.  Freescalers, what say you?  Could I
convince one of you to talk about AMP IPC on your powerpc multicore
SoCs?  Multicore on Xilinx FPGAs would also be interesting, but I'm
not up to date on if anybody is actively working on that.  Are there
any other AMP IPC mechanisms that should be discussed?

...

Tim, Jeremy and Kevin; I've accepted your micro-conference topics.  As
the conference gets closer I'll write up a draft of the actual agenda
and your proposals can be massaged appropriately to reflect exactly
what issues will be discussed.

Thoughts?
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
