From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: logfs segfaults at umount time
Date: Sun, 10 Oct 2010 18:11:31 +0200
Message-ID: <4CB1E5B3.1090300@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: joern@logfs.org
Cc: logfs@logfs.org, linux-embedded mailing list <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

Hi J=F6rn,

I'm running some flash filesystem benchmarks for CELF, and I'm facing
kernel segfaults when I try to umount my logfs filesystem.

This happens with both 2.6.35 and 2.6.36-rc7. See the below trace.

Has anyone else faced the same kind of issue? Don't hesitate to get bac=
k
to me if you need more details or if there are commands you would like
me to run.

Thank you in advance for your help,

Cheers,

Michael.


root@calao:~# cat /proc/cmdline
console=3DttyS0,115200n8 root=3D/dev/nfs ip=3D192.168.2.100
nfsroot=3D192.168.2.1:/home/mike/work/celf/RFS mtdparts=3Datmel_nand:12=
8m(Main)
root@calao:~# flash_eraseall /dev/mtd0
Erasing 128 Kibyte @ 8000000 -- 100 % complete.
root@calao:~# mkfs.logfs /dev/mtdblock0
Will create filesystem with the following details:
              hex:   decimal:
fssize=3D    8000000  134217728
segsize=3D     40000     262144
blocksize=3D    1000       4096
writesize=3D       1          1

Do you wish to continue (yes/no)
yes

