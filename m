From: Markus Brunner <super.firetwister@googlemail.com>
Subject: root on Squashfs breaks mknod
Date: Thu, 2 Apr 2009 13:40:27 +0200
Message-ID: <200904021340.27277.super.firetwister@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:mime-version:content-type:content-transfer-encoding
         :content-disposition:message-id;
        bh=tZ++u/QStnxeOBbGkI4El4hQ0GM7Xpejuw71fNqLWT8=;
        b=Y4HaYXldvsfdbdIAqQh+zNNm3ShWdN50cfWaoyYEVh6n7mkAqjHlGwh59SK5f7t4AU
         3Pk9D3aM3yAYzAOExDfahWxrYrENRNn8um60s9tS3NglMqlOyYZFJLmWErAeC4ufXaY0
         xhjT9hDVIrhQQkissSRKdNVSvOvt0oXmoqeFc=
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: squashfs-devel@lists.sourceforge.net
Cc: linux-embedded@vger.kernel.org

Hi,

I have a problem if I use squashfs as root filesystem. The error occurs at 
least with linux 2.6.11/2.6.29 and squashfs 3.4/4.0 on x86.

I use an initramfs where I mount the squashfs and use run-init from klibc to 
make my squashfs the new root device. I can also copy the devices to a tmpfs 
and bind it to /dev. But after I have left the initramfs newly created 
devices don't work anymore. It doesn't matter if they get created with mknod, 
or copied with "cp -a" from /dev. The devices in /dev still work, regardless 
if they are directly on the squashfs, or on a tmpfs.

The created devices have the same Major/Minor numbers and are special files. 
It is also possible to put the devices in an archive and restore them after 
reboot. But they only work if mknod still works.

Here is the output of strace, reading from the working /dev/zero to the 
broken /tmp/null.

# strace -fff dd if=/dev/zero of=/tmp/null count=1
execve("/bin/dd", ["dd", "if=/dev/zero", "of=/tmp/null", "count=1"], [/* 
16 vars */]) = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo 
...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo 
...}) = 0
getuid()                                = 0
brk(0)                                  = 0x80e6000
brk(0x80e7000)                          = 0x80e7000
open("/dev/zero", O_RDONLY|O_LARGEFILE) = 4
dup2(4, 0)                              = 0
close(4)                                = 0
open("/tmp/null", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 027741600666) = -1 
ENXIO (No such device or address)
brk(0x80e8000)                          = 0x80e8000
ioctl(2147483647, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbf870224) = -1 EBADF 
(Bad file descriptor)
brk(0x80e9000)                          = 0x80e9000
write(2, "dd: can\'t open \'/tmp/null\': No s"..., 54dd: can't open 
'/tmp/null': No such device or address
) = 54
_exit(1)



Any ideas where this bug might came from?

Best Regards

Markus
