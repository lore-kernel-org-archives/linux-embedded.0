From: Andrew Murray <amurray@mpcdata.com>
Subject: Re: [RFC] Kernel 'boot cache' to reduce boot time
Date: Tue, 31 Aug 2010 21:15:53 +0100
Message-ID: <AANLkTin0EYzHAXBOeyAPxMXkskRXY-Lqj3ND+gsnH8E9@mail.gmail.com>
References: <AANLkTimJkPD=shB9oi3ASocaLEpG=C7oDJMbq8BEy2Fe@mail.gmail.com>
	<4C7D5D60.1070203@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4C7D5D60.1070203@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, linux kernel <linux-kernel@vger.kernel.org>, "Van De Ven, Arjan" <arjan.van.de.ven@intel.com>

Hello,

On 31 August 2010 20:52, Tim Bird <tim.bird@am.sony.com> wrote:
> Having said that, I don't think that probing of static
> hardware is a solved problem, by any means.
>
> For the boot cache data, you are going to need to figure
> out how to make the data persistent. =A0Doing something
> in a regular fashion (rather than ad-hoc via command line
> options) should help with this.
Yes I wanted to see if the community was interested in the general
idea before I considered the implementation in too much detail. Though
the two obvious choices spring to mind. 1) Simply serialise and print
any suitable values to the console - these can be parsed with a
bootscript much like the way you parse initcall_debug. 2) Output these
values to a proc file which the use can extract.

The difficult part as I see it - is passing it back to the kernel - as
you suggested they may be some common ground with the device tree
models. Any suggestions?

I anticipate seeing name/value string pairs (or a small number of
types, e.g. int) - and leave it up to the driver to determine the best
way to serialise the data into the supported types. For example a
driver you may see the following pairs in a 'bootcache' file:
lpj=3D12313,drivers.media.video.decoder.ver=3D14,drivers.media.video.ca=
mera.type=3Dpal
etc. I think the information encoded in this way would be a much
higher level that the typical register values used in suspend/resume
code.

>
> To some degree this might end up looking very similar
> to the "resume" path in the driver, where a particular
> device state is entered into from cold start.
I anticipated perhaps a simpler approach where instead of completely
getting rid of the probe - the probe simply skips time consuming paths
via this framework - I though this would make it easier for device
drivers to use the framework.

> Sorry for rambling. =A0Anyway - I'm all for the boot cache idea.
> But acceptability would, of course, be dependent on the
> details of the implementation.
>
> The best thing to get started, IMHO, would be to identify
> a few drivers which have long probe times, and see
> how they could reduce these with the proposed boot cache.
> If you find that each new device adds some new wrinkle
> in the cache requirements, that would be a bad sign. =A0But
> if different drivers, especially drivers in different functional
> areas, are found to be able to use a consistent API, then
> this could be a nice feature.
I agree.

>
> BTW - I could see this tying into the flattened device
> tree work by Grant Likely.
> =A0-- Tim
>
> P.S. =A0Also, I would recommend cross-posting to LKML
> to get wider visibility of your proposal. =A0I'm doing
> so in this response - I hope that's OK.

Thanks for the useful information - I'll read up on those slides.

Andrew Murray
