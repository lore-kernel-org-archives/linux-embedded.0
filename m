From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [RFC] Kernel 'boot cache' to reduce boot time
Date: Tue, 31 Aug 2010 12:52:00 -0700
Message-ID: <4C7D5D60.1070203@am.sony.com>
References: <AANLkTimJkPD=shB9oi3ASocaLEpG=C7oDJMbq8BEy2Fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimJkPD=shB9oi3ASocaLEpG=C7oDJMbq8BEy2Fe@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Murray <amurray@mpcdata.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, linux kernel <linux-kernel@vger.kernel.org>, "Van De Ven, Arjan" <arjan.van.de.ven@intel.com>

On 08/31/2010 12:13 PM, Andrew Murray wrote:
> I have a suggestion for a kernel framework which aims to reduce boot
> time in embedded devices and would be interested in hearing your
> feedback.
> 
> A large portion of kernel boot time is spent in driver probe functions
> often waiting for hardware for example calculating LPJ values or
> trying to determine what type of camera is connected (PAL/NTSC) etc.
> However for most embedded devices the hardware remains constant and
> these probes always determine the same information. Therefore boot
> time can be decreased by removing some of this probe code and
> replacing it with known values.
> 
> To some extent some of these optimisations have already been done
> through a variety of methods - for example the LPJ calculation can be
> bypassed with the lpj= parameter and some drivers have their own
> methods. My solution aims to generalise these solutions...
> 
> The solution is to provide a very simple framework which will allow
> drivers to identify and record such values (LPJ, camera type, decoder
> chip version) during boot. Once booted the user can obtain a
> collection of these values and pass them back to the kernel on
> subsequent boots. During subsequent boots - drivers upon realising
> these values have already been provided can bypass some of their probe
> code and thus reducing boot time. Taking advantage of this framework
> would be very trivial for drivers.
> 
> I wanted to see your views on the overall solution prior to
> considering how it could be implemented.

For my part, I think this sounds like a great idea.  I have
considered such a mechanism in the past, but never gotten around
to actually designing a solution.

Here are some random thoughts on this idea:

My experience is that we've made good progress on boot time
probing, for fixed hardware.  The big problems in the kernel
boot time appear to be with busses that require discovery of
devices, with long timeouts specified in the bus standard and
arbitrary bus connection architecture (I'm thinking of USB,
but other busses have similar problems).  For many embedded
devices, scanning these types of pluggable busses aren't
required for what I call "first product use", but they can be
scanned and populated later.

Note that the asynchronous function call stuff by Arjan
van de Ven addresses some of this boot time probing
delay problem.

Having said that, I don't think that probing of static
hardware is a solved problem, by any means.

For the boot cache data, you are going to need to figure
out how to make the data persistent.  Doing something
in a regular fashion (rather than ad-hoc via command line
options) should help with this.

To some degree this might end up looking very similar
to the "resume" path in the driver, where a particular
device state is entered into from cold start.

Sony has been doing something related to this called
"Snapshot boot" for some time now, which is kind of an
optimized unhibernate operation, with some hardware bringup
done by firmware, and some bringup done using the normal driver
resume operation.  This work was presented at OLS
several years ago, but we haven't pushed it much since
then.  (But we're using it in product)
See http://elinux.org/upload/3/37/Snapshot-boot-final.pdf

Sorry for rambling.  Anyway - I'm all for the boot cache idea.
But acceptability would, of course, be dependent on the
details of the implementation.

The best thing to get started, IMHO, would be to identify
a few drivers which have long probe times, and see
how they could reduce these with the proposed boot cache.
If you find that each new device adds some new wrinkle
in the cache requirements, that would be a bad sign.  But
if different drivers, especially drivers in different functional
areas, are found to be able to use a consistent API, then
this could be a nice feature.

BTW - I could see this tying into the flattened device
tree work by Grant Likely.
 -- Tim

P.S.  Also, I would recommend cross-posting to LKML
to get wider visibility of your proposal.  I'm doing
so in this response - I hope that's OK.

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Network Entertainment
=============================
