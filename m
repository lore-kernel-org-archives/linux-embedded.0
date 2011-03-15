From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: SPI controller laying around...
Date: Tue, 15 Mar 2011 11:40:53 -0400
Message-ID: <1300203653.8754.46.camel@jfddesk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:subject:from:to:content-type:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=StrXmkcEl2YQIA75HUbsLUYPwm5rPFg2jKTgz4QonBM=;
        b=jHIdgf2AjtkNymPrp4O+eoUZ5Cha3pMUXq3qqOHZ+hKhVP4ESueIYB06u93l1rGcPX
         xjSf3A95ipQK8G5A4SRP783W0hLDTxnyl5YMIVgK/t7woO89+cuvKgwARM5JpiTqkZD4
         zZm60MjFp956g1RY9/9EMsb3DMpV/FwZYTg8o=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi all!

I need to perform some tests and I am in need of any SPI controller I
could use through the standard SPI master framework of the kernel.

I could perhaps hack the BIOS SPI for example (fool around with the chip
select and solder some wires to export to a bread board. Or I am sure my
workstation has one on the motherboard (dell vostro 430) for some odd
functionnality... but it's not enumerated and probed as an SPI master. 

Or maybe even old ethernet cards I have lying around which could be
hacked?

Or a simple USB-SPI dongle? Anyone knows one that will just plain work
with the kernel? 

Any thoughts? Tools I should google for?

Note: I want to test if I can program a Xilinx FPGA from the CPU-SPI
instead of the PROM that sits next to the FPGA, at the fastest speed
available. I've already solved the PCI express appearance and
disappearance of the device on its bus. 
