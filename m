From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: UIO - interrupt performance
Date: Mon, 20 Oct 2008 11:25:40 -0500
Message-ID: <48FCB104.7040901@billgatliff.com>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com> <20081020144858.1f074d7b@surf>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081020144858.1f074d7b@surf>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-embedded@vger.kernel.org

Thomas Petazzoni wrote:
> 
> There was a presentation on UIO in embedded systems at the latest
> Embedded Linux Conference in April. The presentation includes a small
> analysis of UIO's overhead with regard to interrupt latency. See
> http://www.celinux.org/elc08_presentations/uio080417celfelc08.pdf

Bummer, on p. 20 it doesn't describe how the latency was measured.  It also
doesn't compare in-kernel measurements with equivalent UIO measurements.

I don't particularly care what the interrupt latency is, if what is being
measured is the time between when the interrupt is signaled to the CPU and the
point at which the request_irq()-registered handler runs.

Rather, most of the time I care more about how long it takes the kernel to wake
up the process that's blocked in a wait_for_completion(), because I do most of
my work outside of interrupt handlers (a characteristic of the devices and
workloads I deal with, ymmv).  In that case, the difference between in-kernel
and UIO gets pretty small because the kernel activities at each interrupt are
very similar, perhaps differing only by some cache activity.

Glad they mention SCHED_[FIFO|RR], though.  Without those, you're in for a
pretty unpleasant UIO experience.



b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
