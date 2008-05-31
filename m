From: Phil Wilshire <pwilshire@cox.net>
Subject: initramfs size limitation
Date: Sat, 31 May 2008 08:44:14 -0400
Message-ID: <4841481E.8090406@cox.net>
Reply-To: pwilshire@cox.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Hi All,

Firstly, thanks for this list I hope we can get some interesting things 
happening.

I have a question regarding initramfs and tmpfs in a NOMMU environment.

I hope this is the right place and the right sort of question.

I work closely with the Blackfin systems and they have now integrated 
the initramfs generation into their system build. The result is great
the root fs is ready to run from the page cache.

There is one problem that I can see that may be more serious for 
embedded users.
As far as I can tell the initramfs filesystem is not restricted in size.
You can keep writing files until it uses all available memory.

It should be possible to mount (or rather remount) the initramfs read 
only and use tmpfs for a restricted size read/write file system.

The trouble is that the size option for tmpfs is removed for NOMMU systems.

Has anyone else seem this problem ?
I dont think the fixes are complicated but has any one attempted to fix it ?
Would the mainline kernel be receptive to such modifications ?


Regards
   Phil Wilshire

