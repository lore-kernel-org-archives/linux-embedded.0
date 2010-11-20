From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 00/16 v4] pramfs: persistent and protected RAM filesystem
Date: Sat, 20 Nov 2010 10:56:28 +0100
Message-ID: <4CE79B4C.7030001@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=cuB4kWyzgbZywUD6KmEQbkE+ZhnR8OeleZE/qEUonLM=;
        b=EO1xx0noysDj88GieiRbgdGtoFq7fUQM6n8lFlgADhEv7Ao60vAQJ5SkhcxEb4/0fH
         08H/s8QtJtK4oPsG33bW86SCJyAOxhac3Z6SjFOKntAEmGR+79/qyPV0x+XiUw7P6B/e
         RJkjiINUP7DxFvzqZt1b4bcchLGbwYdCgR1C8=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@suse.de>

Hi all,

fourth round for the patch series. I summarize here the changes to
improve the review:

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

Andrew/Greg, can you insert the code in the mm/staging tree?

Marco
