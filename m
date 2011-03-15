From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: SPI controller laying around...
Date: Tue, 15 Mar 2011 11:23:30 -0400
Message-ID: <1300202610.8754.40.camel@jfddesk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:subject:from:to:content-type:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=kw87dfffeZjabtWJdJa8SjPYhUSMA45Op4yqdSBx2i4=;
        b=Fd7z9h0SmJxCLLRQ/h3DJ3Ut5KNimjEAwVxT302FFokvRuIjhWuzebCcDRwFarRLcl
         BdnPXWf/AGWac/lmksOkyyZl66nTc7qraQrCk3DGcF7Dul72ltIUELWMTQ9O0kvHX4b1
         Oqg6HDwGpM9+0Ga0JpoJFszNa8u7GykodXAj4=
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

Or a simple USB-SPI dongle? Anyone knows one that will just plain works
with the kernel? 

Any thoughts?

Note: I want to test if I can program a Xilinx FPGA from the CPU-SPI
instead of the PROM that sits next to the FPGA, at the fastest speed
available. I've already solved the PCI express appearance and
disappearance of the device on its bus.
