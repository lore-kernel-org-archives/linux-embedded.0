From: Manuel Reimer <Manuel.Spam@nurfuerspam.de>
Subject: Re: "make oldconfig" kills config options when cross compiling
Date: Sat, 24 May 2014 21:13:53 +0200
Message-ID: <llqr1h$sgm$1@ger.gmane.org>
References: <ll2ku7$uu$1@ger.gmane.org> <53754D22.2060108@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <53754D22.2060108@infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

On 05/16/2014 01:26 AM, Randy Dunlap wrote:
> In 3.7 (where that original config file came from), ARCH_MXS did NOT depend on
> ARCH_MULTI_V5.  Somewhere between 3.7 and 3.14, someone decided that ARCH_MXS should
> depend on ARCH_MULTI_V5.  You can probably enable that kconfig option and then
> enable ARCH_MXS.

I had to add the following to my config:

CONFIG_ARCH_MULTI_V5=y
CONFIG_ARCH_MULTI_V6_V7=n
CONFIG_ARCH_MULTI_V7=n

With these three lines "make oldconfig" seemed to no longer kill 
important config entries.

"make uImage" failed. I got asked to specify a "LOADADDR" so I created 
my image like this:

LOADADDR=0x40008000 make uImage

But the resulting kernel fails to boot. The error message makes sense. 
Maybe a bug in imx23.dtsi? In fact the serial port "duart: 
serial@80070000" does not have a "dma-names" property:

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/imx23.dtsi#n496

But is this a blocker and can cause the kernel boot to stop?

Boot log follows:

U-Boot 2013.10 (Jan 08 2014 - 14:49:21) Arch Linux ARM

CPU:   Freescale i.MX23 rev1.4 at 454 MHz
BOOT:  SSP SD/MMC #0
DRAM:  64 MiB
MMC:   MXS MMC: 0
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  0
mmc0 is current device
SD/MMC found on device 0
170 bytes read in 101 ms (1000 Bytes/s)
Importing environment from mmc (uEnv.txt)...
Checking if uenvcmd is set ...
Running loaduimage ...
2542832 bytes read in 848 ms (2.9 MiB/s)
9888 bytes read in 124 ms (77.1 KiB/s)
Booting from mmc ...
## Booting kernel from Legacy Image at 42000000 ...
    Image Name:   Linux-3.14.4-9-ARCH
    Image Type:   ARM Linux Kernel Image (uncompressed)
    Data Size:    2542768 Bytes = 2.4 MiB
    Load Address: 40008000
    Entry Point:  40008000
    Verifying Checksum ... OK
## Flattened Device Tree blob at 41000000
    Booting using the fdt blob at 0x41000000
    Loading Kernel Image ... OK
    Loading Device Tree to 43b63000, end 43b6869f ... OK

Starting kernel ...

[    0.000000] of_irq_init: children remain, but no parents
[    1.970000] of_dma_request_slave_channel: dma-names property of node 
'/apb@80000000/apbx@80040000/serial@80070000' missing or empty

