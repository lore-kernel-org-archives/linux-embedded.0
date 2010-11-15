From: Wookey <wookey@wookware.org>
Subject: YAFFS mainlining process currently underway
Date: Mon, 15 Nov 2010 11:35:11 +0000
Message-ID: <20101115113511.GL28472@dream.aleph1.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: Charles Manning <manningc2@actrix.gen.nz>

Thanks to a kick (and some money to enable the necessary concentration
on the job) from CELF/Google a YAFFS git branch intended for mainline
merging has been created.

Initial patches are currently under discussion on the fsdevel list. I
thought it worth mentioning here as this is a subject largely of
interrest to embedded people. 

http://www.spinics.net/lists/linux-fsdevel/threads.html#39158
http://www.spinics.net/lists/linux-fsdevel/msg39142.html

Do please comment.

The main constraint to bear in mind, is the need to keep the
in-linux branch compatible with the yaffs.net 'works with all OSes,
not just Linux (and old kernel versions too)' branch. So that means
compilers other than GCC, function veneers to interface with the
various OS-provided filesystem and hardware access functions, the
built-in trace system. Some of this is stuff that would go away or use
built-in linux functionality with a linux-only filesystem, but this
isn't a linux-only filesystem, so some compromise is needed.

The discussion seems to be going well so far. 

The codebase has been changed to Linux coding style and had a lot of
cruft removed:
* Multi-OS code has been removed.
* Types changed from __u32-->u32 etc.
* typedefs removed.
* Lindenting done.

Wookey
-- 
Principal hats:  Linaro, Emdebian, Wookware, Balloonboard, ARM
http://wookware.org/
