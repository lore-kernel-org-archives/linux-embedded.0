From: Paul Chavent <paul.chavent@fnac.net>
Subject: /dev/fw major not constant (embedded mdev devtmpfs ieee1394)
Date: Thu, 21 Jan 2010 21:56:10 +0100
Message-ID: <4B58BF6A.6070303@fnac.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hotplug-owner@vger.kernel.org>
Sender: linux-hotplug-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org
Cc: linux-hotplug@vger.kernel.org, linux1394-devel@lists.sourceforge.net, busybox@busybox.net, libdc1394-devel@lists.sourceforge.net

Hi.

I'am working on an embedded gnu/linux system that allow to capture an ieee1394 stream.

The system is compound of a kernel, a basic initrd (libc,libgcc,busybox,libdc1394,...) and my app.

I use the new firewire stack.

As my system is very minimalist, i tought to create the nodes in /dev at the moment of building my initrd.

But when i needed to modify my kernel configuration, it has changed the major number of /dev/fw*.

It's not really important for the definitive system (it will be freeze), but i wonder how to solve this issue for my future works ?

I don't need hotplug, i just need to fill /dev at startup (coldplug). The target is an embedded device, so it should be easy to build/configure/install, and lightweight.

For those reasons i don't want to use udev.

I tried mdev (i run mdev -s in my startup script) from busybox. The problem is that mdev only look in /sys/class for filling /dev (i have notified their mailing list http://lists.busybox.net/pipermail/busybox/2010-January/071384.html).

The linux ieee1394 wiki people give me some idea (http://marc.info/?t=126390679500003&r=1&w=2) :
  - maintain a local patch for making the major constant
  - use devtmpfs

I prefer to try devtmpfs, but i would like to have your opinion on how would you do for me ?

Thank for your reading.

Paul.

