From: Dirk Behme <dirk.behme@googlemail.com>
Subject: Re: New fast(?)-boot results on ARM
Date: Sat, 15 Aug 2009 07:59:32 +0200
Message-ID: <4A864EC4.7070907@googlemail.com>
References: <20090814170228.GM13320@pengutronix.de> <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com> <20090814204305.GA31727@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=69k8rX9bYKcRY7faHVnJhDvFhGP+ugonwFDyRC1WiJk=;
        b=KjY0bqf7IIvQ/t1FFHjj4eNN6Ct/VYwG1kJAYT0PxU2r3EPijp59FczQuz7sxFeEqv
         XQDtzPlxM/p7AdWRjnFjX5tennZjCf+lVi1yYqHQn2Gge0Jc4sQuhKhQo7iSJrhnE+Ko
         P8gyXMkmU8duq9GBaD5yR7lXCk9MYUBq70PBc=
In-Reply-To: <20090814204305.GA31727@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Denys Vlasenko <vda.linux@googlemail.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

Robert Schwebel wrote:
> On Fri, Aug 14, 2009 at 10:04:57PM +0200, Denys Vlasenko wrote:
>>> rsc@thebe:~$ microcom | ptx_ts "U-Boot 2.0.0-rc9"
>>> [  2.395740] <  2.395740>
>>> [  2.395860] <  0.000120>
>>> [  0.000011] <  0.000011> U-Boot 2.0.0-rc9 (Aug  5 2009 - 10:05:58)
>>> [  0.000059] <  0.000048>
>>> [  0.003823] <  0.003764> Board: Phytec phyCORE-i.MX27
>>> [  0.010753] <  0.006930> cfi_probe: cfi_flash base: 0xc0000000 size: 0x02000000
>>> [  0.018711] <  0.007958> NAND device: Manufacturer ID: 0x20, Chip ID: 0x36 (ST Micro NAND 64MiB 1,8V 8-bit)
>>> [  0.026592] <  0.007881> imxfb@imxfb0: i.MX Framebuffer driver
>>> [  0.178655] <  0.152063> dev_protect: currently broken
>>> [  0.178736] <  0.000081> Using environment in NOR Flash
>>> [  0.182577] <  0.003841> initialising PLLs
>>> [  0.367142] <  0.184565> Malloc space: 0xa3f00000 -> 0xa7f00000 (size 64 MB)
>>> [  0.370568] <  0.003426> Stack space : 0xa3ef8000 -> 0xa3f00000 (size 32 kB)
>>> [  0.445993] <  0.075425> running /env/bin/init...
>>> [  0.870592] <  0.424599>
>>> [  0.874559] <  0.003967> Hit any key to stop autoboot:  0
>> boot loader is not fast. considering its simple task, it can be made
>> faster.
> 
> Yup, will check. Almost 1 s seems really long.

Some things to check regarding this and kernel uncompression (copy):

- How often is (compressed/uncompressed) kernel data copied? Once the 
compressed one from storage (NOR/NAND?) to RAM by boot loader? Then by 
kernel's uncompression from RAM to it's final location in RAM?

- For boot loader and uncompression, is D-Cache enabled?

- Is data (image) copy done by optimized functions? Using (a) DMA or 
at least (b) some optimized memcpy using ARM's ldmia/stmia?

Best regards

Dirk
