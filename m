From: Johnny Hung <johnny.hacking@gmail.com>
Subject: jffs2_gcd_mtdx thread and umount problem.
Date: Mon, 18 Jan 2010 15:04:28 +0800
Message-ID: <cb9ecdfa1001172304q132d5324qa963d0d5cdfb7806@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=eKhKCjIY3XqmnCW0dMYX1Clj7RVtbxRtSInBe5rXcS4=;
	b=U5dGHORH0+iq1DIBDJQvSB6Es53kaToeYanbCnuybPlmBphwfTM89GhtKCSzPd3TqX
	ZeKsEiS/H6HBWlRCVbBD/7w7cMIkmJTp68A11Jpwc9dBNrEALxx2Q/Wjua16IxTdK9aj
	AgVis55elezoJGcPpquCR1fwmdNpQ7UIrjATU=
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org

Hi All,

I have a customized MPC8313 (ppc arch) board with SPANSION 64MB NOR
flash, everything works fine but I found a abnormal about JFFS2 flahs
filesystem.

The system will mount JFFS2 to /mnt/mtd when system boot up. I try to
execute umount /mnt/mtd or sync or reboot right away after login then
these commands hangs. Use ps command to check process status and is D
(Uninterruptible sleep, usually IO). I try to kill jffs2_gcd_mtd4 and
umount/reboot/syc commands execute successfully. I think
jffs2_gcd_mtd4 (mount /dev/mtd4) do something in the background so I
wait for 10 minutes after login and execute the same commands and it
doesn't hangs.

The following procedure is I to make jffs2 file system and write to
flash then mount to /mnt/mtd.

1. mkfs.jffs2 -d mtd -e 0x20000 --pad 0x3080000 -o mtd.jffs2 (erase
block size is 128KB and jffs2 partition size is 48.5MB)

2. write jffs2 file system to flash in uboot.
      tftpboot 200000 mtd.jffs2;                (load mtd.jffs2 to memory)
      protect off f8f80000 fbffffff;
      erase f8f80000 fbffffff;                       (erase all 48.5MB)
      cp.b 200000 f8f80000 $filesize;     (program mtd.jffs2 to flash)
      protect on f8f80000 fbffffff;
      cmp.b 200000 f8f80000 $filesize

3. Add below in /etc/fstab file to mount to /mnt/mtd
      /dev/mtdblock4  /mnt/mtd        jffs2   defaults        1       1

Does anyone knows what purpose for jffs2_gcd_mtdx thread and why it
cause umount/sync/reboot commands hangs it is reasonable or  something
I did wrong?

BRs, H. Johnny
