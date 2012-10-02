From: herve bourricaud <herve.bourricaud@iaca-electronique.com>
Subject: no console prompt after booting kernel
Date: Tue, 2 Oct 2012 15:00:47 +0000 (UTC)
Message-ID: <loom.20121002T164911-342@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

hello,

I'am new to linux and try to add a new board based on AT91SAM9263 cpu on a linux 
kernel (last stable version 3.5.4-rc5

I' compiled at91loader and u-boot 2012-07
adding a new board IACA_122101 with MACH_ID 4173

I clone last stable kernel
and start adding a new board IACA_122101
(design is based on an EMBEST sam6300i forthose who know this boards...)
kernel compile OK 

I clone buildroot 2012 in order to generate the rootfs
for my kernel ! I add a new board IACA_122101 
all seems ok for me...

my problem is that after booting
the system do not prompt for the login 
it just echo back the key I send using my terminal !

here are my inittab and a copy of my console output !
hope someone can help !



////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////
# /etc/inittab
#
# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
#
# Note: BusyBox init doesn't support runlevels.  The runlevels field is
# completely ignored by BusyBox init. If you want runlevels, use
# sysvinit.
#
# Format for each entry: <id>:<runlevels>:<action>:<process>
#
# id        == tty to run on, or empty for /dev/console
# runlevels == ignored
# action    == one of sysinit, respawn, askfirst, wait, and once
# process   == program to run

# Startup the system
null::sysinit:/bin/mount -t proc proc /proc
null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
null::sysinit:/bin/mkdir -p /dev/pts
null::sysinit:/bin/mkdir -p /dev/shm
null::sysinit:/bin/mount -a
null::sysinit:/bin/hostname -F /etc/hostname
# now run any rc scripts
::sysinit:/etc/init.d/rcS

# Put a getty on the serial port
ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

# Stuff to do for the 3-finger salute
::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
null::shutdown:/etc/init.d/rcK
null::shutdown:/bin/umount -a -r
null::shutdown:/sbin/swapoff -a

////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////
IACA U-Boot> boot

NAND read: device 0 offset 0x1a0000, size 0x400000
 4194304 bytes read: OK
## Current stack ends at 0x23eb36f8 *  kernel: default image load address = 
0x22000000
## Booting kernel from Legacy Image at 22000000 ...
   Image Name:   LINUX-3.6.0-rc5
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2425224 Bytes = 2.3 MiB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   kernel data at 0x22000040, len = 0x00250188 (2425224)
## No init Ramdisk
   ramdisk start = 0x00000000, ramdisk end = 0x00000000
   Loading Kernel Image ... OK
OK
   kernel loaded at 0x20008000, end = 0x20258188
using: ATAGS
## Transferring control to Linux (at address 20008000)...

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0
[    0.000000] Linux version 3.6.0-rc5-00003-g4bebd05-dirty (iaca@linux1) (gcc 
version 4.5.2 (Sourcery G++ Lite 2011.03-41) ) #27 Tue Oct 2 15:44:50 CEST 2012
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: IACA 122101
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] AT91: Detected soc type: at91sam9263
[    0.000000] AT91: Detected soc subtype: Unknown
[    0.000000] AT91: sram at 0x300000 of 0x14000 mapped at 0xfef64000
[    0.000000] AT91: sram at 0x500000 of 0x4000 mapped at 0xfef60000
[    0.000000] Clocks: CPU 198 MHz, master 99 MHz, main 18.432 MHz
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total 
pages: 16256
[    0.000000] Kernel command line: console=ttyS0,115200 root=ubi0:rootfs 
ubi.mtd=6 rootfstype=ubifs
[    0.000000] PID hash table entries: 256 (order: -2, 1024 bytes)
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Memory: 64MB = 64MB total
[    0.000000] Memory: 60808k/60808k available, 4728k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xc4800000 - 0xff000000   ( 936 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
[    0.000000]       .text : 0xc0008000 - 0xc03a77a0   (3710 kB)
[    0.000000]       .init : 0xc03a8000 - 0xc03c7068   ( 125 kB)
[    0.000000]       .data : 0xc03c8000 - 0xc03f1080   ( 165 kB)
[    0.000000]        .bss : 0xc03f10a4 - 0xc04058a8   (  83 kB)
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] AT91: 160 gpio irqs in 5 banks
[    0.000000] sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps 
every 4294967286ms
[    0.000000] Console: colour dummy device 80x30
[    0.090000] Calibrating delay loop... 98.71 BogoMIPS (lpj=493568)
[    0.090000] pid_max: default: 32768 minimum: 301
[    0.090000] Mount-cache hash table entries: 512
[    0.090000] CPU: Testing write buffer coherency: ok
[    0.090000] Setting up static identity map for 0x20302ba0 - 0x20302bf8
[    0.100000] NET: Registered protocol family 16
[    0.100000] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.110000] Console: colour dummy device 80x30
[    0.120000] AT91: Power Management
[    0.120000] AT91: Starting after user reset
[    0.180000] usbcore: registered new interface driver usbfs
[    0.180000] usbcore: registered new interface driver hub
[    0.180000] usbcore: registered new device driver usb
[    0.190000] Switching to clocksource tcb_clksrc
[    0.260000] NET: Registered protocol family 2
[    0.260000] TCP established hash table entries: 2048 (order: 2, 16384 bytes)
[    0.260000] TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
[    0.260000] TCP: Hash tables configured (established 2048 bind 2048)
[    0.260000] TCP: reno registered
[    0.260000] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.260000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.260000] NET: Registered protocol family 1
[    0.260000] RPC: Registered named UNIX socket transport module.
[    0.260000] RPC: Registered udp transport module.
[    0.260000] RPC: Registered tcp transport module.
[    0.260000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.270000] NFS: Registering the id_resolver key type
[    0.270000] Key type id_resolver registered
[    0.270000] Key type id_legacy registered
[    0.270000] msgmni has been set to 118
[    0.280000] atmel_lcdfb atmel_lcdfb.0: 255KiB frame buffer at 23940000 
(mapped at c484d000)
[    0.340000] Console: switching to colour frame buffer device 60x34
[    0.360000] atmel_lcdfb atmel_lcdfb.0: fb0: Atmel LCDC at 0x00700000 (mapped 
at c4846000), irq 42
[    0.380000] atmel_usart.0: ttyS0 at MMIO 0xffffee00 (irq = 17) is a 
ATMEL_SERIAL
[    0.700000] console [ttyS0] enabled
[    0.740000] atmel_nand: Use On Flash BBT
[    0.740000] atmel_nand atmel_nand: No DMA support for NAND access.
[    0.750000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND 
128MiB 3,3V 8-bit), page size: 2048, OOB size: 64
[    0.760000] Bad block table found at page 65472, version 0x01
[    0.770000] Bad block table found at page 65408, version 0x01
[    0.770000] Creating 7 MTD partitions on "atmel_nand":
[    0.780000] 0x000000000000-0x000000020000 : "AT91Bootstrap"
[    0.790000] 0x000000020000-0x000000060000 : "U-Boot"
[    0.800000] 0x000000060000-0x000000080000 : "U-Boot Env 1"
[    0.810000] 0x000000080000-0x0000000a0000 : "U-Boot Env 2"
[    0.820000] 0x0000000a0000-0x0000001a0000 : "Logo"
[    0.830000] 0x0000001a0000-0x0000005a0000 : "Kernel"
[    0.840000] 0x0000005a0000-0x0000045a0000 : "Rootfs"
[    0.850000] UBI: attaching mtd6 to ubi0
[    0.850000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    0.860000] UBI: logical eraseblock size:    129024 bytes
[    0.870000] UBI: smallest flash I/O unit:    2048
[    0.870000] UBI: sub-page size:              512
[    0.880000] UBI: VID header offset:          512 (aligned 512)
[    0.880000] UBI: data offset:                2048
[    1.000000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
[    1.010000] UBI: max. sequence number:       92
[    1.030000] UBI: attached mtd6 to ubi0
[    1.030000] UBI: MTD device name:            "Rootfs"
[    1.040000] UBI: MTD device size:            64 MiB
[    1.040000] UBI: number of good PEBs:        512
[    1.050000] UBI: number of bad PEBs:         0
[    1.050000] UBI: number of corrupted PEBs:   0
[    1.060000] UBI: max. allowed volumes:       128
[    1.060000] UBI: wear-leveling threshold:    4096
[    1.070000] UBI: number of internal volumes: 1
[    1.070000] UBI: number of user volumes:     1
[    1.080000] UBI: available PEBs:             0
[    1.080000] UBI: total number of reserved PEBs: 512
[    1.090000] UBI: number of PEBs reserved for bad PEB handling: 10
[    1.090000] UBI: max/mean erase counter: 2/0
[    1.100000] UBI: image sequence number:  2141504005
[    1.100000] UBI: background thread "ubi_bgt0d" started, PID 275
[    1.140000] libphy: MACB_mii_bus: probed
[    1.140000] macb macb: eth0: Cadence MACB at 0xfffbc000 irq 37 
(de:ad:be:ef:01:01)
[    1.150000] macb macb: eth0: attached PHY driver [Davicom DM9161A] 
(mii_bus:phy_addr=macb-ffffffff:00, irq=-1)
[    1.160000] PPP generic driver version 2.4.2
[    1.170000] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.180000] at91_ohci at91_ohci: can't request overcurrent gpio 0
[    1.180000] at91_ohci at91_ohci: can't request overcurrent gpio 0
[    1.190000] at91_ohci at91_ohci: can't request overcurrent gpio 0
[    1.200000] at91_ohci at91_ohci: AT91 OHCI
[    1.210000] at91_ohci at91_ohci: new USB bus registered, assigned bus number 
1
[    1.210000] at91_ohci at91_ohci: irq 45, io mem 0x00a00000
[    1.290000] hub 1-0:1.0: USB hub found
[    1.290000] hub 1-0:1.0: 2 ports detected
[    1.300000] usbcore: registered new interface driver usbserial
[    1.310000] usbcore: registered new interface driver usbserial_generic
[    1.320000] USB Serial support registered for generic
[    1.320000] usbserial: USB Serial Driver core
[    1.330000] usbcore: registered new interface driver ftdi_sio
[    1.330000] USB Serial support registered for FTDI USB Serial Device
[    1.340000] ftdi_sio: v1.6.0:USB FTDI Serial Converters Driver
[    1.350000] usbcore: registered new interface driver pl2303
[    1.360000] USB Serial support registered for pl2303
[    1.360000] mousedev: PS/2 mouse device common for all mice
[    1.370000] rtc-at91sam9 rtc-at91sam9.0: rtc core: registered rtc-at91sam9 as 
rtc0
[    1.380000] rtc-at91sam9 rtc-at91sam9.0: rtc0: SET TIME!
[    1.390000] at91sam9_wdt: sorry, watchdog is disabled
[    1.390000] at91_wdt: probe of at91_wdt failed with error -5
[    1.410000] usbcore: registered new interface driver usbhid
[    1.420000] usbhid: USB HID core driver
[    1.430000] IPv4 over IPv4 tunneling driver
[    1.440000] TCP: cubic registered
[    1.440000] NET: Registered protocol family 10
[    1.450000] sit: IPv6 over IPv4 tunneling driver
[    1.460000] NET: Registered protocol family 17
[    1.470000] NET: Registered protocol family 15
[    1.470000] Key type dns_resolver registered
[    1.490000] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    1.500000] rtc-at91sam9 rtc-at91sam9.0: hctosys: unable to read the hardware 
clock
[    1.580000] UBIFS: recovery needed
[    1.900000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
[    1.910000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
[    1.920000] UBIFS: recovery completed
[    1.920000] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[    1.930000] UBIFS: file system size:   62834688 bytes (61362 KiB, 59 MiB, 487 
LEBs)
[    1.940000] UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 
LEBs)
[    1.940000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    1.950000] UBIFS: default compressor: none
[    1.950000] UBIFS: reserved for root:  0 bytes (0 KiB)
[    1.960000] VFS: Mounted root (ubifs filesystem) on device 0:8.
[    1.970000] Freeing init memory: 124K
Starting logging: OK
Starting mdev...
[    3.040000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
[    3.320000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
Starting network...
Generating RSA Key...
[    4.530000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
PRNG is not seeded
Generating RSA Key...
[    4.680000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
[    4.690000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
PRNG is not seeded
Generating DSA Key...
THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!

[    4.770000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
PRNG is not seeded
Generating ECDSA Key...
THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!

PRNG is not seeded
Starting sshd: [    4.920000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
PRNG is not seeded
OK
[   17.040000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10
[   27.040000] atmel_lcdfb atmel_lcdfb.0: FIFO underflow 0x10

	

