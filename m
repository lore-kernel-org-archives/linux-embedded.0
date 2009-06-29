From: Johnny Hung <johnny.hacking@gmail.com>
Subject: PCI device support in Open Firmware (device tree syntax)
Date: Mon, 29 Jun 2009 23:58:22 +0800
Message-ID: <cb9ecdfa0906290858x125b8149na037f33258c21426@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=HUV9nAaoj8O8dEIuJT7Eshe5tAVY/wM8poAQLLc3um0=;
	b=yHKGuBFwnjHgMyV5tVjWjpXhPWOjz40CqBP+0hjqDkBnP2gSttMDUdSU3Xb4TIKCaz
	HW3N1bPTSH1dxOjDKHuLZGEfaAtajLrfYD5JnKmI/i2BPcxK1PPxGMeHCaHi4aCLQY+a
	yU2xebD4/d/3kRFzPD86FxAHzvoGJ7Fue5L44=
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernelnewbies@nl.linux.org, scottwood@freescale.com

Hi all,
    I am working in customized Freescale MPC8313 board. There are two
PCI devices (Broadcom Switch) in PCI bus.
Each PCI device has its configuration space. It contains
vendor/product ID (RO)..., and important information, likes BARs
(Base Address), INT line and IRQ(RW). These resources (BAR, INT, IRQ)
is assigned from BIOS in x86 arch.
    My problem is how to assign PCI device resources in device tree. I
can't find exist dts file as an example. I have read the
http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf
file. It's described detailed about device tree
except PCI device. So, anyone give me a hint or sany tuff is appreciated.
   I think Linux Kernel parses device tree and get the PCI device
resources information then write into PCI configuration space.
So PCI device driver do pci_register_driver (get resource) and do
itself probe for PCI device. Is it right? CMIIAW

BRs, H. Johnny
