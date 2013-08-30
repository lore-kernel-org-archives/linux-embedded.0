From: Kernux Zhang <kernuxzhang@gmail.com>
Subject: Fwd: kernel 3.0.93 on s3c2410 problome.
Date: Fri, 30 Aug 2013 09:13:06 +0800
Message-ID: <CAB-=yQfF4JsZCB=mMaaG-D7vHvxmGnzyYfaxuP2o0+K9qH+W0g@mail.gmail.com>
References: <CAB-=yQeb8FN++rp6qdNbb_Yhi3zx_9o1gwxvGCeM4AECO8MB+A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=o3baYTWcLa9Uolt8ltLZlSRzld9LIlZqAgwp+PQGB/I=;
        b=jKrY0+HAkIJYa9q/veqcxkA6C2aSwz4SxtQdDpy2nVHGXEZnwb5O9RQlPf0slep0B+
         u3DaggCRXm2bvrOsIQDk6lISZvSRrW4MBd5z0Ps025w2sREr1dmPCu9aAiwppDGDosjO
         6QChtk5LlRrRBjErfwH43of6l8OioPbmfNOwb821Xgk78kQnATHg5+YbgccPlMhG5CAA
         AaszXrGU2zj8LSj3YK+frUPMS8vZ2Q5F0IseBo9uYpg3oMxu1M6wp2o7CbcAbP9SaiI4
         /ijbTt9nhwdVBfMfglL70WJE1DIoINguftlvI5H+m0cDUeSXeZ3Xf7Zw57DRlCAQeVeP
         Fguw==
In-Reply-To: <CAB-=yQeb8FN++rp6qdNbb_Yhi3zx_9o1gwxvGCeM4AECO8MB+A@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

in the download source,I only run : make s3c2410_defconfig ; make
uImage. then get the uImage and I download it in my board to boot.and
I got the follows:

