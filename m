From: Nick Gifford <nick.gifford@ingenu.com>
Subject: mounting squashfs as initrd from RAM
Date: Tue, 12 Apr 2016 21:42:05 +0000
Message-ID: <20FFB90893A2AB4492D9DFB3B61CC8C403A15778@MBX028-W1-CA-4.exch028.domain.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

I have a squashfs filesystem that I want to mount as initrd.  I don't want to use initramfs since the squashfs compresses better.  I'm ok with the wasted RAM since our system is much more constrained by flash space than RAM.

I want to mount it from RAM so that the flash partition can be safely written/upgraded while linux is running with the RAM copy mounted.

Eventually, I want the linux kernel and the initrd to each have their own partition (for upgradeability), but right now I'm just copying them directly into RAM from u-boot and passing the initrd RAM address as the second arg to bootm.  Below is my u-boot environment and console log.

Any help on why I'd be seeing the unhandled paging request?  I added the "DEBUG: phys to virt addr 3e7f9000 --> fe7f9000" where it looks like 0xfe7f9000 is being mapped for the initrd in arch/arm/mm/init.c.

nick



U-Boot 2014.07 (Apr 08 2016 - 09:31:37)

I2C:   ready
DRAM:  ECC disabled 1020 MiB
MMC:   zynq_sdhci: 0
SF: Detected S25FL512S_256K with page size 512 Bytes, erase size 256 KiB, total 128 MiB
In:    serial
Out:   serial
Err:   serial

