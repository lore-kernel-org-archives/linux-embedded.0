From: Marco <marco.stornelli@gmail.com>
Subject: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Sat, 13 Jun 2009 15:20:34 +0200
Message-ID: <4A33A7A2.1050608@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=rR0IPGvBAJGBMuv7lJy6K1WJp6VR0XUwOBPwMb8GTog=;
        b=f9L9hcFvDeU3GUWXHVdSsUdqZPxrkK4z3cRW5h+L1ULVgz6xSsQ49NjitMKVrpco/U
         kWlNsyyrSGCXPTW4T68m+/dPjgOlvji5wGIvMYNkenwzLuNq74hvc3os+z5K9pIL9lEd
         D74EPJxn36bYi/aeXR70lLccKbX3pHfFrK3f0=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS Devel <linux-fsdevel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Daniel Walker <dwalker@soe.ucsc.edu>

This is a second attempt at mainlining Pramfs. The first attempt was
back in early 2004 by MontaVista. Since then the kernel code has almost
been completely rewritten. So my first item on the list was porting the
code on a recent kernel version. After that I added the XIP support.

Now some FAQs:

What is the goal of this filesystem?

Many embedded systems have a block of non-volatile RAM separate from
normal system memory, i.e. of which the kernel maintains no memory page
descriptors. For such systems it would be beneficial to mount a
fast read/write filesystem over this "I/O memory", for storing
frequently accessed data that must survive system reboots and power
cycles. An example usage might be system logs under /var/log, or a user
address book in a cell phone or PDA.

Why this kind of filesystem should be "mainlined"?

Linux traditionally had no support for a persistent, non-volatile
RAM-based filesystem, persistent meaning the filesystem survives a
system reboot or power cycle intact. The RAM-based filesystems such as
tmpfs and ramfs have no actual backing store but exist entirely in the
page and buffer caches, hence the filesystem disappears after a system
reboot or power cycle.

Are there any pending patents on this code?

NO, there aren't patents pending on this code. MontaVista had a pending
patent application but now it has abandoned this way. Daniel Walker can
confirm that.


Marco


