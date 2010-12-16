From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 00/16 v5] pramfs: persistent and protected RAM filesystem
Date: Thu, 16 Dec 2010 18:59:06 +0100
Message-ID: <4D0A536A.9050800@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=wny8RiTqV7x4nb0NyAYV/mls5guNvHgSGmzZwMTeXLM=;
        b=xTe21xSgbZlgbSW5tl4Yi1JEeJLBMpTS9/Lz9mtK5pucoxnX/8CGpHATGbFcbR8Btt
         OJLnPZ9VmuxMDruWpMSP0er9m99iZVoy9h5HDGfAXupTVQnWB5WqsbIza27Ayob+Z95v
         v/HQFscDsazJ6i4XRvoS4SWZ6NUkfiA/63juU=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Hi all,

fifth round for the patch series. I summarize here the changes to
improve the review:

v5:
- removed the changelog from documentation file
- added the function pram_check_flags in the file operations
- added a check when the user uses XIP and the blocksize is different
from page size
- added i_meta_mutex to avoid race conditions in the inode update
path
- changed the lock policy during mem{lock|unlock} operations
- replaced bitmap_set with bitmap_fill
- added mount options xip, acl, noacl, noprotect, user_xattr and
nouser_xattr as required by Paul Maundt
- inserted pr_fmt in pram.h
- inserted macros IF2DT and DT2IF
- removed file name description from each file
- used min_t instead of using own check in pram_add_link()

v4:
- in bitmap init used already present bitmap_set function
- fix a possible memory leak in an error path reported by yidong zhang

v3:
- fix a possible memory leak in an error path reported by yidong zhang
- fix a warning when using XIP about not used __pram_mmap symbol
- fix test module header description and replaced TEST_MODULE with
PRAMFS_TEST_MODULE in the Kconfig and Makefile according to the comments
done by Randy Dunlap
- fix a compilation warning in super.c reported by James Hogan
- fix a compilation error when XIP was enabled
- removed not used symbol PRAM_XATTR_INDEX_LUSTRE
- fix some comment style issue

v2:
- fix documentation errors reported by Randy Dunlap and Kieran Bingham
- reworked memory write protection functions with the suggestions of
Andi Kleen

v1:
- first draft

Marco
