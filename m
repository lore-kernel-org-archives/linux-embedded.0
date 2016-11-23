From: Nicolas Beland <Nicolas.Beland@dialogic.com>
Subject: mpc8572e linux kernel board bring-up problem
Date: Wed, 23 Nov 2016 14:00:48 +0000
Message-ID: <MWHPR01MB2623BDB22229B22DFF06DDC2ECB70@MWHPR01MB2623.prod.exchangelabs.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogic1.onmicrosoft.com; s=selector1-Dialogic-Com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YqT++EsYdau+kF1FWpmMvxTnyYEfRwGS3YpdwLNaIjQ=;
 b=vgO+zN4Gj5A9UAzVoLxUwNvqHL4WQWQ2TgBUoC2w3i58lHu3KFEV+XIXt0roO7tYFCSUrxwdeeVyZcLS2QEZyILEI3RtvrDPHseCxGuLSKuJmYV/Hh62npcOOsaMQkYpWlGcpva2a+AWjXu96qP+soYNQKjfpq5Y3tNe2eRZsNU=
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hi everyone!=20

I got lucky and got an embedded linux internship:)

I'm trying to port linux to an existing board that is currently using vxWor=
ks.=20
The board uses an mpc8572e processor which contains two e500v2 cores. Basic=
ally, the entry point in vmlinux is arch/powerpc/kernel/head_fsl_booke.S=20

We are using the simpleboot bootwrapper which works just fine (simpleboot p=
asses the device tree address and jump right into the gunziped vmlinux whic=
h is located at 0x0 physical).=20

head_fsl_booke.S include arch/powerpc/kernel/fsl_booke_entry_mapping.S and =
we just crash at line 223 (rfi instruction) of fsl_booke_entry_mapping.S=20

215 lis r7,MSR_KERNEL@h=20
216 ori r7,r7,MSR_KERNEL@l=20
217 bl 1f /* Find our address */=20
218 1: mflr r9=20
219 rlwimi r6,r9,0,20,31=20
220 addi r6,r6,(2f - 1b)=20
221 mtspr SPRN_SRR0,r6=20
222 mtspr SPRN_SRR1,r7=20
223 rfi /* start execution out of TLB1[0] entry */=20

rfi at line 223 causes us to jump to 0xc000_0264 while we want to jump to 0=
x000_0264.=20
This is not caused by our mmu, we are basically loading 0xc000_0264 in srr0=
=20

I think it's related to the following config fields in our defconfig:=20
CONFIG_PAGE_OFFSET=3D0xc0000000 <----=20
CONFIG_PHYSICAL_START=3D0x00000000=20
CONFIG_PHYSICAL_ALIGN=3D0x04000000=20
CONFIG_TASK_SIZE=3D0xc0000000=20
CONFIG_KERNEL_START=3D0xc00000000 <-----=20

I tried to set CONFIG_KERNEL_START and CONFIG_PAGE_OFFSET to 0x0 but this w=
ould not compile:=20
arch/powerpc/include/asm/processor.h:100:2: error: #error User TASK_SIZE ov=
erlaps with KERNEL_START address=20

By the way CONFIG_TASK_SIZE=3D0xc0000000=20

Also, my debugger cannot map anything because all the symbols in vmlinux ar=
e at 0xcxxx_xxxx but we are at 0x0xxx_xxxx=20

Pretty much all the ports that uses the simpleboot bootwrapper are gunzippi=
ng vmlinux at 0x0 but I can easily change that and I tried to send vmlinux =
at 0xc000_0000 and it solved this particular issue but then the mmu mapping=
 just does not work because simpleboot extract our device tree at about 0x0=
011_0000 and we need vmlinux and the device tree to be inside a 64Mb page (=
also tried to hack fsl_booke_entry_mapping.S to create a 4GB tlb entry base=
d at 0x0 and this was causing other issues...)=20

Got any idea?=20
Also, I found out that __machine_desc_start is invalid (I see .long 0x0 as =
value in my on-chip debugger for this symbol when I tried to use a 4GB tlb =
entry.). This was causing me issues in probe_machine() located in arch/powe=
rpc/kernel/setup-common.c when I tried the 4GB tlb approach. The 4GB tlb en=
try was also causing issues with the __va() macro (it was doing address tra=
nslation from physical to virtual address) so I was removing the calls to t=
hat macro to make it work. but I don't really wan't to hack the kernel all =
over the place because I don't understand how it's supposed to be done. I s=
uppose it's somehow still related to the configs above? For the 4GB tlb ent=
ry I want  __va() to return what it received because we are using a 1:1 map=
ping.
Btw, I'm on the right mailing list?

Thanks!

Nicolas B=E9land
Dialogic Inc. Montreal (Canada)
Nicolas.Beland@dialogic.com
