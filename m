Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E119449
	for <linux-embedded@vger.kernel.org>; Fri, 22 Dec 2023 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8snkHGv"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5542106d393so1542673a12.1
        for <linux-embedded@vger.kernel.org>; Thu, 21 Dec 2023 23:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703231331; x=1703836131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91ydJ7DnQi5E9kRtl2w33Jff4lxClnr2n6waotJkGkU=;
        b=V8snkHGv5sp0P2/wEs2dSLScng268UnofKJ8LLy1PeRrINvHvjMHjOspee9huSeRvx
         Orlhel4W/dxu209PxQ/SJbAK6gyVShX5WfyYs5cC7wIaJs7srqAlSB8StA2KoKU8td9V
         qvmazs38dK9ZfJBcRY+pDyF1YX1VZGWVbA7PaJj7/u6iuPXMRANgk04yJN8YBQ7ThbBf
         L/892KrHz0Mgn7QydzeNvvoFGp8S1/+K/C/JqihWPFPBIF/Hwc5o3yCbbUIt308ZwGBj
         qlmp/ELYcsy3Evnq35l+eaZwa6k68aKHduy8WtsufOqt8SGKKvmliXHo/LNtV1wSkSAy
         SxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703231331; x=1703836131;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91ydJ7DnQi5E9kRtl2w33Jff4lxClnr2n6waotJkGkU=;
        b=WZe33U/Uu4ogU7dgMpvkIF+LbFLzHm1fwYvIAje2byLJmiqETDZkgcuCZnYPCKRAPs
         yDQp8Lf3/MroQozxssCcQt55qh+zjzxYlv+WWT7zeueDGRcoDEt5Bo3ytOCxqlP7XEom
         SaiLe/D4QBpIoxEDRNV5K4PCEmCxL6oweLUHeUZ8vlU8tZzz1SFbuCCSiUu4TNDRIpL9
         +aQTjmOWVgnRWM/AwWKZoaMgxP0bL5Cp3HbWFPJGmehsFPMUYnlSSn6F2aLvDvmshAWF
         pwKdgXVtBIhQJp7yiVLWd2nLWs03TBlOy133a09lrjjswyeY6a9IvEsLQKQquAwXRSvi
         pGnQ==
X-Gm-Message-State: AOJu0YwfbQOfkiQrjxBwCXY/7/z9fm1MNM+x7bEwCYXo8Wg03EinRowE
	/ex1Vr2dsHoy8POieYPcm2c=
X-Google-Smtp-Source: AGHT+IHq8228TATtwNcBxJX+ieciTM+m9/lOPlRWgjs60bvUyHaI7EEvftQdH/27Q0iOqB2fQ02/cg==
X-Received: by 2002:a17:906:38da:b0:a23:56a6:97b6 with SMTP id r26-20020a17090638da00b00a2356a697b6mr518373ejd.66.1703231331180;
        Thu, 21 Dec 2023 23:48:51 -0800 (PST)
Received: from ?IPV6:2003:df:bf1f:bd00:f6ac:62b1:6388:5c29? (p200300dfbf1fbd00f6ac62b163885c29.dip0.t-ipconnect.de. [2003:df:bf1f:bd00:f6ac:62b1:6388:5c29])
        by smtp.gmail.com with ESMTPSA id jx23-20020a170906ca5700b00a269840ab2csm1785877ejb.208.2023.12.21.23.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 23:48:50 -0800 (PST)