ENET MAC Address found in EEPROM - env setting for macaddr overridden
Net:   Gem.e000b000
Hit any key to stop autoboot:  0 
U-Boot-PetaLinux> printenv
autoload=no
baudrate=115200
boot_img=BOOT.BIN
bootcmd=run default_bootcmd
bootdelay=4
bootenvsize=0x40000
bootenvstart=0x700000
bootsize=0x700000
bootstart=0x0
clobstart=0x08000000
console=console=ttyPS0,115200
cp_kernel2ram=sf probe 0 && sf read ${netstart} ${kernelstart} ${kernelsize}
default_bootcmd=run cp_kernel2ram && bootm ${netstart}
dtbnetstart=0x09800000
eraseenv=sf probe 0 && sf erase ${bootenvstart} ${bootenvsize}
ethact=Gem.e000b000
ethaddr=00:25:0f:03:06:8a
fault=echo ${img} image size is greater than allocated place - partition ${img} is NOT UPDATED
fileaddr=8000000
filesize=3c4444
gatewayip=10.50.4.1
hostname=pliny
initrd_high=0x0
install_boot=sf probe 0 && sf erase ${bootstart} ${bootsize} && sf write ${clobstart} ${bootstart} ${filesize}
install_jffs2=sf probe 0 && sf erase ${jffs2start} ${jffs2size} && sf write ${clobstart} ${jffs2start} ${filesize}
install_kernel=sf probe 0 && sf erase ${kernelstart} ${kernelsize} && sf write ${clobstart} ${kernelstart} ${filesize}
install_orwsquashfs=sf probe 0 && sf erase ${orwsquashfsstart} ${orwsquashfssize} && sf write ${clobstart} ${orwsquashfsstart} ${filesize}
install_squashfs=sf probe 0 && sf erase ${squashfsstart} ${squashfssize} && sf write ${clobstart} ${squashfsstart} ${filesize}
ipaddr=10.50.6.251
jffs2_img=rootfs.jffs2
kernel_img=image.ub
kernelsize=0x800000
kernelstart=0x800000
load_boot=tftp ${clobstart} ${boot_img}
load_jffs2=tftp ${clobstart} ${jffs2_img}
load_kernel=tftp ${clobstart} ${kernel_img}
load_orwsquashfs=tftp ${clobstart} ${orwsquashfs_img}
load_squashfs=tftp ${clobstart} ${squashfs_img}
loadaddr=0x08000000
nc=setenv stdout nc;setenv stdin nc;
netboot=tftp ${netstart} ${kernel_img} && bootm
netmask=255.255.252.0
netstart=0x08000000
orw_data_size=0x2000000
orw_data_start=0x6000000
orw_full_reset=run orw_updateall && run orw_nuke_data
orw_logs_size=0xe00000
orw_logs_start=0x3200000
orw_nuke_data=sf probe 0 && sf erase ${orw_reserved_start} ${orw_reserved_size} && sf erase ${orw_rootfs_data_start} ${orw_rootfs_data_size} && sf erase ${orw_logs_start} ${orw_logs_size} && sf erase ${orw_data_start} ${orw_d}
orw_reserved_size=0xc0000
orw_reserved_start=0x740000
orw_rootfs_data_size=0x200000
orw_rootfs_data_start=0x3000000
orw_sd_full_reset=run orw_sd_updateall && run orw_nuke_data
orw_sd_updateall=run sd_update_boot && run sd_update_squashfs && run sd_update_kernel && run sd_update_orwsquashfs
orw_updateall=run update_boot && run update_squashfs && run update_kernel && run update_orwsquashfs
orwsquashfs_img=orw.squashfs
orwsquashfssize=0x2000000
orwsquashfsstart=0x4000000
psserial0=setenv stdout ttyPS0;setenv stdin ttyPS0
sd_update_boot=echo Updating boot from SD; mmcinfo && fatload mmc 0:1 ${clobstart} ${boot_img} && run install_boot
sd_update_jffs2=echo Updating jffs2 from SD; mmcinfo && fatload mmc 0:1 ${clobstart} ${jffs2_img} && run install_jffs2
sd_update_kernel=echo Updating kernel from SD; mmcinfo && fatload mmc 0:1 ${clobstart} ${kernel_img} && run install_kernel
sd_update_orwsquashfs=echo Updating orwsquashfs from SD; mmcinfo && fatload mmc 0:1 ${clobstart} ${orwsquashfs_img} && run install_orwsquashfs
sd_update_squashfs=echo Updating squashfs from SD; mmcinfo && fatload mmc 0:1 ${clobstart} ${squashfs_img} && run install_squashfs
sdboot=echo boot Petalinux; mmcinfo && fatload mmc 0 ${netstart} ${kernel_img} && bootm 
serial=setenv stdout serial;setenv stdin serial
serverip=10.50.4.82
squashfs_img=urootfs.squashfs
squashfssize=0x2000000
squashfsstart=0x1000000
test_boot=tftp 0x08000000 image.ub && tftp 0x01000000 urootfs.squashfs && bootm 0x08000000 0x01000000
test_crc=if imi ${clobstart}; then run test_img; else echo ${img} Bad CRC - ${img} is NOT UPDATED; fi
test_img=setenv var "if test ${filesize} -gt ${psize}; then run fault; else run ${installcmd}; fi"; run var; setenv var
update_boot=setenv img boot; setenv psize ${bootsize}; setenv installcmd "install_boot"; run load_boot test_img; setenv img; setenv psize; setenv installcmd
update_jffs2=setenv img jffs2; setenv psize ${jffs2size}; setenv installcmd "install_jffs2"; run load_jffs2 test_img; setenv img; setenv psize; setenv installcmd
update_kernel=setenv img kernel; setenv psize ${kernelsize}; setenv installcmd "install_kernel"; run load_kernel test_crc; setenv img; setenv psize; setenv installcmd
update_orwsquashfs=setenv img orwsquashfs; setenv psize ${orwsquashfssize}; setenv installcmd "install_orwsquashfs"; run load_orwsquashfs test_img; setenv img; setenv psize; setenv installcmd
update_squashfs=setenv img squashfs; setenv psize ${squashfssize}; setenv installcmd "install_squashfs"; run load_squashfs test_img; setenv img; setenv psize; setenv installcmd

