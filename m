From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: PCI device support in Open Firmware (device tree syntax)
Date: Tue, 30 Jun 2009 15:33:11 +0800
Message-ID: <cb9ecdfa0906300033x4dfcc315gfd67522b77f6004a@mail.gmail.com>
References: <cb9ecdfa0906290858x125b8149na037f33258c21426@mail.gmail.com>
	 <20090629165133.GC1323@b07421-ec1.am.freescale.net>
	 <cb9ecdfa0906291836mf74c41fn9c187e305771920a@mail.gmail.com>
	 <2ea1731b0906292329t30cdc9a6q1fc36dc2273a2931@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=HA196dPXTJLakbSnqJ8Yeb+Eq5kuK2L4TJteJ4LzCRE=;
        b=UxnQYkp9vwtXi3GhnL1vaJKizGyaKmuWUeREJ+od7y0qZbHLG82j5ZGOiJN+IaYXDI
         qZYnFr0bwsy8+xEgpLKueaiJEMH5vssyg36jDTClZI1duwNQPyMYtXkwL7dT47WQafuO
         DSuOasBFD5sY4NWwqwOorpSW/+S3DuJ6pvVfM=
In-Reply-To: <2ea1731b0906292329t30cdc9a6q1fc36dc2273a2931@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@gmail.com>, linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

2009/6/30 Marco Stornelli <marco.stornelli@gmail.com>:
> 2009/6/30 Johnny Hung <johnny.hacking@gmail.com>:
>> Thanks for your reply. So there are no PCI device resource info in
>> flat device tree.
>> How do PCI device resources be assign in general case or is there any example?
>> I am so confusing, would you please give me detailed describle?
>>
>> BRs, H. Johnny
>>>
>
> You should look at your bootloader about the initial configuration of
> the pci device, in general it should (more or less) do the work of
> BIOS as you said. After that the kernel can probe them.
>
> Marco
>
You are right. u-boot do PCI device BAR resources assign and flat
device tree describe PCI device interrupt-map. I use "lspci -s xxx -x"
for the PCI device, the resources was assigned properly.
Thanks.

BRs, H. Johnny