Message-ID: <e9e8a7db-3ff9-44c6-aa00-2d42a1aafea5@gmail.com>
Date: Fri, 22 Dec 2023 08:48:50 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Debugging early SError exception
Content-Language: de-AT-frami
To: Lior Weintraub <liorw@pliops.com>, "hs@denx.de" <hs@denx.de>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <PR3P195MB05556D6B225E93A2B5BFFE88C391A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <b17b9901-5007-4d12-99d9-be531360227e@gmail.com>
 <PR3P195MB05550310B202221101564038C397A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <375eeb75-dde5-4806-a2d7-7f4e97342ee8@gmail.com>
 <PR3P195MB05553792B68C8A71BC08E4A5C395A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <b139c136-0417-4ac5-b99a-ba999d7418a0@gmail.com>
 <PR3P195MB0555AA259A8E616B6C5BA823C395A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <8140c4c7-10d5-46dc-8c32-8bee7bf95918@gmail.com>
 <a288e1c4-8637-34bc-b6a3-c9aa3edb22e6@denx.de>
 <PR3P195MB055563303A0E0E2BB3E07A98C394A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <PR3P195MB055563303A0E0E2BB3E07A98C394A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 22.12.23 um 08:03 schrieb Lior Weintraub:
> Hi,
> 
> I managed to dump the __log_buf but for some reason the UART is still not working.
> Please note that UART printed all the U-BOOT traces so AFAIU, the device tree is set correctly.
> (Barebox is passing it's DTB into kernel).
> 
> To enable the earlyprintk I have:
> 1. Compiled the kernel with CONFIG_EARLY_PRINTK=y and CONFIG_DEBUG_LL=y
> 2. Modified the boot args to include: "console=ttyS0,115200n8 earlycon=dw-apb-uart,0xd000307000"
> 3. Verified that dw-apb-uart driver (8250_early.c) supports earlycon:
> OF_EARLYCON_DECLARE(uart, "snps,dw-apb-uart", early_serial8250_setup);
> 
>  From __log_buf dump:
> Booting Linux on physical CPU 0x0000000000 [0x410fd034]4]
> Linux version 6.5.0 (pliops@dev-liorw) (aarch64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.02.1-95-g8391404e23) 11.3.0, GNU ld (GNU Binutils) 2.38) #107 SMP Thu Dec 21 17:33:12 IST 202323
> Machine model: Pliops Spider MK-I EVKVK
> efi: UEFI not found.d.
> Zone ranges:s:
>    DMA      [mem 0x0000000000000000-0x000000002fffffff]f]
>    DMA32    emptyty
>    Normal   emptyty
> Movable zone start for each nodede
> Early memory node rangeses
>    node   0: [mem 0x0000000000000000-0x000000002fffffff]f]
> Initmem setup node 0 [mem 0x0000000000000000-0x000000002fffffff]f]
> percpu: Embedded 25 pages/cpu s64800 r8192 d29408 u10240000
> pcpu-alloc: s64800 r8192 d29408 u102400 alloc=25*4096
> pcpu-alloc: [0] 0
> Detected VIPT I-cache on CPU0U0
> CPU features: GIC system register CPU interface present but disabled by higher exception levelel
> CPU features: detected: ARM erratum 84571919
> alternatives: applying boot alternativeses
> Kernel command line: console=ttyS0,115200n8 earlycon=dw-apb-uart,0xd00030700000
> Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)r)
> Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)r)
> Built 1 zonelists, mobility grouping on.  Total pages: 19353636
> mem auto-init: stack:off, heap alloc:off, heap free:offff
> software IO TLB: area num 1.1.
> software IO TLB: mapped [mem 0x000000002b080000-0x000000002f080000] (64MB)B)
> Memory: 689240K/786432K available (5824K kernel code, 1186K rwdata, 1612K rodata, 1600K init, 400K bss, 97192K reserved, 0K cma-reserved)d)
> SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1=1
> trace event string verifier disableded
> rcu: Hierarchical RCU implementation.n.
> rcu: 	RCU event tracing is enabled.d.
> rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=1.1.
> rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.s.
> rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1=1
> NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0 0
> GICv3: 96 SPIs implementeded
> GICv3: 0 Extended SPIs implementeded
> Root IRQ handler: gic_handle_irqrq
> GICv3: GICv3 features: 16 PPIsIs
> GICv3: CPU0: found redistributor 0 region 0:0x000000e00006000000
> GICv3: redistributor failed to wakeup.....
> GICv3: GIC: unable to set SRE (disabled at EL2), panic aheadad

I think the two messages above are the essential ones.

