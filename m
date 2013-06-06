From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Boot time: Optimize CPU bring up?
Date: Thu, 6 Jun 2013 13:48:30 +0200
Message-ID: <51B0770E.3070601@de.bosch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org
Cc: dirk.behme@gmail.com

Hi,

on a ARMv7 Freescale i.MX6 based system we are looking at optimizing the 
kernel boot time. Booting a 3.5.7 kernel with SMP=y and the kernel 
option 'nosmp' (the i.MX6 has single, dual and quad CPU versions) we get


[    0.255927] hw perfevents: enabled with ARMv7 Cortex-A9 PMU driver, 7 
counters available
[    0.256033] Setting up static identity map for 0x10426a28 - 0x10426a80
[    0.260204] initcall spawn_ksoftirqd+0x0/0x58 returned 0 after 9765 usecs
[    0.270363] initcall init_workqueues+0x0/0x39c returned 0 after 9765 
usecs
[    0.290265] initcall cpu_stop_init+0x0/0xd0 returned 0 after 19531 usecs
[    0.310449] initcall rcu_spawn_kthreads+0x0/0xc0 returned 0 after 
19531 usecs
[    0.310699] Brought up 1 CPUs
[    0.310712] SMP: Total of 1 processors activated (1581.05 BogoMIPS).


I.e. ~55ms just for bringing up the 1 CPU.

Looking into some details, e.g. cpu_stop_init(), the ~19531 usecs are 
there because the system 'hangs' 2 jiffies (CONFIG_HZ=100) in 
cpu_v7_do_idle().

For testing purposes switching to CONFIG_HZ=1000 reduces above 54ms to 
just ~4ms. But we are unsure to switch the whole system to 
CONFIG_HZ=1000 just to optimize this part of the boot process.

Does anybody know why all the above parts are idling for some jiffies? 
Is there any other optimization than CONFIG_HZ=1000 possible?

In case there are any patches floating around or this was already 
discussed, any link would be nice.

Many thanks and best regards

Dirk