## Booting kernel from Legacy Image at 30800000 ...
   Image Name:   Linux-3.0.93
   Created:      2013-08-29   5:03:32 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2298128 Bytes = 2.2 MiB
   Load Address: 30108000
   Entry Point:  30108000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Linux version 3.0.93 (root@localhost.localdomain) (gcc version 4.7.3
(Sourcery CodeBench Lite 2013.05-24) ) #8 Thu Aug 29 13:03:14 CST 2013
CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=00007177
CPU: VIVT data cache, VIVT instruction cache
Machine: SMDK2410
Memory policy: ECC disabled, Data cache writeback
CPU S3C2410A (id 0x32410002)
S3C24XX Clocks, Copyright 2004 Simtec Electronics
S3C2410: core 202.800 MHz, memory 101.400 MHz, peripheral 50.700 MHz
CLOCK: Slow mode (1.500 MHz), fast, MPLL on, UPLL on
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
Kernel command line: noinitrd root=/dev/mtdblock2 rw console=ttySAC0,115200
PID hash table entries: 256 (order: -2, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 60216k/60216k available, 5320k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
    vmalloc : 0xc4800000 - 0xf6000000   ( 792 MB)
    lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .init : 0xc0108000 - 0xc012f000   ( 156 kB)
      .text : 0xc012f000 - 0xc0543000   (4176 kB)
      .data : 0xc0544000 - 0xc05724a0   ( 186 kB)
       .bss : 0xc05724c4 - 0xc059b1f8   ( 164 kB)
NR_IRQS:99
irq: clearing subpending status 00000002
Console: colour dummy device 80x30
console [ttySAC0] enabled
Calibrating delay loop... 50.17 BogoMIPS (lpj=125440)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
Internal error: Oops - undefined instruction: 0 [#1]
Modules linked in:
CPU: 0    Not tainted  (3.0.93 #8)
PC is at 0xc0545f28
LR is at alloc_inode+0x28/0xac
pc : [<c0545f28>]    lr : [<c01ca9f4>]    psr: 40000053
sp : c0545e88  ip : c0545ea0  fp : c0545e9c
r10: 000002fb  r9 : 41129200  r8 : c0092540
r7 : c009312c  r6 : c0545ea8  r5 : c0545ea8  r4 : 00000000
r3 : c0545ea8  r2 : c3801520  r1 : c009312c  r0 : c0545ea8
Flags: nZcv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment user
Control: 0000717f  Table: 30104000  DAC: 00000015
Process swapper (pid: 0, stack limit = 0xc0544260)
Stack: (0xc0545e88 to 0xc0546000)
5e80:                   00000000 c3801520 c0545ec4 c0545ea0 c01cafb4 c01ca9dc
5ea0: c3801520 c0545ea8 00400000 c0545ea8 c045d1a0 30127880 c0545ee4 c0545ec8
5ec0: c0203d84 c01caf38 c0545ed4 c04541a8 c3801520 c0545ea8 c0545f08 c0545ee8
5ee0: c02067d4 c0203d78 c04ee5f8 c38139e0 c0559ab0 c0559ab0 00000000 c0545f2c
5f00: c0545f0c c01b808c c02066ec 00000000 00400000 c04ee5f8 c38139e0 00400000
5f20: c0545f50 c0545f30 c01cdd54 c01b8080 00000000 00000000 c0586628 c0545f7c
5f40: 30104000 c0545f60 c0545f54 c01cddb0 c01cdd10 c0545f80 c0545f64 c0118fb8
5f60: c01cdda4 00000000 00000000 c0546258 c054622c c0545fa4 c0545f84 c0118134
5f80: c0118f64 00000000 c0117ae4 c01b67d0 00000000 00003ab2 c0545fd0 c0545fa8
5fa0: c0117d5c c01180b4 00000000 c0545fd0 c0545fbc c0118278 c05460e0 c012975c
5fc0: c0080280 c0545ff4 c0545fd4 c0108908 c0117ccc c0108350 c012975c 00007175
5fe0: c0546068 c0129758 00000000 c0545ff8 3010803c c01086c0 00000000 00000000
Backtrace:
[<c01ca9cc>] (alloc_inode+0x0/0xac) from [<c01cafb4>] (iget_locked+0x8c/0x138)
 r5:c3801520 r4:00000000
[<c01caf28>] (iget_locked+0x0/0x138) from [<c0203d84>]
(sysfs_get_inode+0x1c/0x1a8)
[<c0203d68>] (sysfs_get_inode+0x0/0x1a8) from [<c02067d4>]
(sysfs_mount+0xf8/0x178)
 r5:c0545ea8 r4:c3801520
[<c02066dc>] (sysfs_mount+0x0/0x178) from [<c01b808c>] (mount_fs+0x1c/0xe0)
 r8:00000000 r7:c0559ab0 r6:c0559ab0 r5:c38139e0 r4:c04ee5f8
[<c01b8070>] (mount_fs+0x0/0xe0) from [<c01cdd54>] (vfs_kern_mount+0x54/0x94)
 r6:00400000 r5:c38139e0 r4:c04ee5f8
[<c01cdd00>] (vfs_kern_mount+0x0/0x94) from [<c01cddb0>]
(kern_mount_data+0x1c/0x20)
 r8:30104000 r7:c0545f7c r6:c0586628 r5:00000000 r4:00000000
[<c01cdd94>] (kern_mount_data+0x0/0x20) from [<c0118fb8>] (sysfs_init+0x64/0xc0)
[<c0118f54>] (sysfs_init+0x0/0xc0) from [<c0118134>] (mnt_init+0x90/0x19c)
 r6:c054622c r5:c0546258 r4:00000000
[<c01180a4>] (mnt_init+0x0/0x19c) from [<c0117d5c>] (vfs_caches_init+0xa0/0x130)
 r5:00003ab2 r4:00000000
[<c0117cbc>] (vfs_caches_init+0x0/0x130) from [<c0108908>]
(start_kernel+0x258/0x2bc)
 r6:c0080280 r5:c012975c r4:c05460e0
[<c01086b0>] (start_kernel+0x0/0x2bc) from [<3010803c>] (0x3010803c)
 r6:c0129758 r5:c0546068 r4:00007175
Code: c38139e0 00400000 c0545f50 c0545f30 (c01cdd54)
---[ end trace 1b75b31a2719ed1c ]---
Kernel panic - not syncing: Attempted to kill the idle task!
Backtrace:
[<c013dec4>] (dump_backtrace+0x0/0x10c) from [<c0450378>] (dump_stack+0x18/0x1c)
 r6:c0548440 r5:00000000 r4:c0572a1c
[<c0450360>] (dump_stack+0x0/0x1c) from [<c04504f8>] (panic+0x60/0x180)
[<c0450498>] (panic+0x0/0x180) from [<c0156968>] (do_exit+0x600/0x6a0)
 r3:00000000 r2:c0544000 r1:c0545d30 r0:c04e549c
 r7:c0545e40
[<c0156368>] (do_exit+0x0/0x6a0) from [<c013e37c>] (die+0x18c/0x1c4)
 r7:c0545e40
[<c013e1f0>] (die+0x0/0x1c4) from [<c013e3d4>] (arm_notify_die+0x20/0x58)
 r8:00000000 r7:c0545f28 r6:c0545e40 r5:c0549220 r4:ffffffff
[<c013e3b4>] (arm_notify_die+0x0/0x58) from [<c012f1a4>]
(do_undefinstr+0x118/0x168)
[<c012f08c>] (do_undefinstr+0x0/0x168) from [<c013adb8>] (__und_svc+0x38/0x60)
Exception stack(0xc0545e40 to 0xc0545e88)
5e40: c0545ea8 c009312c c3801520 c0545ea8 00000000 c0545ea8 c0545ea8 c009312c
5e60: c0092540 41129200 000002fb c0545e9c c0545ea0 c0545e88 c01ca9f4 c0545f28
5e80: 40000053 ffffffff
 r8:c0092540 r7:c009312c r6:c0545ea8 r5:c0545e74 r4:ffffffff
[<c01ca9cc>] (alloc_inode+0x0/0xac) from [<c01cafb4>] (iget_locked+0x8c/0x138)
 r5:c3801520 r4:00000000
[<c01caf28>] (iget_locked+0x0/0x138) from [<c0203d84>]
(sysfs_get_inode+0x1c/0x1a8)
[<c0203d68>] (sysfs_get_inode+0x0/0x1a8) from [<c02067d4>]
(sysfs_mount+0xf8/0x178)
 r5:c0545ea8 r4:c3801520
[<c02066dc>] (sysfs_mount+0x0/0x178) from [<c01b808c>] (mount_fs+0x1c/0xe0)
 r8:00000000 r7:c0559ab0 r6:c0559ab0 r5:c38139e0 r4:c04ee5f8
[<c01b8070>] (mount_fs+0x0/0xe0) from [<c01cdd54>] (vfs_kern_mount+0x54/0x94)
 r6:00400000 r5:c38139e0 r4:c04ee5f8
[<c01cdd00>] (vfs_kern_mount+0x0/0x94) from [<c01cddb0>]
(kern_mount_data+0x1c/0x20)
 r8:30104000 r7:c0545f7c r6:c0586628 r5:00000000 r4:00000000
[<c01cdd94>] (kern_mount_data+0x0/0x20) from [<c0118fb8>] (sysfs_init+0x64/0xc0)
[<c0118f54>] (sysfs_init+0x0/0xc0) from [<c0118134>] (mnt_init+0x90/0x19c)
 r6:c054622c r5:c0546258 r4:00000000
[<c01180a4>] (mnt_init+0x0/0x19c) from [<c0117d5c>] (vfs_caches_init+0xa0/0x130)
 r5:00003ab2 r4:00000000
[<c0117cbc>] (vfs_caches_init+0x0/0x130) from [<c0108908>]
(start_kernel+0x258/0x2bc)
 r6:c0080280 r5:c012975c r4:c05460e0
[<c01086b0>] (start_kernel+0x0/0x2bc) from [<3010803c>] (0x3010803c)
 r6:c0129758 r5:c0546068 r4:00007175

what should I do???
