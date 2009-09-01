From: Marc Andre Tanner <mat@brain-dump.org>
Subject: [RFC|PATCH] Compile time printk verbosity
Date: Wed,  2 Sep 2009 00:31:02 +0200
Message-ID: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: mat@brain-dump.org

This series adds a configuration option to selectively compile out
printk message strings based on a verbosity level.

This works by wrapping printk with a macro which evaluates to a 
constant if condition which the compiler will be able to optimize 
out.

However because printk might be wrapped by a macro it no longer has
a return value. This means that constructs like the following ones
don't work: 

   ((void)(SOME_RANDOM_DEBUG_FLAG && printk(...));

   some_random_variable = printk(...);

Therefore printk_unfiltered is introduced which is just an alias
to the standard printk function but not wrapped by a macro.

Patches 4-6 make existing kernel code aware of this fact.

The series was compile tested with make allyesconfig for x86 and 
arm (with a cross compiler) but I might have missed something.

All kinds of comments are welcome.

Marc Andre Tanner (7):
      printk: introduce CONFIG_PRINTK_VERBOSITY
      printk: move printk to the end of the file
      printk: introduce printk_unfiltered as an alias to printk
      drivers: replace printk with printk_unfiltered
      drivers: make macro independent of printk's return value
      video/stk-webcam: change use of STK_ERROR
      printk: provide a filtering macro for printk


 drivers/char/mem.c                 |    2 +-
 drivers/md/md.c                    |    2 +-
 drivers/md/raid5.c                 |    2 +-
 drivers/media/video/stk-webcam.c   |   16 +++---
 drivers/net/e100.c                 |    2 +-
 drivers/net/ixgb/ixgb.h            |    2 +-
 drivers/net/ixgbe/ixgbe.h          |    2 +-
 drivers/scsi/aic7xxx/aic79xx_osm.h |    2 +-
 drivers/scsi/aic7xxx/aic7xxx_osm.h |    2 +-
 include/linux/kernel.h             |   29 +++++++++++
 include/net/sctp/sctp.h            |    2 +-
 init/Kconfig                       |   28 ++++++++++
 kernel/lockdep.c                   |    4 +-
 kernel/printk.c                    |   96 +++++++++++++++++++++++-------------
 14 files changed, 137 insertions(+), 54 deletions(-)
