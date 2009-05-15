From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Can I run an application compiled with gcc ABI 2.95 on a
 kernel compiled with gcc ABI 3.4?
Date: Fri, 15 May 2009 14:56:05 +0100
Message-ID: <1242395765.4201.94.camel@macbook.infradead.org>
References: <20090515115009.110740@gmx.net>
	 <1242390699.4201.3.camel@macbook.infradead.org>
	 <20090515135105.GC8235@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090515135105.GC8235@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: muzungu@gmx.net, linux-embedded@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

On Fri, 2009-05-15 at 14:51 +0100, Jamie Lokier wrote:
> 
> Eek, can you say a bit more about the ARM EABI mismatch?
> 
> I would like to run a shiny modern ARM EABI kernel and userspace, but
> also need to run one or two OABI binaries (from the gcc 2.95 era) on
> the same kernel which I cannot recompile because they're built with
> closed source libraries only supplied as OABI.
> 
> Does that not work at all?
> 
> If it does work, which part of userspace must be EABI to work?

It was just a note of caution that sometimes we _do_ change the ABI.

I'm not 100% sure offhand whether the EABI kernel can support OABI
userspace; I didn't think so though.

-- 
dwmw2
