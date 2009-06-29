From: Scott Wood <scottwood@freescale.com>
Subject: Re: PCI device support in Open Firmware (device tree syntax)
Date: Mon, 29 Jun 2009 11:51:33 -0500
Message-ID: <20090629165133.GC1323@b07421-ec1.am.freescale.net>
References: <cb9ecdfa0906290858x125b8149na037f33258c21426@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cb9ecdfa0906290858x125b8149na037f33258c21426@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernelnewbies@nl.linux.org

On Mon, Jun 29, 2009 at 11:58:22PM +0800, Johnny Hung wrote:
> Hi all,
>     I am working in customized Freescale MPC8313 board. There are two
> PCI devices (Broadcom Switch) in PCI bus.
> Each PCI device has its configuration space. It contains
> vendor/product ID (RO)..., and important information, likes BARs
> (Base Address), INT line and IRQ(RW). These resources (BAR, INT, IRQ)
> is assigned from BIOS in x86 arch.
>     My problem is how to assign PCI device resources in device tree. I
> can't find exist dts file as an example. I have read the
> http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf
> file. It's described detailed about device tree
> except PCI device. So, anyone give me a hint or sany tuff is appreciated.
>    I think Linux Kernel parses device tree and get the PCI device
> resources information then write into PCI configuration space.
> So PCI device driver do pci_register_driver (get resource) and do
> itself probe for PCI device. Is it right? CMIIAW

With flat device trees, PCI devices are not typically included as they
can be probed instead.  Interrupt mapping is conveyed by the
interrupt-map property in the PCI controller node.

-Scott
