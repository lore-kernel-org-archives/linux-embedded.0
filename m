From: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Squashfs performance (3.3 vs 4.0 in mainline)
Date: Thu, 10 Dec 2009 15:02:43 +0100
Message-ID: <20091210150243.2ed788f4@marrow.netinsight.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded <linux-embedded@vger.kernel.org>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>

Hi!

I'm running 2.6.31 on a slow ARM platform and using squashfs 4.0 as
shipped with the kernel. It's a Sharp LH79524, so the architecture
itself isn't mainlined yet.

Squashfs works well, but I've noted a performance regression compared
to the out-of-tree squashfs 3.3 which we ran on 2.6.23. The new kernel
is faster until the squashfs root filesystem is mounted, but after that
it goes downhill. Especially mounting takes a lot more time with the
new:

2.6.23 / 3.3:

  [ 0.01]: [    1.250000] RAMDISK: squashfs filesystem found at block 0
  [ 0.01]: [    1.260000] RAMDISK: Loading 2156KiB [1 disk] into ram disk... done.
  [ 1.39]: [    2.650000] VFS: Mounted root (squashfs filesystem) readonly.
  [ 0.01]: [    2.660000] Freeing init memory: 80K

2.6.31 / 4.0:

  [ 0.00]: [    1.080000] RAMDISK: squashfs filesystem found at block 0
  [ 0.01]: [    1.090000] RAMDISK: Loading 2372KiB [1 disk] into ram disk... done.
  [ 2.79]: [    3.880000] VFS: Mounted root (squashfs filesystem) readonly on device 1:0.
  [ 0.01]: [    3.890000] Freeing init memory: 80K

(The first column is the time difference compared to last timestamp).
Are there any general changes which could have caused this difference?


I've tried with various mksquashfs options, and -noI makes it somewhat
faster (and larger), but not near the old version.

// Simon
