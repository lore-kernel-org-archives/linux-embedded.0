From: Robin Theunis <robint91@gmail.com>
Subject: Re: ARM target not boot after remap memory
Date: Mon, 13 Sep 2010 21:12:56 +0200
Message-ID: <AANLkTim+Yt3BHmdTUeEAEquz8u4pYMqcr5mzxp1uX=r4@mail.gmail.com>
References: <AANLkTi=tWwaFHB0DY=j0UaqbYdYJpGJpmWdGC4aMufSw@mail.gmail.com>
	<20100913121247.GA4003@sig21.net>
	<AANLkTiksacwuOwqJGZ0F3M1jhZ6Srr88wbfBQodOGOAt@mail.gmail.com>
	<20100913172606.GA14462@sig21.net>
	<AANLkTinzchkOZ67+wVXejLb+UqLRCu+zrzVB4j5zG2_w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Ut0K0j8dz1o7X1thV57YYP3JJzx/mRhRznrDLVA6iTA=;
        b=xHEnnLpJ1nmEXr2MuKwu1LWvHZYVtx+6ezq26P9MoN8QquuoKAynUWHIWbBJYY/tkL
         K28RHc45r38+bQ8k1Q9z2Pfhu0y1eo8mEef97dUkFESewIPrjrth1cS72P0MqRneZBGE
         1Co3YOfBv/Z2VYiWcYzWguGMo3aFGXu6XeZvg=
In-Reply-To: <AANLkTinzchkOZ67+wVXejLb+UqLRCu+zrzVB4j5zG2_w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Johannes Stezenbach <js@sig21.net>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Solved that problem. Typo in my mach types.
Now the next problem:

<5>Linux version 2.6.34.1robin9200v1.0 (robin@pc-robin) (gcc version
4.3.5 (Buildroot 2010.08) ) #37 Mon Sep 13 20:57:43 CEST 2010
<4>CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=3Dc0007177
<4>CPU: VIVT data cache, VIVT instruction cache
<4>Machine: Robin9200
<6>bootconsole [earlycon0] enabled
<4>Memory policy: ECC disabled, Data cache writeback
<7>On node 0 totalpages: 16384
<7>free_area_init_node: node 0, pgdat c037f45c, node_mem_map c0394000
<7>  Normal zone: 128 pages used for memmap
<7>  Normal zone: 0 pages reserved
<7>  Normal zone: 16256 pages, LIFO batch:3
<4>Clocks: CPU 179 MHz, master 59 MHz, main 18.432 MHz
<4>Built 1 zonelists in Zone order, mobility grouping on.  Total pages:=
 16256
<1>Unable to handle kernel paging request at virtual address fefc4014
<1>pgd =3D c0004000
<1>[fefc4014] *pgd=3D20417051, *pte=3D00000000, *ppte=3D00000000
<0>Internal error: Oops: 27 [#1]
<0>last sysfs file:
<4>Modules linked in:
<4>CPU: 0    Not tainted  (2.6.34.1robin9200v1.0 #37)
<4>PC is at printascii+0x14/0x50
<4>LR is at early_write+0x28/0x5c
<4>pc : [<c0026180>]    lr : [<c0026218>]    psr: 200000d3
<4>sp : c0361e88  ip : c0361ea4  fp : c0361ea0
<4>r10: fffffd3e  r9 : c0366084  r8 : c0366084
<4>r7 : c0366080  r6 : 0000004b  r5 : c03806b7  r4 : 00000001
<4>r3 : fefc4000  r2 : 0000004b  r1 : 00000042  r0 : 00000000
<4>Flags: nzCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM  Segment kerne=
l
<4>Control: c000717f  Table: 20004000  DAC: 00000017
<0>Process swapper (pid: 0, stack limit =3D 0xc03

What does it mean?

Robin

2010/9/13 Robin Theunis <robint91@gmail.com>:
> The __log_buf
>
> <5>Linux version 2.6.34.1robin9200v1.0 (robin@pc-robin) (gcc version
> 4.3.5 (Buildroot 2010.08) ) #36 Mon Sep 13 15:18:08 CEST 2010
> <4>CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=3Dc0007177
> <4>CPU: VIVT data cache, VIVT instruction cache
> <4>Machine configuration botched (nr 251), unable to continue.
>
> I don't understand it. What does it means? I have my mach types setup=
 correctly.
>
> Robin
>
> 2010/9/13 Johannes Stezenbach <js@sig21.net>:
>> On Mon, Sep 13, 2010 at 04:30:17PM +0200, Robin Theunis wrote:
>>>
>>> I have compiled =A0the kernel with early printk on and debug_LL, It=
 still
>>> doesn't nothing after that line.
>>
>> Please don't top-post.
>>
>> Did you add "earlyprintk" to your kernel command line
>> like the EARLY_PRINTK menuconfig help text suggests?
>>
>> arch/arm/mach-at91/include/mach/debug-macro.S also suggests
>> the LL debug output goes to AT91 debug unit not to normal UART
>> (not sure about this, I don't know much about AT91).
>> Did you try to dump __log_buf using JTAG?
>>
>>
>> HTH
>> Johannes
>>
>
