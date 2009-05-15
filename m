From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Can I run an application compiled with gcc ABI 2.95 on a kernel compiled with gcc ABI 3.4?
Date: Fri, 15 May 2009 14:51:05 +0100
Message-ID: <20090515135105.GC8235@shareable.org>
References: <20090515115009.110740@gmx.net> <1242390699.4201.3.camel@macbook.infradead.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1242390699.4201.3.camel@macbook.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: muzungu@gmx.net, linux-embedded@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

David Woodhouse wrote:
> On Fri, 2009-05-15 at 13:50 +0200, muzungu@gmx.net wrote:
> > Questions:
> > - Can I run an application compiled with gcc ABI 2.95 on a kernel
> > compiled with gcc ABI 3.4?
> 
> Yes. The kernel ABI never changes in a backward-incompatible fashion.
> Unless you try switching your kernel to ARM EABI and don't update
> userspace to match -- don't do that :)

Eek, can you say a bit more about the ARM EABI mismatch?

I would like to run a shiny modern ARM EABI kernel and userspace, but
also need to run one or two OABI binaries (from the gcc 2.95 era) on
the same kernel which I cannot recompile because they're built with
closed source libraries only supplied as OABI.

Does that not work at all?

If it does work, which part of userspace must be EABI to work?

Thanks,
-- Jamie
