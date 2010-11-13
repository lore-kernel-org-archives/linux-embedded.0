From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 00/16 v3] pramfs: persistent and protected RAM filesystem
Date: Sat, 13 Nov 2010 15:47:28 +0100
Message-ID: <4CDEA500.4050401@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=ziUTMp0owgWRzr8Mt3OLheN1TZBTVkYhMgS9kVWm6Og=;
        b=KrIBZ61FgzwgwPMlcbg4XlMBHqZ/9z06hlgknliWXTfWYPBJNWcaXSt1i7NUS7gJxV
         /DW82XHd30YW3M8H9a2FMDZHKRSa153Worhg/kmUJXoWh7DYEziJxxcM0jAEM98UZZ20
         SXN7rs7/YawOTDcMsGgH6HrmvOgWxNAG+DJ6k=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Hi all,

third round for the patch series (I hope this is the last one :)). I
summarize here the changes to improve the review:

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
