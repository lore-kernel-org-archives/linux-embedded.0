From: Michael Schnell <mschnell@lumino.de>
Subject: Re: AMP on an SMP system
Date: Thu, 08 Aug 2013 09:41:08 +0200
Message-ID: <52034B94.6030809@lumino.de>
References: <51FB6EE1.3090708@lumino.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <51FB6EE1.3090708@lumino.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-embedded@vger.kernel.org

As a r=E9sum=E9 of this discussion I feel that it would be very viable =
to to=20
a commercial or non-commercial project that allows for easy use of a=20
single (or even multiple ) dedicated AMP CPU(s) working together with a=
n=20
SMP Linux system in a multi core ARM Cortex A9 chip.

Here the supplier would need to provide:
  - means to dedicate one (or more) CPU(s) to an AMP system(s)=20
(including setting the AMP Bit to prevent 1st level cache=20
synchronization for this CPU(s), and possibly including a patch for the=
=20
scheduler that performance prevents degradation due to the count of=20
managed CPUs being not identical with those found in hardware)
  - means for communication with the AMP system(s) (i.e. a prototype fo=
r=20
a Kernel driver that allows for bidirectional "message-queue"- / pipe-=20
like communication using a DMA-alike non-cached memory region and mutua=
l=20
interrupts for notification
  - means to load and start a program in an AMP system (supposedly=20
provided by the same Kernel driver). Here supposedly some kind of cache=
=20
flush needs to be done as the cache synchronization is switched off for=
=20
the AMP CPU(s).
  - appropriate documentation (including a definition on how to do the=20
software for the AMP system and including hints on how to calculate the=
=20
max latency)

What do you think ?

-Michael

