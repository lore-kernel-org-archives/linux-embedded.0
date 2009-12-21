From: Wolfgang Denk <wd@denx.de>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Mon, 21 Dec 2009 22:38:29 +0100
Message-ID: <20091221213829.1A8B93F6EF@gemini.denx.de>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <4B2FD7DB.10008@warmcat.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andy Green <andy@warmcat.com>
Cc: Matt Hsu <matt@0xlab.org>, linux-embedded@vger.kernel.org, celinux-dev@tree.celinuxforum.org

Dear Andy Green,

In message <4B2FD7DB.10008@warmcat.com> you wrote:
> 
> >> Another big problem with U-Boot was the inability to update the
> >> bootloader from the Linux world.  Instead the bootloader was treated
...
> I was talking about GTA02 specifically here, it was (and still is AFAIK) 
> only updateable by DFU for the bootloader.  We had kernels with soft ECC 
> that differed from the ECC / bad block marking generated and used by the 
> s3c2442 NAND hardware unit.  If U-Boot wrote it, it could at least read 
> it again.  So DFU was / is the only official way to update GTA02 bootloader.

This only means that the ports of U-Boot and Linux to that hardware
were inconsistent, which means that at least one of them can be
considered broken. [And I'm tempted to add that this might eventually
be a consequence of the fact that all this work was done without ever
getting in touch with the U-Boot community. Likewise, no code or
fixes have been contributed back into mainline.]


I think it's unfair to blame U-Boot for a poor on incorrect
implementation of the NAND driver on this specific hardware.


Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
It's hard to make a program foolproof because fools are so ingenious.