Environment size: 4856/262140 bytes
U-Boot-PetaLinux> run test_boot
Gem.e000b000 Waiting for PHY auto negotiation to complete.... done
Using Gem.e000b000 device
TFTP from server 10.50.4.82; our IP address is 10.50.6.251
Filename 'image.ub'.
Load address: 0x8000000
Loading: T #################################################################
         #################################################################
         #################################################################
         #################################################################
         ##########
         672.9 KiB/s
done
Bytes transferred = 3949444 (3c4384 hex)
Gem.e000b000:1 is connected to Gem.e000b000.  Reconnecting to Gem.e000b000
Gem.e000b000 Waiting for PHY auto negotiation to complete... done
Using Gem.e000b000 device
TFTP from server 10.50.4.82; our IP address is 10.50.6.251
Filename 'urootfs.squashfs'.
Load address: 0x1000000
Loading: T #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ################################################
         1.9 MiB/s
done
Bytes transferred = 15958080 (f38040 hex)
## Loading kernel from FIT Image at 08000000 ...
   Using 'conf@1' configuration
   Trying 'kernel@1' kernel subimage
     Description:  PetaLinux Kernel
     Type:         Kernel Image
     Compression:  gzip compressed
     Data Start:   0x080000f0
     Data Size:    3930908 Bytes = 3.7 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x00008000
     Entry Point:  0x00008000
     Hash algo:    crc32
     Hash value:   5ac4c408
   Verifying Hash Integrity ... crc32+ OK
## Loading init Ramdisk from Legacy Image at 01000000 ...
   Image Name:   
   Image Type:   ARM Linux RAMDisk Image (gzip compressed)
   Data Size:    15958016 Bytes = 15.2 MiB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
## Loading fdt from FIT Image at 08000000 ...
   Using 'conf@1' configuration
   Trying 'fdt@1' fdt subimage
     Description:  Flattened Device Tree blob
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x083bfcf0
     Data Size:    17240 Bytes = 16.8 KiB
     Architecture: ARM
     Hash algo:    crc32
     Hash value:   348735df
   Verifying Hash Integrity ... crc32+ OK
   Booting using the fdt blob at 0x83bfcf0
   Uncompressing Kernel Image ... OK
   Loading Ramdisk to 3e7f9000, end 3f731000 ... OK
   Loading Device Tree to 07ff8000, end 07fff357 ... OK

Starting kernel ...

Booting Linux on physical CPU 0x0
Linux version 3.17.0-xilinx-svn96060 (ngifford@localhost.localdomain) (gcc version 4.8.3 20140320 (prerelease) (Sourcery CodeBench Lite 2014.05-23) ) #29 SMP PREEMPT Tue Apr 12 14:20:58 PDT 2016
CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=18c5387d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
Machine model: pliny
bootconsole [earlycon0] enabled
DEBUG: phys to virt addr 3e7f9000 --> fe7f9000
Memory policy: Data cache writealloc
PERCPU: Embedded 8 pages/cpu @eefd2000 s10368 r8192 d14208 u32768
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 259600
Kernel command line: console=ttyPS1,115200 earlyprintk root=/dev/ram0 rootfstype=squashfs rw
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 1003644K/1044480K available (5328K kernel code, 344K rwdata, 1916K rodata, 234K init, 8212K bss, 40836K reserved, 250656K highmem)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
    vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
    lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
    pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
    modules : 0xbf000000 - 0xbfe00000   (  14 MB)
      .text : 0xc0008000 - 0xc071b584   (7246 kB)
      .init : 0xc071c000 - 0xc0756880   ( 235 kB)
      .data : 0xc0758000 - 0xc07ae0b8   ( 345 kB)
       .bss : 0xc07ae0b8 - 0xc0fb33b8   (8213 kB)
Preemptible hierarchical RCU implementation.
        RCU lockdep checking is enabled.
        Dump stacks of tasks blocking RCU-preempt GP.
        RCU restricting CPUs from NR_CPUS=4 to nr_cpu_ids=2.
RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
NR_IRQS:16 nr_irqs:16 16
L2C: platform provided aux values match the hardware, so have no effect.  Please remove them.
L2C-310 erratum 769419 enabled
L2C-310 enabling early BRESP for Cortex-A9
L2C-310 full line of zeros enabled for Cortex-A9
L2C-310 ID prefetch enabled, offset 1 lines
L2C-310 dynamic clock gating enabled, standby mode enabled
L2C-310 cache controller enabled, 8 ways, 512 kB
L2C-310: CACHE_ID 0x410000c8, AUX_CTRL 0x76360001
slcr mapped to f0006000
zynq_clock_init: clkc starts at f0006100
Zynq clock init
sched_clock: 64 bits at 333MHz, resolution 3ns, wraps every 3298534883328ns
timer #0 at f0008000, irq=43
Console: colour dummy device 80x30
Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
... MAX_LOCKDEP_SUBCLASSES:  8
... MAX_LOCK_DEPTH:          48
... MAX_LOCKDEP_KEYS:        8191
... CLASSHASH_SIZE:          4096
... MAX_LOCKDEP_ENTRIES:     32768
... MAX_LOCKDEP_CHAINS:      65536
... CHAINHASH_SIZE:          32768
 memory used by lock dependency info: 5167 kB
 per task-struct memory footprint: 1152 bytes
