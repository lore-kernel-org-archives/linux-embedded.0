From: Scott Wood <scottwood@freescale.com>
Subject: Re: Timer interrupt on Linux 3.0.3
Date: Wed, 21 Sep 2011 14:41:33 -0500
Message-ID: <4E7A3DED.9030402@freescale.com>
References: <CAFbQSaD-c=QqSsq__VtBEcMCJabnBi4AP4KunDNV7u7xXAuaTw@mail.gmail.com> <4E73816C.6000304@freescale.com> <CAFbQSaBcdLCoVY471mVLAyM=eYDSN77=DODPasMaAEm6pRm7jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CAFbQSaBcdLCoVY471mVLAyM=eYDSN77=DODPasMaAEm6pRm7jQ@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vineeth <vneethv@gmail.com>
Cc: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On 09/21/2011 01:56 AM, Vineeth wrote:
>>> What was the issue?  You really should try to make this work rather than
>>> hack around it.
> 
> what we found was the decrementer is not generating an exception when it
> becomes 0. and the timebase registers are not getting incremented too.

Does the decrementer actually tick until it reaches zero, or do it and
the timebase never tick?

Is the TBEN input to the CPU asserted?

-Scott
