From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: minimum config for an ARM qemu target
Date: Tue, 10 Jun 2008 13:43:57 -0700
Message-ID: <484EE78D.8090500@am.sony.com>
References: <484EC6B7.7050503@am.sony.com> <484EDFBD.2080307@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <484EDFBD.2080307@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Opdenacker <michael@free-electrons.com>
Cc: linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>

Michael Opdenacker wrote:
> Here's one such configuration:
> http://free-electrons.com/tmp/versatile_qemu_defconfig
>...
> Or would you prefer to have the exact configuration I used last year? In
> this case, the configuration is in
> http://free-electrons.com/pub/qemu/demos/arm/directfb/1.0/

Thanks - this is just what I'm interested in.

I downloaded both, and it turns out that they're very similar:

diffconfig versatile_qemu_defconfig config-qemu-arm-2.6.20
-PRINTK_TIME  n
 INITRAMFS_SOURCE  "" -> "../rootfs"
 PRINTK  y -> n
+INITRAMFS_ROOT_GID  0
+INITRAMFS_ROOT_UID  0

Only PRINTK and PRINTK_TIME are different (from a size-affecting
perspective).

Thanks a bunch!
 -- Tim

P.S. I remember Matt saying that the linux-tiny list is deprecated, so
I'm copying (after the fact) linux-embedded on this thread.

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

