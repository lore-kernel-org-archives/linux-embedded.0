From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Mon, 21 Dec 2009 20:17:31 +0000
Message-ID: <4B2FD7DB.10008@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> <20091221193038.38CB63F6EF@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Mqm+eJVmAvVQtcePfEGhdmAi+zR3yEtCpv5SQHvWcts=;
        b=xNLhzOjgYtRul0sTa7YSc622cagevKy7yCn9gJ1dw4SsjK+sjErF9GzXKjRwZDCNpj
         WjbOOJJR+niXC42lyQt7WSqKovcPJydMkI4nVT/91RT9Js9wjK8kpHncTUtJwErCeGjw
         3iS/TwFUAeVMVbcMz3uk+RQcNDwnd2nGFbVUk=
In-Reply-To: <20091221193038.38CB63F6EF@gemini.denx.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Wolfgang Denk <wd@denx.de>
Cc: Matt Hsu <matt@0xlab.org>, linux-embedded@vger.kernel.org, celinux-dev@tree.celinuxforum.org

On 12/21/09 19:30, Somebody in the thread at some point said:

Hi -

Let me add back the context for this quote:

''While working at Openmoko maintaining their kernel, it became obvious 
that U-Boot was turning into a mini-me for Linux.  Many cut-down Linux 
drivers were appearing there, there was a shell with an environment 
holding private states ...''

>> Another big problem with U-Boot was the inability to update the
>> bootloader from the Linux world.  Instead the bootloader was treated
>> special and had to be updated over USB with DFU (the exclusivity of it
>> enforced by an ECC policy disconnected from Linux, meaning U-Boot had to
>> write it in there).  In Qi, the bootloader can be updated by a packaged
>> update like anything else in the rootfs.
>
> Can you explain to me why it was not possible to update U-Boot from
> Linux? I cannot imagine a reason for such a restriction.

I was talking about GTA02 specifically here, it was (and still is AFAIK) 
only updateable by DFU for the bootloader.  We had kernels with soft ECC 
that differed from the ECC / bad block marking generated and used by the 
s3c2442 NAND hardware unit.  If U-Boot wrote it, it could at least read 
it again.  So DFU was / is the only official way to update GTA02 bootloader.

As you say nothing generally stops update of U-Boot from Linux same as 
anything else can be updated from there, if Linux can write those NAND 
sectors with ECC / BBT that the bootloader can understand or ignore, and 
Linux can understand and comply with / update the BBT scheme of U-Boot.

Another benefit of SD Card boot is that it regularizes the bootloader 
physical storage, so these issues don't exist and it can always be 
updated from Linux.

-Andy