Maybe it helps to check

https://www.kernel.org/doc/html/v5.3/arm64/booting.html

In the middle of that page in the "Call the kernel image" it has 
something about GIC:

-- cut --
If the kernel is entered at EL1:

         ICC.SRE_EL2.Enable (bit 3) must be initialised to 0b1
         ICC_SRE_EL2.SRE (bit 0) must be initialised to 0b1.
-- cut --

> Internal error: Oops - Undefined instruction: 0000000062383019 [#1] SMPMP
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.5.0 #107
> Hardware name: Pliops Spider MK-I EVK (DT)
> pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : gic_cpu_sys_reg_init+0x58/0x2e4
> lr : gic_cpu_sys_reg_init+0x2a4/0x2e4
> sp : ffff8000808f3b40
> x29: ffff8000808f3b40 x28: 0000000000000000 x27: 0000000000000001
> x26: ffff000000016040 x25: 0000000000000000 x24: ffff800080a6b000
> x23: ffff8000808fc320 x22: ffff8000809cc000 x21: ffff00002fe74670
> x20: ffff800080a90000 x19: 0000000000000000 x18: fffffffffffe0b10
> x17: ffff8000809f9480 x16: fffffc0000002248 x15: ffff80008090af28
> x14: fffffffffffc0b0f x13: 6461656861206369 x12: 6e6170202c29324c
> x11: 452074612064656c x10: 6261736964282045 x9 : 6428204552532074
> x8 : ffff80008090af28 x7 : ffff8000808f3970 x6 : 000000000000000c
> x5 : 000000000000002a x4 : 0000000000000000 x3 : 0000000000000000
> x2 : 0000000000000000 x1 : ffff8000808fd0c0 x0 : 000000000000003c
> Call trace:
>   gic_cpu_sys_reg_init+0x58/0x2e4
>   gic_cpu_init.part.0+0xa8/0x114
>   gic_init_bases+0x408/0x684
>   gic_of_init+0x298/0x300
>   of_irq_init+0x1c8/0x368
>   irqchip_init+0x14/0x1c
>   init_IRQ+0x98/0xac
>   start_kernel+0x250/0x5b8
>   __primary_switched+0xb4/0xbc
> Code: 9260df39 d3441f33 d538cca0 36001180 (d538cc80) )
> ---[ end trace 0000000000000000 ]-----
> Kernel panic - not syncing: Attempted to kill the idle task!k!
> ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]-----
> 
> 
> The kernel panic is related to GIC distributor (currently under debug) but AFAIU,
> this has nothing to do with the UART not working on early stages.


Yes, I agree. GIC issue and UART (at least the polling mode) should be 
indendent.

Best regards

Dirk


