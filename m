From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [Ksummit-2009-discuss] Representing Embedded Architectures at
	the Kernel Summit
Date: Wed, 3 Jun 2009 10:11:02 -0400
Message-ID: <20090603141102.GC8655@zod.rchland.ibm.com>
References: <1243956140.4229.25.camel@mulgrave.int.hansenpartnership.com> <1244034286.24482.84.camel@pc1117.cambridge.arm.com> <20090603131842.GT3095@hansolo.jdub.homelinux.org> <1244036737.24482.96.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1244036737.24482.96.camel@pc1117.cambridge.arm.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Jun 03, 2009 at 02:45:37PM +0100, Catalin Marinas wrote:
>On Wed, 2009-06-03 at 09:18 -0400, Josh Boyer wrote:
>> On Wed, Jun 03, 2009 at 02:04:46PM +0100, Catalin Marinas wrote:
>> >      * Mixed endianness devices in the same system - this may only need
>> >        dedicated readl_be/writel_be etc. macros but it could also be
>> >        done by having bus-aware readl/writel-like macros
>> 
>> ioread/iowrite{8,16,32} and ioread/iowrite{8,16,32}_be don't suffice here?
>
>Yes, but there there are many drivers that only use readl/writel (and
>arch/arm makes the assumption, maybe correctly, that this is little
>endian only).

readl/writel are little-endian only.

>I think that's useful even if the outcome of such discussion is better
>documentation on the above functions/macros (grepping Documentation/
>doesn't show any reference).

I think we could perhaps start with just writting some of that documentation
and trying to get it into the kernel.  I'm not sure this specific item is
really worth of a KS topic.

josh
