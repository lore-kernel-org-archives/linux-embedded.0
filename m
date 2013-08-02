From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: AMP on an SMP system
Date: Fri, 2 Aug 2013 13:42:25 +0200
Message-ID: <20130802114225.GR3880@pengutronix.de>
References: <51FB6EE1.3090708@lumino.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51FB6EE1.3090708@lumino.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schnell <mschnell@lumino.de>
Cc: linux-embedded@vger.kernel.org

On Fri, Aug 02, 2013 at 10:33:37AM +0200, Michael Schnell wrote:
> Is there a kind of "official" way to set aside one of the available
> cores in an SMP system from the Linux OS to do deeply embedded
> extremely-low-latency stuff in a kind of single task "main loop" type
> environment ? I.e. creating a true coprocessor from an SMP hardware.

Before hacking around (which might also lead to interesting solutions),
I would start using a kernel with preempt-rt support and play with the
cpu affinity:

http://lxr.linux.no/#linux+v3.10.4/Documentation/kernel-parameters.txt#L1257

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