> Thanks in advanced for your advice,
> Cheers,
> Lior.
>   
> 
> 
>> -----Original Message-----
>> From: Heiko Schocher <hs@denx.de>
>> Sent: Thursday, December 21, 2023 1:37 PM
>> To: Lior Weintraub <liorw@pliops.com>
>> Cc: Dirk Behme <dirk.behme@gmail.com>; linux-embedded@vger.kernel.org
>> Subject: Re: Debugging early SError exception
>>
>> [You don't often get email from hs@denx.de. Learn why this is important at
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> CAUTION: External Sender
>>
>> Hi Lior,
>>
>> On 21.12.23 12:19, Dirk Behme wrote:
>>> Am 21.12.23 um 11:04 schrieb Lior Weintraub:
>>>> Thanks Dirk,
>>>>
>>>> Regarding the earlyprintk, not sure I know how to make it work.
>>>> I have defined CONFIG_EARLY_PRINTK=y and CONFIG_DEBUG_LL=y on my
>> config but it doesn't seem to work.
>>>> Do I need to pass something in the bootargs from the U-BOOT?
>>>> Do I need to add that into my device tree?
>>>> (Tried to set bootargs = "console=ttyS0,115200 earlyprintk"; under "chosen"
>> on my DT but it didn't
>>>> work)
>>>
>>> Yes, what has to be enabled and what not and what has to be set how is often
>> confusing. I think this
>>> is not common for all systems, so I think to be on the safe side you have to look
>> into the code for
>>> you system. Or short; The code is the documentation ;)
>>>
>>>
>>>> The UART I am using is "snps,dw-apb-uart".
>>>>
>>>> Last week, to output the early logs I have implemented this hack:
>>>> 1. Modify printk macro to run my print_func
>>>> 2. This print_func wrote the characters into a single global variable (u32
>> simul_uart;)
>>>> 3. Get the address location of this global variable and extract all writes to it
>> from the Tarmac
>>>> logs.
>>>>
>>>> This is a very slow and tedious process but it helped me identify the initial
>> SError.
>>>> Initially I thought I can write directly into the UART FIFO register (which I know
>> the address)
>>>> but this didn't work because Linux already setup the MMU so I guess I need to
>> know the virtual
>>>> address of this FIFO.
>>>> Do I need to use __phys_to_virt of some sort?
>>>
>>> Yes, I think so. Have a look to the existing serial driver, too. It should do whats
>> needed, and you
>>> can borrow that, then.
>>
>> If you have access to the RAM after the crash (through a debugger or in
>> your bootloader) and your mem is stable, find out the address of __log_buf
>> in System.map. Thats the buffer where printk writes into it, and so dumping
>> the content is what you would see in case uart works...
>>
>> Hope it helps!
>>
>> bye,
>> Heiko
>>>
>>> Best regards
>>>
>>> Dirk
>>>
>>>
>>>> Cheers,
>>>> Lior.
>>>>
>>>>> -----Original Message-----
>>>>> From: Dirk Behme <dirk.behme@gmail.com>
>>>>> Sent: Thursday, December 21, 2023 10:30 AM
>>>>> To: Lior Weintraub <liorw@pliops.com>; linux-embedded@vger.kernel.org
>>>>> Subject: Re: Debugging early SError exception
>>>>>
>>>>> [You don't often get email from dirk.behme@gmail.com. Learn why this is
>>>>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>
>>>>> CAUTION: External Sender
>>>>>
>>>>> Am 21.12.23 um 08:43 schrieb Lior Weintraub:
>>>>>> Hi Dirk,
>>>>>>
>>>>>> We found that the issue was at the early stages of Barebox (a.k.a U-BOOT
>>>>> v2).
>>>>>
>>>>> Glad to hear that! :)
>>>>>
>>>>>> Our implementation of putc_ll (on debug_ll) was writing into the UART Tx
>>>>> FIFO without checking if the FIFO is full.
>>>>>> Once the fifo got full it caused this SError probably because the UART IP
>>>>> generated an apberror signal.
>>>>>
>>>>> Thanks for the report!
>>>>>
>>>>>> Now the Linux is running and doesn't report the SError again but now we
>>>>> face another issue.
>>>>>> We see that the PC is getting into a "report_bug" function.
>>>>>> The Linux doesn't print anything to the UART (probably since it hasn't got to
>>>>> the point where the console is configured?).
>>>>>
>>>>> For cases like this using earlyprintk is usually a good option. Check
>>>>> the Linux kernel serial console (UART) dirver of you SoC if it
>>>>> supports it. In the end it should be "just" a function in the serial
>>>>> console driver which outputs the console data via polling before
>>>>> (later) the interrupt driven console part takes over.
>>>>>
>>>>> Best regards
>>>>>
>>>>> Dirk
>>>>>
>>>>>
>>>>>> Since our debug means are limited it can take some time to find the root
>>>>> cause.
>>>>>>
>>>>>> I will keep you posted and update our findings.
>>>>>> Love to hear your thoughts,
>>>>>>
>>>>>> Cheers,
>>>>>> Lior.
>>>>>>
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Dirk Behme <dirk.behme@gmail.com>
>>>>>>> Sent: Tuesday, December 19, 2023 3:37 PM
>>>>>>> To: Lior Weintraub <liorw@pliops.com>; linux-embedded@vger.kernel.org
>>>>>>> Subject: Re: Debugging early SError exception
>>>>>>>
>>>>>>> [You don't often get email from dirk.behme@gmail.com. Learn why this is
>>>>>>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>>>
>>>>>>> CAUTION: External Sender
>>>>>>>
>>>>>>> Am 19.12.23 um 14:23 schrieb Lior Weintraub:
>>>>>>>> Thanks Dirk,
>>>>>>>
>>>>>>> Welcome :)
>>>>>>>
>>>>>>> In case you find the root cause it would be nice to get some generic
>>>>>>> description of it so that we can learn something :)
>>>>>>>
>>>>>>> Best regards
>>>>>>>
>>>>>>> Dirk
>>>>>>>
>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: Dirk Behme <dirk.behme@gmail.com>
>>>>>>>>> Sent: Tuesday, December 19, 2023 9:09 AM
>>>>>>>>> To: Lior Weintraub <liorw@pliops.com>; linux-
>>>>> embedded@vger.kernel.org
>>>>>>>>> Subject: Re: Debugging early SError exception
>>>>>>>>>
>>>>>>>>> [You don't often get email from dirk.behme@gmail.com. Learn why this
>>>>> is
>>>>>>>>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>>>>>
>>>>>>>>> CAUTION: External Sender
>>>>>>>>>
>>>>>>>>> Am 17.12.23 um 22:32 schrieb Lior Weintraub:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> We have a new SoC with eLinux porting (kernel v6.5).
>>>>>>>>>> This SoC is ARM64 (A53) single core based device.
>>>>>>>>>> It runs correctly on QEMU but fails with SError on emulation platform
>>>>>>>>> (Synopsys Zebu running our SoC model).
>>>>>>>>>> There is no debugger connected to this emulation but there are several
>>>>>>>>> debug capabilities we can use:
>>>>>>>>>> 1. Generating wave dump of CPU signals
>>>>>>>>>> 2. Generate a Tarmac log
>>>>>>>>>> 3. UART
>>>>>>>>>>
>>>>>>>>>> Since the SError happens at early stages of Linux boot the UART is not
>>>>>>>>> enabled yet.
>>>>>>>>>>      From the Tarmac log we can see:
>>>>>>>>>>       3824884521 ps  ES  (ffff800080760888:d65f03c0) O el1h_ns:   ret
>>>>>>>>> (parse_early_param)
>>>>>>>>>>       3824884522 ps  ES  (ffff800080763a60:d2801800) O el1h_ns:   mov
>>>>>>> x0,
>>>>>>>>> #0xc0   //      #192    (setup_arch)
>>>>>>>>>>                          R X0 (AARCH64) 00000000 000000c0
>>>>>>>>>>       3824884523 ps  ES  (ffff800080763a64:d51b4220) O el1h_ns:   msr
>>>>>>>>> daif,   x0      (setup_arch)
>>>>>>>>>>                          R CPSR 600000c5
>>>>>>>>>>       3824884529 ps  ES  System Error (Abort)
>>>>>>>>>>                          EXC [0x380] SError/vSError Current EL with SP_ELx
>>>>>>>>>>                          R ESR_EL1 (AARCH64) bf000002
>>>>>>>>>>                          R CPSR 600003c5
>>>>>>>>>>                          R SPSR_EL1 (AARCH64) 600000c5
>>>>>>>>>>                          R ELR_EL1 (AARCH64) ffff8000 80763a68
>>>>>>>>>>       3824884925 ps  ES  (ffff800080010b80:d10543ff) O el1h_ns:   sub
>>>>>>> sp,
>>>>>>>>> sp,     #0x150  (vectors)
>>>>>>>>>>                          R SP_EL1 (AARCH64) ffff8000 808f3c50
>>>>>>>>>>       3824884925 ps  ES  (ffff800080010b84:8b2063ff) O el1h_ns:   add
>>>>>>> sp,
>>>>>>>>> sp,     x0      (vectors)
>>>>>>>>>>                          R SP_EL1 (AARCH64) ffff8000 808f3d10
>>>>>>>>>>       3824884926 ps  ES  (ffff800080010b88:cb2063e0) O el1h_ns:   sub
>>>>>>> x0,
>>>>>>>>> sp,     x0      (vectors)
>>>>>>>>>>                          R X0 (AARCH64) ffff8000 808f3c50
>>>>>>>>>>       3824884927 ps  ES  (ffff800080010b8c:37700080) O el1h_ns:   tbnz
>>>>>>> w0,
>>>>>>>>> #14,    ffff800080010b9c        <vectors+0x39c>         (vectors)
>>>>>>>>>>       3824884935 ps  ES  (ffff800080010b90:cb2063e0) O el1h_ns:   sub
>>>>>>> x0,
>>>>>>>>> sp,     x0      (vectors)
>>>>>>>>>>                          R X0 (AARCH64) 00000000 000000c0
>>>>>>>>>>       3824884937 ps  ES  (ffff800080010b94:cb2063ff) O el1h_ns:   sub
>>>>> sp,
>>>>>>>>> sp,     x0      (vectors)
>>>>>>>>>>                          R SP_EL1 (AARCH64) ffff8000 808f3c50
>>>>>>>>>>       3824884938 ps  ES  (ffff800080010b98:140001ef) O el1h_ns:   b
>>>>>>>>> ffff800080011354        <el1h_64_error>         (vectors)
>>>>>>>>>>
>>>>>>>>>> If I understand correctly, the exception happened sometime earlier
>> and
>>>>>>> only
>>>>>>>>> now Linux boot code (setup_arch) opened the exception handling and as
>>>>> a
>>>>>>>>> result we immediately jump to the SError exception handler.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Yes, that sounds reasonable. If I understood correctly, you are
>>>>>>>>> running something "quite new" on some software (QEMU) and
>>>>> hardware
>>>>>>>>> (Synopsis) simulators.
>>>>>>>>>
>>>>>>>>> That would mean that you have new hardware with e.g. new memory
>>>>> map
>>>>>>>>> not used before. What you describe might sound like in the code before
>>>>>>>>> Linux (boot loader) there is anything resulting in the SError. This
>>>>>>>>> might be an access to non-existing or non-enabled hardware. I.e. it
>>>>>>>>> might be that you try to access (read/write) an address what is not
>>>>>>>>> available, yet (or just invalid). It's hard to debug that. In case you
>>>>>>>>> are able to modify the code before Linux (the boot loader?) you might
>>>>>>>>> try to enable SError exceptions, there, too. To get it earlier and
>>>>>>>>> with that make the search window smaller. I'm not that familiar with
>>>>>>>>> QEMU, but could you try to trace which (all?) hardware accesses your
>>>>>>>>> code does. And with that analyse all accesses and with that check if
>>>>>>>>> all these accesses are valid even on the hardware (Synopsis) emulation
>>>>>>>>> system? That should be checked from valid address and from hardware
>>>>>>>>> subsystem enablement point of view.
>>>>>>>>>
>>>>>>>>> Hth,
>>>>>>>>>
>>>>>>>>> Dirk
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>      From the Linux source:
>>>>>>>>>>           parse_early_param();
>>>>>>>>>>
>>>>>>>>>>           dynamic_scs_init();
>>>>>>>>>>
>>>>>>>>>>           /*
>>>>>>>>>>            * Unmask asynchronous aborts and fiq after bringing up possible
>>>>>>>>>>            * earlycon. (Report possible System Errors once we can report
>> this
>>>>>>>>>>            * occurred).
>>>>>>>>>>            */
>>>>>>>>>>           local_daif_restore(DAIF_PROCCTX_NOIRQ); <---- This is when we
>>>>> get
>>>>>>> the
>>>>>>>>> exception.
>>>>>>>>>>
>>>>>>>>>> After some kernel hacking (replacing printk) we could extract the logs:
>>>>>>>>>> 6Booting Linux on physical CPU 0x0000000000 [0x410fd034]
>>>>>>>>>> 5Linux version 6.5.0 (pliops@dev-liorw) (aarch64-buildroot-linux-gnu-
>>>>>>>>> gcc.br_real (Buildroot 2023.02.1-95-g8391404e23) 11.3.0, GNU ld
>>>>> (GNU
>>>>>>>>> Binutils) 2.38) #101 SMP Sun Dec 17 20:09:06 IST 2023
>>>>>>>>>> 6Machine model: Pliops Spider MK-I EVK
>>>>>>>>>> 2SError Interrupt on CPU0, code 0x00000000bf000002 -- SError
>>>>>>>>>> CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0 #101
>>>>>>>>>> Hardware name: Pliops Spider MK-I EVK (DT)
>>>>>>>>>> pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>>>>>>> pc : setup_arch+0x13c/0x5ac
>>>>>>>>>> lr : setup_arch+0x134/0x5ac
>>>>>>>>>> sp : ffff8000808f3da0
>>>>>>>>>> x29: ffff8000808f3da0c x28: 0000000008758074c x27:
>>>>>>>>> 0000000005e31b58c
>>>>>>>>>> x26: 0000000000000001c x25: 0000000007e5f728c x24:
>>>>>>>>> ffff8000808f8000c
>>>>>>>>>> x23: ffff8000808f8600c x22: ffff8000807b6000c x21:
>>>>>>> ffff800080010000c
>>>>>>>>>> x20: ffff800080a1e000c x19: fffffbfffddfe190c x18:
>>>>> 000000002266684ac
>>>>>>>>>> x17: 00000000fcad60bbc x16: 0000000000001800c x15:
>>>>>>>>> 0000000000000008c
>>>>>>>>>> x14: ffffffffffffffffc x13: 0000000000000000c x12:
>>>>> 0000000000000003c
>>>>>>>>>> x11: 0101010101010101c x10: ffffffffffee87dfc x9 :
>>>>>>> 0000000000000038c
>>>>>>>>>> x8 : 0101010101010101c x7 : 7f7f7f7f7f7f7f7fc x6 :
>>>>>>> 0000000000000001c
>>>>>>>>>> x5 : 0000000000000000c x4 : 8000000000000000c x3 :
>>>>>>>>> 0000000000000065c
>>>>>>>>>> x2 : 0000000000000000c x1 : 0000000000000000c x0 :
>>>>>>>>> 00000000000000c0c
>>>>>>>>>> 0Kernel panic - not syncing: Asynchronous SError Interrupt
>>>>>>>>>> CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0 #101
>>>>>>>>>> Hardware name: Pliops Spider MK-I EVK (DT)
>>>>>>>>>> Call trace:
>>>>>>>>>>       dump_backtrace+0x9c/0xd0
>>>>>>>>>>       show_stack+0x14/0x1c
>>>>>>>>>>       dump_stack_lvl+0x44/0x58
>>>>>>>>>>       dump_stack+0x14/0x1c
>>>>>>>>>>       panic+0x2e0/0x33c
>>>>>>>>>>       nmi_panic+0x68/0x6c
>>>>>>>>>>       arm64_serror_panic+0x68/0x78
>>>>>>>>>>       do_serror+0x24/0x54
>>>>>>>>>>       el1h_64_error_handler+0x2c/0x40
>>>>>>>>>>       el1h_64_error+0x64/0x68
>>>>>>>>>>       setup_arch+0x13c/0x5ac
>>>>>>>>>>       start_kernel+0x5c/0x5b8
>>>>>>>>>>       __primary_switched+0xb4/0xbc
>>>>>>>>>> 0---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
>>>>>>>>>>
>>>>>>>>>> Can you please advice how to proceed with debugging?
>>>>>>>>>>
>>>>>>>>>> Thanks in advanced,
>>>>>>>>>> Cheers,
>>>>>>>>>> Lior.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>
>>>
>>
>> --
>> DENX Software Engineering GmbH,      Managing Director: Erika Unter
>> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
>> Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

