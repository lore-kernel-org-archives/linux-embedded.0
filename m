From: Ferenc Wagner <wferi@niif.hu>
Subject: [PATCH 0/3] RFC: direct MTD support for SquashFS
Date: Tue, 30 Mar 2010 15:32:46 +0200
Message-ID: <1269955969-26123-1-git-send-email-wferi__25180.2641003907$1269958925$gmane$org@niif.hu>
References: <87mxxxltk6.fsf@tac.ki.iif.hu>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <87mxxxltk6.fsf@tac.ki.iif.hu>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>, Phillip Lougher <phillip.lougher@gmail.com>, linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ferenc Wagner <wferi@niif.hu>

Hi,

Here is another, very different take on the subject.  It isn't a real
plugin system, but touches as little existing code as possible, and
still quite easy to extend if needed.  The MTD with LZMA case is somewhat
challenged, as the current interface mismatch requires extra copying.
It seems fairly easy to change the kernel decompressor interface to
scatter/gather operation in the future, to do away with this.

This patch does not consider SQUASHFS_METADATA_SIZE during buffer_head
allocation in block.c, on the principle of hands-off.

Extra question: does squashfs_put_super require BKL protection?

Comments welcome.

Regards,
Feri.

Ferenc Wagner (3):
  squashfs: parametrize decompressors on buffer_head operations
  squashfs: gather everything block device specific into block.c
  squashfs: add MTD backend

 fs/squashfs/Kconfig        |    2 +-
 fs/squashfs/Makefile       |    6 +-
 fs/squashfs/backend.c      |   63 +++++++++++++++
 fs/squashfs/backend.h      |   12 +++
 fs/squashfs/block.c        |   42 +++++++---
 fs/squashfs/decompressor.h |    8 +-
 fs/squashfs/lzma_wrapper.c |   11 ++-
 fs/squashfs/mtd.c          |  179 ++++++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/squashfs.h     |   22 +++++-
 fs/squashfs/super.c        |   45 +++---------
 fs/squashfs/zlib_wrapper.c |   13 ++--
 11 files changed, 337 insertions(+), 66 deletions(-)
 create mode 100644 fs/squashfs/backend.c
 create mode 100644 fs/squashfs/backend.h
 create mode 100644 fs/squashfs/mtd.c
