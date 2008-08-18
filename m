From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] [x86] Move cmpxchg fallbacks to a generic place
Date: Mon, 18 Aug 2008 16:07:06 +0200
Message-ID: <20080818140706.GB30511@elte.hu>
References: <20080815143843.GA519@elte.hu> <1219055602-8046-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1219055602-8046-2-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, michael@free-electrons.com


* Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> arch/x86/kernel/cpu/intel.c defines a few fallback functions
> (cmpxchg_*()) that are used when the CPU doesn't support cmpxchg
> and/or cmpxchg64 natively. However, while defined in an Intel-specific
> file, these functions are also used for CPUs from other vendors when
> they don't support cmpxchg and/or cmpxchg64. This breaks the
> compilation when support for Intel CPUs is disabled.
> 
> This patch moves these functions to a new
> arch/x86/kernel/cpu/cmpxchg.c file, unconditionally compiled when
> X86_32 is enabled.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

applied both fixes to tip/x86/cpu, thanks Thomas.

I also flipped it around with the cpu-id reduction patch, so that it 
remains bisectable. The new commit IDs in -tip are:

8bfcb39: x86: make movsl_mask definition non-CPU specific
774400a: x86: move cmpxchg fallbacks to a generic place
8d02c21: x86: configuration options to compile out x86 CPU support code

	Ingo
