From: Marc Andre Tanner <mat@brain-dump.org>
Subject: [RFC|PATCHv2] Compile time printk verbosity
Date: Wed,  2 Sep 2009 16:25:00 +0200
Message-ID: <1251901505-4313-1-git-send-email-mat@brain-dump.org>
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

For situation were this filtering mechanism is not desired an 
unfiltered variant is introduced: printk_unfiltered.

Currently the unfiltered variant is only used within
drivers/char/mem.c because we don't want to filter user space
data which comes is sent to /dev/kmsg.

Are there other places where the unfiltered variant should be used?

A known problem is that KERN_CONT messages aren't handled correctly.

The series was compile tested with make allyesconfig for x86 and 
arm (with a cross compiler) but I might have missed something.

Thanks to Mike Frysinger and Jamie Lokier for their suggestions for
improvement. 

All kinds of comments are welcome.

Marc Andre Tanner (5):
      printk: introduce CONFIG_PRINTK_VERBOSITY
      printk: move printk to the end of the file
      printk: introduce printk_unfiltered as an alias to printk
      char/mem: replace printk with printk_unfiltered
      printk: provide a filtering macro for printk

 drivers/char/mem.c     |    2 +-
 include/linux/kernel.h |   28 ++++++++++++++
 init/Kconfig           |   28 ++++++++++++++
 kernel/printk.c        |   95 ++++++++++++++++++++++++++++++------------------
 4 files changed, 117 insertions(+), 36 deletions(-)