=46inished generating LogFS
root@calao:~# mount -t logfs /dev/mtdblock0 /mnt/flash/
root@calao:~# cp -rf /fs/8m/* /mnt/flash/
eth0: TX underrun, resetting buffers
eth0: TX underrun, resetting buffers
root@calao:~# umount /mnt/flash/
kernel BUG at fs/logfs/segment.c:858!
Unable to handle kernel NULL pointer dereference at virtual address 000=
00000
pgd =3D c14a4000
[00000000] *pgd=3D23a3c031, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 817 [#1]
last sysfs file: /sys/devices/virtual/vc/vcs6/uevent
Modules linked in: logfs zlib_deflate zlib_inflate
CPU: 0    Not tainted  (2.6.36-rc7 #1)
PC is at __bug+0x18/0x24
LR is at __bug+0x14/0x24
pc : [<c0025764>]    lr : [<c0025760>]    psr: 20000013
sp : c2d91e18  ip : 00000000  fp : c2d91e84
r10: c03c3b80  r9 : 00000009  r8 : 00000000
r7 : c2d91e60  r6 : c3601d58  r5 : c3601d58  r4 : c03c3b80
r3 : 00000000  r2 : c033e368  r1 : 60000013  r0 : 0000002c
=46lags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 214a4000  DAC: 00000015
Process umount (pid: 1292, stack limit =3D 0xc2d90270)
Stack: (0xc2d91e18 to 0xc2d92000)
1e00:                                                       bf022620
bf022630
1e20: bf022620 c0078360 ffffffff c0078a04 ffffffff c3601d58 c2d91e60
00000000
1e40: 0000000e 00000081 ffffffff c3601d58 c2d91e60 c0078b2c 00000000
00000000
1e60: 0000000e 00000000 c03e01a0 c03e01c0 c03e01e0 c03df100 c03df120
c03df140
1e80: c03df160 c03df180 c03df1a0 c03c3b80 c03986c0 c0398e40 c03c3ba0
c03c3bc0
1ea0: ffffffff ffffffff ffffffff 00000000 c2c1f800 c2d90000 c380dc60
c380dc78
1ec0: 00000000 c0078d70 ffffffff ffffffff c3601760 c3601cb8 c2c1f800
bf022104
1ee0: c3691830 c3601760 c035e708 c3601cb8 c035e708 c2c1f800 c035e848
c2d90000
1f00: c380dc60 c380dc78 00000000 c00a90f4 c3601cb8 c00a99b8 c2c1f800
c2d90000
1f20: bf0272e4 c035e848 c2d90000 c0098d04 c2c1f800 c3a7b000 c380dc60
bf0248e4
1f40: c2c1f800 bf028228 c380dc60 c0097f70 00000000 c2d91f68 c380dc60
c00ad3ac
1f60: 4003a000 c380dc78 c2d91f68 c2d91f68 c2d91f70 c2d91f70 c380dc60
c35fbab8
1f80: c2d90000 0001c530 0001aa1c 0001c518 00000034 c0021fe8 c2d90000
00000000
1fa0: 0001bab4 c0021e40 0001c530 0001aa1c 0001c530 00000000 00000048
00000000
1fc0: 0001c530 0001aa1c 0001c518 00000034 00000000 00000000 00000000
0001bab4
1fe0: 0001c560 be983c08 402c1c5c 402c1c7c 60000010 0001c530 e7d82003
e7c12007
[<c0025764>] (__bug+0x18/0x24) from [<bf022630>]
(map_invalidatepage+0x10/0x18 [logfs])
[<bf022630>] (map_invalidatepage+0x10/0x18 [logfs]) from [<c0078360>]
(do_invalidatepage+0x20/0x28)
[<c0078360>] (do_invalidatepage+0x20/0x28) from [<c0078a04>]
(truncate_inode_page+0xd4/0xe4)
[<c0078a04>] (truncate_inode_page+0xd4/0xe4) from [<c0078b2c>]
(truncate_inode_pages_range+0x118/0x344)
[<c0078b2c>] (truncate_inode_pages_range+0x118/0x344) from [<c0078d70>]
(truncate_inode_pages+0x18/0x20)
[<c0078d70>] (truncate_inode_pages+0x18/0x20) from [<bf022104>]
(logfs_evict_inode+0x40/0x188 [logfs])
[<bf022104>] (logfs_evict_inode+0x40/0x188 [logfs]) from [<c00a90f4>]
(evict+0x20/0xb0)
[<c00a90f4>] (evict+0x20/0xb0) from [<c00a99b8>] (iput+0x178/0x254)
[<c00a99b8>] (iput+0x178/0x254) from [<c0098d04>]
(generic_shutdown_super+0x78/0xe4)
[<c0098d04>] (generic_shutdown_super+0x78/0xe4) from [<bf0248e4>]
(logfs_kill_sb+0x40/0xf8 [logfs])
[<bf0248e4>] (logfs_kill_sb+0x40/0xf8 [logfs]) from [<c0097f70>]
(deactivate_locked_super+0x44/0x58)
[<c0097f70>] (deactivate_locked_super+0x44/0x58) from [<c00ad3ac>]
(sys_umount+0x6c/0x33c)
[<c00ad3ac>] (sys_umount+0x6c/0x33c) from [<c0021e40>]
(ret_fast_syscall+0x0/0x2c)
Code: e1a01000 e59f000c eb096367 e3a03000 (e5833000)
---[ end trace f09ed3af1a44d711 ]---
------------[ cut here ]------------
WARNING: at kernel/exit.c:899 do_exit+0x5d4/0x624()
Modules linked in: logfs zlib_deflate zlib_inflate
[<c0027ae8>] (unwind_backtrace+0x0/0xf4) from [<c003a310>]
(warn_slowpath_common+0x4c/0x64)
[<c003a310>] (warn_slowpath_common+0x4c/0x64) from [<c003a344>]
(warn_slowpath_null+0x1c/0x24)
[<c003a344>] (warn_slowpath_null+0x1c/0x24) from [<c003e0a4>]
(do_exit+0x5d4/0x624)
[<c003e0a4>] (do_exit+0x5d4/0x624) from [<c0025c90>] (die+0x188/0x1c0)
[<c0025c90>] (die+0x188/0x1c0) from [<c0029044>]
(__do_kernel_fault+0x64/0x84)
[<c0029044>] (__do_kernel_fault+0x64/0x84) from [<c0029198>]
(do_page_fault+0x134/0x1d8)
[<c0029198>] (do_page_fault+0x134/0x1d8) from [<c00212e4>]
(do_DataAbort+0x34/0x98)
[<c00212e4>] (do_DataAbort+0x34/0x98) from [<c0021a6c>]
(__dabt_svc+0x4c/0x60)
Exception stack(0xc2d91dd0 to 0xc2d91e18)
1dc0:                                     0000002c 60000013 c033e368
00000000
1de0: c03c3b80 c3601d58 c3601d58 c2d91e60 00000000 00000009 c03c3b80
c2d91e84
1e00: 00000000 c2d91e18 c0025760 c0025764 20000013 ffffffff
[<c0021a6c>] (__dabt_svc+0x4c/0x60) from [<c0025764>] (__bug+0x18/0x24)
[<c0025764>] (__bug+0x18/0x24) from [<bf022630>]
(map_invalidatepage+0x10/0x18 [logfs])
[<bf022630>] (map_invalidatepage+0x10/0x18 [logfs]) from [<c0078360>]
(do_invalidatepage+0x20/0x28)
[<c0078360>] (do_invalidatepage+0x20/0x28) from [<c0078a04>]
(truncate_inode_page+0xd4/0xe4)
[<c0078a04>] (truncate_inode_page+0xd4/0xe4) from [<c0078b2c>]
(truncate_inode_pages_range+0x118/0x344)
[<c0078b2c>] (truncate_inode_pages_range+0x118/0x344) from [<c0078d70>]
(truncate_inode_pages+0x18/0x20)
[<c0078d70>] (truncate_inode_pages+0x18/0x20) from [<bf022104>]
(logfs_evict_inode+0x40/0x188 [logfs])
[<bf022104>] (logfs_evict_inode+0x40/0x188 [logfs]) from [<c00a90f4>]
(evict+0x20/0xb0)
[<c00a90f4>] (evict+0x20/0xb0) from [<c00a99b8>] (iput+0x178/0x254)
[<c00a99b8>] (iput+0x178/0x254) from [<c0098d04>]
(generic_shutdown_super+0x78/0xe4)
[<c0098d04>] (generic_shutdown_super+0x78/0xe4) from [<bf0248e4>]
(logfs_kill_sb+0x40/0xf8 [logfs])
[<bf0248e4>] (logfs_kill_sb+0x40/0xf8 [logfs]) from [<c0097f70>]
(deactivate_locked_super+0x44/0x58)
[<c0097f70>] (deactivate_locked_super+0x44/0x58) from [<c00ad3ac>]
(sys_umount+0x6c/0x33c)
[<c00ad3ac>] (sys_umount+0x6c/0x33c) from [<c0021e40>]
(ret_fast_syscall+0x0/0x2c)
---[ end trace f09ed3af1a44d712 ]---
Segmentation fault

--=20
Michael Opdenacker, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
+ 33 621 604 642