Calibrating delay loop... 1325.46 BogoMIPS (lpj=6627328)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
CPU: Testing write buffer coherency: ok
CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
Setting up static identity map for 0x50eaf0 - 0x50eb48
CPU1: Booted secondary processor
CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
Brought up 2 CPUs
SMP: Total of 2 processors activated.
CPU: All CPU(s) started in SVC mode.
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 4
regulator-dummy: no parameters
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
cpuidle: using governor menu
hw-breakpoint: found 5 (+1 reserved) breakpoint and 1 watchpoint registers.
hw-breakpoint: maximum watchpoint size is 4 bytes.
zynq-ocm f800c000.ocmc: ZYNQ OCM pool: 256 KiB @ 0xf0080000
VCCPINT: 1000 mV 
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
EDAC MC: Ver: 3.0.0
DMA-API: preallocated 4096 debug entries
DMA-API: debugging enabled by kernel config
Switched to clocksource arm_global_timer
NET: Registered protocol family 2
TCP established hash table entries: 8192 (order: 3, 32768 bytes)
TCP bind hash table entries: 8192 (order: 6, 294912 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP: reno registered
UDP hash table entries: 512 (order: 3, 40960 bytes)
UDP-Lite hash table entries: 512 (order: 3, 40960 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
DEBUG unpack_to_rootfs buf=[c0753a38], len=133
Trying to unpack rootfs image as initramfs...
DEBUG unpack_to_rootfs buf=[fe7f9000], len=15958016
Unable to handle kernel paging request at virtual address fe7f9000
pgd = c0004000
[fe7f9000] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 3.17.0-xilinx-svn96060 #29
task: ee857440 ti: ee858000 task.ti: ee858000
PC is at unpack_to_rootfs+0xb4/0x2c0
LR is at unpack_to_rootfs+0xa0/0x2c0
pc : [<c071e3ac>]    lr : [<c071e398>]    psr: 20000113
sp : ee859e40  ip : 00000001  fp : 00000000
r10: 00000000  r9 : c07ae10c  r8 : c07ae110
r7 : c074ad68  r6 : fe7f9000  r5 : 00f38000  r4 : c074ad68
r3 : ee857440  r2 : 00000000  r1 : 00000000  r0 : 00000033
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 18c5387d  Table: 0000404a  DAC: 00000015
Process swapper/0 (pid: 1, stack limit = 0xee858240)
Stack: (0xee859e40 to 0xee85a000)
9e40: 00000000 c0763ce0 c07ae0c0 c07ae110 c07ae10c ee858038 00000000 c0506cb0
9e60: c0630f16 c07ae110 00000000 c0763ce0 c07ae0c0 c07ae110 c07ae10c ee858038
9e80: 00000000 c071eb94 c071eb38 c0059cb0 ff0a0005 ffffffff 000000d0 ee859ef0
9ea0: c063e56e 00000010 eea69480 c071eb38 ee857440 ee858008 00000001 c00d8268
9ec0: c071eb38 c0059cb0 ee88ac00 eea69480 a0000113 eea69480 c0763ce0 c0763ce0
9ee0: c07ae0c0 c071eb38 000000b0 ee858038 00000000 c0008990 00000001 00000080
9f00: ee8578c8 00000000 ee857400 00000006 00000007 c06ee208 00000000 ef7fcdc5
9f20: 00000000 c003f144 00000001 c050e01c c07ae0c0 c06ee208 c06ed708 000000b0
9f40: 00000005 00000005 c076bd24 00000005 c074acd8 c07536c8 c07ae0c0 c07ae0c0
9f60: 000000b0 c074ace8 00000000 c071ccec 00000005 00000005 c071c51c efff77ff
9f80: ff3f2fbe eefd4080 00000000 c0503d48 00000000 00000000 00000000 00000000
9fa0: 00000000 c0503d50 00000000 c000e868 00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 dfd77fbf fcfb8faf
[<c071e3ac>] (unpack_to_rootfs) from [<c071eb94>] (populate_rootfs+0x5c/0x248)
[<c071eb94>] (populate_rootfs) from [<c0008990>] (do_one_initcall+0x110/0x1c0)
[<c0008990>] (do_one_initcall) from [<c071ccec>] (kernel_init_freeable+0x10c/0x1d0)
[<c071ccec>] (kernel_init_freeable) from [<c0503d50>] (kernel_init+0x8/0xe4)
[<c0503d50>] (kernel_init) from [<c000e868>] (ret_from_fork+0x14/0x2c)
Code: e3510000 1a000055 e3550000 0a000053 (e5d63000) 
---[ end trace 7ff8bbcb926fd04d ]---
Kernel panic - not syncing: Fatal exception
CPU0: stopping
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D        3.17.0-xilinx-svn96060 #29
[<c0015c54>] (unwind_backtrace) from [<c0011c2c>] (show_stack+0x10/0x14)
[<c0011c2c>] (show_stack) from [<c0508118>] (dump_stack+0x90/0xd4)
[<c0508118>] (dump_stack) from [<c00140a4>] (ipi_cpu_stop+0x3c/0x70)
[<c00140a4>] (ipi_cpu_stop) from [<c00146d4>] (handle_IPI+0x68/0xac)
[<c00146d4>] (handle_IPI) from [<c00085cc>] (gic_handle_irq+0x58/0x60)
[<c00085cc>] (gic_handle_irq) from [<c00126c4>] (__irq_svc+0x44/0x7c)
Exception stack(0xc0759f60 to 0xc0759fa8)
9f60: c000f3e0 00000000 00000000 00000000 00000000 c0758000 c0755288 00000000
9f80: ffffffed c0511294 c0758000 00000000 00000000 c0759fa8 c000f3e0 c000f3e4
9fa0: 60000013 ffffffff
[<c00126c4>] (__irq_svc) from [<c000f3e4>] (arch_cpu_idle+0x30/0x3c)
[<c000f3e4>] (arch_cpu_idle) from [<c00559b0>] (cpu_startup_entry+0xe4/0x210)
[<c00559b0>] (cpu_startup_entry) from [<c071cb78>] (start_kernel+0x34c/0x3b4)
[<c071cb78>] (start_kernel) from [<00008074>] (0x8074)
---[ end Kernel panic - not syncing: Fatal exception


U-Boot 2014.07 (Apr 08 2016 - 09:31:37)

I2C:   ready
DRAM:  ECC disabled 1020 MiB
MMC:   zynq_sdhci: 0
SF: Detected S25FL512S_256K with page size 512 Bytes, erase size 256 KiB, total 128 MiB
In:    serial
Out:   serial
Err:   serial

ENET MAC Address found in EEPROM - env setting for macaddr overridden
Net:   Gem.e000b000
Hit any key to stop autoboot:  0 
U-Boot-PetaLinux> 
