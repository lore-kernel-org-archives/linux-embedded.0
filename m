From: Johnny Hung <johnny.hacking@gmail.com>
Subject: mount ramdisk rootfs /etc directory to jffs2 filesystem.
Date: Tue, 19 Jan 2010 17:20:53 +0800
Message-ID: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=MpTIrmxRouDjM+yMeEiDtfbq5VJz451TwL0ydCB+rOM=;
        b=ozE1ohsgBoO8LGHQdO6Vkjd3lHXgDS0QZuXvdNHceQjGQoAk4xtY8xjH/w/KUqCoXI
         yp74YrQRrhbRvKShydzIfXbAoeB+5F4TlpoCSeX2Fmjijf7phLHg4SOFZ3pim49XSA3X
         m2pWesqa9qMhPskhLvHwG49ybmQESnOnDnL6k=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org, kernelnewbies <kernelnewbies@nl.linux.org>

Hi ALL,

I have build an embedded Linux system and rootfs is a ramdisk. Ramdisk
rootfs resides in memory so modify files is non-effective after a
reboot. Some directories in rootfs, like /etc, /usr, ... are contain
many application configuration files and I want to mount it to jffs2
flash filesysyem so it will take effect after a reboot. Is it
possible? I know the flash has write times limited so the log files
(syslogd/klogd) should not store in flash. In general, how to deploy
root file system for embedded linux with flash storage?

H. Johnny
