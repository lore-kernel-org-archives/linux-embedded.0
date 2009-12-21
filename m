From: Wolfgang Denk <wd@denx.de>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Mon, 21 Dec 2009 20:30:38 +0100
Message-ID: <20091221193038.38CB63F6EF@gemini.denx.de>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <4B29F834.90108@warmcat.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andy Green <andy@warmcat.com>
Cc: Matt Hsu <matt@0xlab.org>, linux-embedded@vger.kernel.org, celinux-dev@tree.celinuxforum.org

Dear Andy,

In message <4B29F834.90108@warmcat.com> you wrote:
> 
> Another big problem with U-Boot was the inability to update the 
> bootloader from the Linux world.  Instead the bootloader was treated 
> special and had to be updated over USB with DFU (the exclusivity of it 
> enforced by an ECC policy disconnected from Linux, meaning U-Boot had to 
> write it in there).  In Qi, the bootloader can be updated by a packaged 
> update like anything else in the rootfs.

Can you explain to me why it was not possible to update U-Boot from
Linux? I cannot imagine a reason for such a restriction.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
I have made mistakes, but have never made the mistake of  claiming  I
never made one.                                     - James G. Bennet
