From: "George G. Davis" <gdavis@mvista.com>
Subject: Re: Can I run an application compiled with gcc ABI 2.95 on a
	kernel compiled with gcc ABI 3.4?
Date: Fri, 15 May 2009 10:32:30 -0400
Message-ID: <20090515143230.GE10977@mvista.com>
References: <20090515115009.110740@gmx.net> <1242390699.4201.3.camel@macbook.infradead.org> <20090515135105.GC8235@shareable.org> <20090515135557.GC18976@trinity.fluff.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090515135557.GC18976@trinity.fluff.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Dooks <ben-linux@fluff.org>
Cc: Jamie Lokier <jamie@shareable.org>, David Woodhouse <dwmw2@infradead.org>, muzungu@gmx.net, linux-embedded@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

Hi,

On Fri, May 15, 2009 at 02:55:57PM +0100, Ben Dooks wrote:
> On Fri, May 15, 2009 at 02:51:05PM +0100, Jamie Lokier wrote:
> > Eek, can you say a bit more about the ARM EABI mismatch?
> > 
> > I would like to run a shiny modern ARM EABI kernel and userspace, but
> > also need to run one or two OABI binaries (from the gcc 2.95 era) on
> > the same kernel which I cannot recompile because they're built with
> > closed source libraries only supplied as OABI.
> > 
> > Does that not work at all?
> 
> There are a few ioctl() incompatibilities between the two ABIs, the
> main problems are within the ALSA API. Mostly it will work, but there
> are a couple of caveats.

Right, you can run ARM OABI binaries on an ARM eABI kernel by enabling
OABI_COMPAT.  However, as Ben notes, there are (more than, IMNSHO ; )
"a couple of caveats".  Most of the "easy" ABI compatibility fixups
should be handled already via OABI_COMPAT.  However, it's practically
impossible to fixup all OABI/eABI compatibility issues due to register
assignment, parameter alignment and/or packing differences between
the two ABIs.  You would have to analyze all kernel and driver
user interfaces to reassign parameters to registers, align and/or
repack data structures, etc.,.  In fact, some of the existing fixups
include side effects that in some cases can cause userspace code to
fail, depending on how it is using I/O parameters, e.g. in some cases,
library code may try to validate parameters which are relocated and
those tests fail due to reshuffling of parameters.  It's a nasty
path to go down, quite frankly. I would not recommend trying to
support OABI binaries on an eABI kernel using OABI_COMPAT.

--
Regards,
George

> 
> -- 
> Ben
> 
> Q:      What's a light-year?
> A:      One-third less calories than a regular year.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
