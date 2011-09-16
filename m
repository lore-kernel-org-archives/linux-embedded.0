From: Scott Wood <scottwood@freescale.com>
Subject: Re: Timer interrupt on Linux 3.0.3
Date: Fri, 16 Sep 2011 12:03:40 -0500
Message-ID: <4E73816C.6000304@freescale.com>
References: <CAFbQSaD-c=QqSsq__VtBEcMCJabnBi4AP4KunDNV7u7xXAuaTw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CAFbQSaD-c=QqSsq__VtBEcMCJabnBi4AP4KunDNV7u7xXAuaTw@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vineeth <vneethv@gmail.com>
Cc: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On 09/16/2011 06:43 AM, Vineeth wrote:
> Hi,
> 
> We are porting Linux on MPC7410 based board. As there was some issue
> with the processor DECrementer and timebase registers,

What was the issue?  You really should try to make this work rather than
hack around it.

> lately we moved to Linux 3.0.3. What we found was even without a proper
> timer, the kernel with initramfs worked (except the calls like
> sleep,delay ofcourse); Is there any major difference in the scheduler ?
> or the way context switch happens ? is it not depended on the timer
> interrupt or the timer ??

If your timer is broken then you won't get timeslice expiration, but
basic scheduling should still work.  Most scheduling (depending on type
of load, of course) will be triggered by processes blocking or being
woken up by I/O, not timeslice expiration.

-Scott
