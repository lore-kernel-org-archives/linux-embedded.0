Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9EE4F60D
	for <linux-embedded@vger.kernel.org>; Thu, 21 Dec 2023 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="A3hdvsam"
Received: from [192.168.1.107] (82-131-158-203.pool.digikabel.hu [82.131.158.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2A666876B4;
	Thu, 21 Dec 2023 12:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1703158629;
	bh=51ym+32mLCmJGcWvjKPhuo71f1sFgxFUoZOZJFiP7sE=;
	h=Subject:To:References:Cc:Reply-To:From:Date:In-Reply-To:From;
	b=A3hdvsamfdOke9WHHpQcHT8C74W5U3O68y6QgYc+TAt2fP94N8R70AUU/tH4NWf0O
	 3a4cUMkptORoVyIS67MKOwLwm8XV0bKJJ28zGP9Up76UW3yM0L4kxTcsKRbrYTkKUx
	 xdFKfiSBcQWYezF8AqEELZnlo60fExmlljLFBRBesOXFdKdLjDITPO8uSJwIXtE4Uw
	 VrNH0IKJNw6qp4xQJs0z+wb8AxpaOLxMGF+XNmmBmDybDkiea9y1oeNAZg33dzPMbt
	 FZfGgAM6wT35RFOH1+wAjUp592dql435vXUiV2Pc1Ewg2GVSNM2SsmVgmSHcpW231h
	 ft+ScW8+ATwaA==
Subject: Re: Debugging early SError exception
To: Lior Weintraub <liorw@pliops.com>
References: <PR3P195MB05556D6B225E93A2B5BFFE88C391A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <b17b9901-5007-4d12-99d9-be531360227e@gmail.com>
 <PR3P195MB05550310B202221101564038C397A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <375eeb75-dde5-4806-a2d7-7f4e97342ee8@gmail.com>
 <PR3P195MB05553792B68C8A71BC08E4A5C395A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <b139c136-0417-4ac5-b99a-ba999d7418a0@gmail.com>
 <PR3P195MB0555AA259A8E616B6C5BA823C395A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <8140c4c7-10d5-46dc-8c32-8bee7bf95918@gmail.com>
Cc: Dirk Behme <dirk.behme@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
Message-ID: <a288e1c4-8637-34bc-b6a3-c9aa3edb22e6@denx.de>
Date: Thu, 21 Dec 2023 12:36:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8140c4c7-10d5-46dc-8c32-8bee7bf95918@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Hi Lior,

On 21.12.23 12:19, Dirk Behme wrote:
> Am 21.12.23 um 11:04 schrieb Lior Weintraub:
>> Thanks Dirk,
>>
>> Regarding the earlyprintk, not sure I know how to make it work.
>> I have defined CONFIG_EARLY_PRINTK=y and CONFIG_DEBUG_LL=y on my config but it doesn't seem to work.
>> Do I need to pass something in the bootargs from the U-BOOT?
>> Do I need to add that into my device tree?
>> (Tried to set bootargs = "console=ttyS0,115200 earlyprintk"; under "chosen" on my DT but it didn't
>> work)
> 
> Yes, what has to be enabled and what not and what has to be set how is often confusing. I think this
> is not common for all systems, so I think to be on the safe side you have to look into the code for
> you system. Or short; The code is the documentation ;)
> 
> 
>> The UART I am using is "snps,dw-apb-uart".
>>
>> Last week, to output the early logs I have implemented this hack:
>> 1. Modify printk macro to run my print_func
>> 2. This print_func wrote the characters into a single global variable (u32 simul_uart;)
>> 3. Get the address location of this global variable and extract all writes to it from the Tarmac
>> logs.
>>
>> This is a very slow and tedious process but it helped me identify the initial SError.
>> Initially I thought I can write directly into the UART FIFO register (which I know the address)
>> but this didn't work because Linux already setup the MMU so I guess I need to know the virtual
>> address of this FIFO.
>> Do I need to use __phys_to_virt of some sort?
> 
> Yes, I think so. Have a look to the existing serial driver, too. It should do whats needed, and you
> can borrow that, then.

If you have access to the RAM after the crash (through a debugger or in
your bootloader) and your mem is stable, find out the address of __log_buf
in System.map. Thats the buffer where printk writes into it, and so dumping
the content is what you would see in case uart works...

Hope it helps!

bye,
Heiko
> 
> Best regards
> 
> Dirk
> 
> 
>> Cheers,
>> Lior.
>>
>>> -----Original Message-----
>>> From: Dirk Behme <dirk.behme@gmail.com>
>>> Sent: Thursday, December 21, 2023 10:30 AM
>>> To: Lior Weintraub <liorw@pliops.com>; linux-embedded@vger.kernel.org
>>> Subject: Re: Debugging early SError exception
>>>
>>> [You don't often get email from dirk.behme@gmail.com. Learn why this is
>>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> CAUTION: External Sender
>>>
>>> Am 21.12.23 um 08:43 schrieb Lior Weintraub:
>>>> Hi Dirk,
>>>>
>>>> We found that the issue was at the early stages of Barebox (a.k.a U-BOOT
>>> v2).
>>>
>>> Glad to hear that! :)
>>>
>>>> Our implementation of putc_ll (on debug_ll) was writing into the UART Tx
>>> FIFO without checking if the FIFO is full.
>>>> Once the fifo got full it caused this SError probably because the UART IP
>>> generated an apberror signal.
>>>
>>> Thanks for the report!
>>>
>>>> Now the Linux is running and doesn't report the SError again but now we
>>> face another issue.
>>>> We see that the PC is getting into a "report_bug" function.
>>>> The Linux doesn't print anything to the UART (probably since it hasn't got to
>>> the point where the console is configured?).
>>>
>>> For cases like this using earlyprintk is usually a good option. Check
>>> the Linux kernel serial console (UART) dirver of you SoC if it
>>> supports it. In the end it should be "just" a function in the serial
>>> console driver which outputs the console data via polling before
>>> (later) the interrupt driven console part takes over.
>>>
>>> Best regards
>>>
>>> Dirk
>>>
>>>
>>>> Since our debug means are limited it can take some time to find the root
>>> cause.
>>>>
>>>> I will keep you posted and update our findings.
>>>> Love to hear your thoughts,
>>>>
>>>> Cheers,
>>>> Lior.
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Dirk Behme <dirk.behme@gmail.com>
>>>>> Sent: Tuesday, December 19, 2023 3:37 PM
>>>>> To: Lior Weintraub <liorw@pliops.com>; linux-embedded@vger.kernel.org
>>>>> Subject: Re: Debugging early SError exception
>>>>>
>>>>> [You don't often get email from dirk.behme@gmail.com. Learn why this is
>>>>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>
>>>>> CAUTION: External Sender
>>>>>
>>>>> Am 19.12.23 um 14:23 schrieb Lior Weintraub:
>>>>>> Thanks Dirk,
>>>>>
>>>>> Welcome :)
>>>>>
>>>>> In case you find the root cause it would be nice to get some generic
>>>>> description of it so that we can learn something :)
>>>>>
>>>>> Best regards
>>>>>
>>>>> Dirk
>>>>>
>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Dirk Behme <dirk.behme@gmail.com>
>>>>>>> Sent: Tuesday, December 19, 2023 9:09 AM
>>>>>>> To: Lior Weintraub <liorw@pliops.com>; linux-
>>> embedded@vger.kernel.org
>>>>>>> Subject: Re: Debugging early SError exception
>>>>>>>
>>>>>>> [You don't often get email from dirk.behme@gmail.com. Learn why this
>>> is
>>>>>>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>>>
>>>>>>> CAUTION: External Sender
>>>>>>>
>>>>>>> Am 17.12.23 um 22:32 schrieb Lior Weintraub:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> We have a new SoC with eLinux porting (kernel v6.5).
>>>>>>>> This SoC is ARM64 (A53) single core based device.
>>>>>>>> It runs correctly on QEMU but fails with SError on emulation platform
>>>>>>> (Synopsys Zebu running our SoC model).
>>>>>>>> There is no debugger connected to this emulation but there are several
>>>>>>> debug capabilities we can use:
>>>>>>>> 1. Generating wave dump of CPU signals
>>>>>>>> 2. Generate a Tarmac log
>>>>>>>> 3. UART
>>>>>>>>
>>>>>>>> Since the SError happens at early stages of Linux boot the UART is not
>>>>>>> enabled yet.
>>>>>>>>     From the Tarmac log we can see:
>>>>>>>>      3824884521 ps  ES  (ffff800080760888:d65f03c0) O el1h_ns:   ret
>>>>>>> (parse_early_param)
>>>>>>>>      3824884522 ps  ES  (ffff800080763a60:d2801800) O el1h_ns:   mov
>>>>> x0,
>>>>>>> #0xc0   //      #192    (setup_arch)
>>>>>>>>                         R X0 (AARCH64) 00000000 000000c0
>>>>>>>>      3824884523 ps  ES  (ffff800080763a64:d51b4220) O el1h_ns:   msr
>>>>>>> daif,   x0      (setup_arch)
>>>>>>>>                         R CPSR 600000c5
>>>>>>>>      3824884529 ps  ES  System Error (Abort)
>>>>>>>>                         EXC [0x380] SError/vSError Current EL with SP_ELx
>>>>>>>>                         R ESR_EL1 (AARCH64) bf000002
>>>>>>>>                         R CPSR 600003c5
>>>>>>>>                         R SPSR_EL1 (AARCH64) 600000c5
>>>>>>>>                         R ELR_EL1 (AARCH64) ffff8000 80763a68
>>>>>>>>      3824884925 ps  ES  (ffff800080010b80:d10543ff) O el1h_ns:   sub
>>>>> sp,
>>>>>>> sp,     #0x150  (vectors)
>>>>>>>>                         R SP_EL1 (AARCH64) ffff8000 808f3c50
>>>>>>>>      3824884925 ps  ES  (ffff800080010b84:8b2063ff) O el1h_ns:   add
>>>>> sp,
>>>>>>> sp,     x0      (vectors)
>>>>>>>>                         R SP_EL1 (AARCH64) ffff8000 808f3d10
>>>>>>>>      3824884926 ps  ES  (ffff800080010b88:cb2063e0) O el1h_ns:   sub
>>>>> x0,
>>>>>>> sp,     x0      (vectors)
>>>>>>>>                         R X0 (AARCH64) ffff8000 808f3c50
>>>>>>>>      3824884927 ps  ES  (ffff800080010b8c:37700080) O el1h_ns:   tbnz
>>>>> w0,
>>>>>>> #14,    ffff800080010b9c        <vectors+0x39c>         (vectors)
>>>>>>>>      3824884935 ps  ES  (ffff800080010b90:cb2063e0) O el1h_ns:   sub
>>>>> x0,
>>>>>>> sp,     x0      (vectors)
>>>>>>>>                         R X0 (AARCH64) 00000000 000000c0
>>>>>>>>      3824884937 ps  ES  (ffff800080010b94:cb2063ff) O el1h_ns:   sub
>>> sp,
>>>>>>> sp,     x0      (vectors)
>>>>>>>>                         R SP_EL1 (AARCH64) ffff8000 808f3c50
>>>>>>>>      3824884938 ps  ES  (ffff800080010b98:140001ef) O el1h_ns:   b
>>>>>>> ffff800080011354        <el1h_64_error>         (vectors)
>>>>>>>>
>>>>>>>> If I understand correctly, the exception happened sometime earlier and
>>>>> only
>>>>>>> now Linux boot code (setup_arch) opened the exception handling and as
>>> a
>>>>>>> result we immediately jump to the SError exception handler.
>>>>>>>
>>>>>>>
>>>>>>> Yes, that sounds reasonable. If I understood correctly, you are
>>>>>>> running something "quite new" on some software (QEMU) and
>>> hardware
>>>>>>> (Synopsis) simulators.
>>>>>>>
>>>>>>> That would mean that you have new hardware with e.g. new memory
>>> map
>>>>>>> not used before. What you describe might sound like in the code before
>>>>>>> Linux (boot loader) there is anything resulting in the SError. This
>>>>>>> might be an access to non-existing or non-enabled hardware. I.e. it
>>>>>>> might be that you try to access (read/write) an address what is not
>>>>>>> available, yet (or just invalid). It's hard to debug that. In case you
>>>>>>> are able to modify the code before Linux (the boot loader?) you might
>>>>>>> try to enable SError exceptions, there, too. To get it earlier and
>>>>>>> with that make the search window smaller. I'm not that familiar with
>>>>>>> QEMU, but could you try to trace which (all?) hardware accesses your
>>>>>>> code does. And with that analyse all accesses and with that check if
>>>>>>> all these accesses are valid even on the hardware (Synopsis) emulation
>>>>>>> system? That should be checked from valid address and from hardware
>>>>>>> subsystem enablement point of view.
>>>>>>>
>>>>>>> Hth,
>>>>>>>
>>>>>>> Dirk
>>>>>>>
>>>>>>>
>>>>>>>>     From the Linux source:
>>>>>>>>          parse_early_param();
>>>>>>>>
>>>>>>>>          dynamic_scs_init();
>>>>>>>>
>>>>>>>>          /*
>>>>>>>>           * Unmask asynchronous aborts and fiq after bringing up possible
>>>>>>>>           * earlycon. (Report possible System Errors once we can report this
>>>>>>>>           * occurred).
>>>>>>>>           */
>>>>>>>>          local_daif_restore(DAIF_PROCCTX_NOIRQ); <---- This is when we
>>> get
>>>>> the
>>>>>>> exception.
>>>>>>>>
>>>>>>>> After some kernel hacking (replacing printk) we could extract the logs:
>>>>>>>> 6Booting Linux on physical CPU 0x0000000000 [0x410fd034]
>>>>>>>> 5Linux version 6.5.0 (pliops@dev-liorw) (aarch64-buildroot-linux-gnu-
>>>>>>> gcc.br_real (Buildroot 2023.02.1-95-g8391404e23) 11.3.0, GNU ld
>>> (GNU
>>>>>>> Binutils) 2.38) #101 SMP Sun Dec 17 20:09:06 IST 2023
>>>>>>>> 6Machine model: Pliops Spider MK-I EVK
>>>>>>>> 2SError Interrupt on CPU0, code 0x00000000bf000002 -- SError
>>>>>>>> CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0 #101
>>>>>>>> Hardware name: Pliops Spider MK-I EVK (DT)
>>>>>>>> pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>>>>> pc : setup_arch+0x13c/0x5ac
>>>>>>>> lr : setup_arch+0x134/0x5ac
>>>>>>>> sp : ffff8000808f3da0
>>>>>>>> x29: ffff8000808f3da0c x28: 0000000008758074c x27:
>>>>>>> 0000000005e31b58c
>>>>>>>> x26: 0000000000000001c x25: 0000000007e5f728c x24:
>>>>>>> ffff8000808f8000c
>>>>>>>> x23: ffff8000808f8600c x22: ffff8000807b6000c x21:
>>>>> ffff800080010000c
>>>>>>>> x20: ffff800080a1e000c x19: fffffbfffddfe190c x18:
>>> 000000002266684ac
>>>>>>>> x17: 00000000fcad60bbc x16: 0000000000001800c x15:
>>>>>>> 0000000000000008c
>>>>>>>> x14: ffffffffffffffffc x13: 0000000000000000c x12:
>>> 0000000000000003c
>>>>>>>> x11: 0101010101010101c x10: ffffffffffee87dfc x9 :
>>>>> 0000000000000038c
>>>>>>>> x8 : 0101010101010101c x7 : 7f7f7f7f7f7f7f7fc x6 :
>>>>> 0000000000000001c
>>>>>>>> x5 : 0000000000000000c x4 : 8000000000000000c x3 :
>>>>>>> 0000000000000065c
>>>>>>>> x2 : 0000000000000000c x1 : 0000000000000000c x0 :
>>>>>>> 00000000000000c0c
>>>>>>>> 0Kernel panic - not syncing: Asynchronous SError Interrupt
>>>>>>>> CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0 #101
>>>>>>>> Hardware name: Pliops Spider MK-I EVK (DT)
>>>>>>>> Call trace:
>>>>>>>>      dump_backtrace+0x9c/0xd0
>>>>>>>>      show_stack+0x14/0x1c
>>>>>>>>      dump_stack_lvl+0x44/0x58
>>>>>>>>      dump_stack+0x14/0x1c
>>>>>>>>      panic+0x2e0/0x33c
>>>>>>>>      nmi_panic+0x68/0x6c
>>>>>>>>      arm64_serror_panic+0x68/0x78
>>>>>>>>      do_serror+0x24/0x54
>>>>>>>>      el1h_64_error_handler+0x2c/0x40
>>>>>>>>      el1h_64_error+0x64/0x68
>>>>>>>>      setup_arch+0x13c/0x5ac
>>>>>>>>      start_kernel+0x5c/0x5b8
>>>>>>>>      __primary_switched+0xb4/0xbc
>>>>>>>> 0---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
>>>>>>>>
>>>>>>>> Can you please advice how to proceed with debugging?
>>>>>>>>
>>>>>>>> Thanks in advanced,
>>>>>>>> Cheers,
>>>>>>>> Lior.
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>
>>
> 

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
