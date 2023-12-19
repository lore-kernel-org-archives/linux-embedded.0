Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A067F9EC
	for <linux-embedded@vger.kernel.org>; Tue, 19 Dec 2023 07:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTTgvuZr"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e4a637958so210896e87.2
        for <linux-embedded@vger.kernel.org>; Mon, 18 Dec 2023 23:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702969752; x=1703574552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zh0nHlx3Hd+RoGR4B5Tit7cKMsUauCBtb0cXst2f/j8=;
        b=BTTgvuZrbc4+0J6bfSpdWRbAleccX8lg5Jkw1cTXQ2Wc/dbW7vESYhthH3zpJJtUm6
         jEUIh2eCnzDDahLN94+gSrmQVCwKiA/ilfXDPt6z3td+UEbdWRtRfwRMAdwTkoCU0LWN
         gRnHNCb2lK8/+N5dqYDccSMT8D+bRit8goBva/i7hhFFS3inRis1wQQlhIcii31sQ3nS
         ZqPTQ2CeSDSBe4BH8GdnU4zUuIonk0GqhO/CdAu7QPlEli8kFJN73BDHx/VuDx897D+H
         U+pNsFt80f0tN94tlQinKV9mqAFLcOSJnWaUulOYla0o0G9jx7IPFSZ/mjzYD57ITBFE
         5ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702969752; x=1703574552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh0nHlx3Hd+RoGR4B5Tit7cKMsUauCBtb0cXst2f/j8=;
        b=VGSw8PQa8EamtyOUDFBU1fnh59RuyXRpoQ0/filIO5LvGKvfUiLoecQbI1TFMbouK2
         MNIy97ENb/7PSKn/VxH5WpKNMODUITkPWhBx46gr1304GWHnTV7xDpSabIY6keJBp4IZ
         pYTPqz36Bvd4shWJX0xdwiAmI2etJddbMKcAj9aeKPkymInZNSn9nFN/+RlIKpwrB4jV
         5LHMF5kswdIQZaZCWhGNlTyhEag9shaXwtq8MzxT2lA+r2ddn3GjcFnDWFYdYfdr96ud
         U2DWQQqxqh5AJbMIsOXcS2cYi1Trd40NCOJrmfkP5nMSYNPbbtWSQul9XjamamPtQjFq
         BRvQ==
X-Gm-Message-State: AOJu0YzVfMrq/jSULr7XDdS/PWcxRFZ7vW4LLQracJ4srxd2Mg4N83tu
	COdXDYGt4HMegYZZPwVNDe+4ZUFGo8w=
X-Google-Smtp-Source: AGHT+IFCVchH3HT08YCWMG7/KL7hZeU4Xdf0yXOZeLGc+sYJMtQyiEP/FcC9wmWT14ifxQF0N4gJBg==
X-Received: by 2002:a05:6512:6c8:b0:50e:c8f:233f with SMTP id u8-20020a05651206c800b0050e0c8f233fmr3356364lff.129.1702969752029;
        Mon, 18 Dec 2023 23:09:12 -0800 (PST)
Received: from ?IPV6:2003:df:bf1f:bd00:833c:aedf:5f19:a956? (p200300dfbf1fbd00833caedf5f19a956.dip0.t-ipconnect.de. [2003:df:bf1f:bd00:833c:aedf:5f19:a956])
        by smtp.gmail.com with ESMTPSA id hu11-20020a170907a08b00b00a1d2a13c425sm14998136ejc.30.2023.12.18.23.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 23:09:11 -0800 (PST)
Message-ID: <b17b9901-5007-4d12-99d9-be531360227e@gmail.com>
Date: Tue, 19 Dec 2023 08:09:10 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Debugging early SError exception
To: Lior Weintraub <liorw@pliops.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <PR3P195MB05556D6B225E93A2B5BFFE88C391A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <PR3P195MB05556D6B225E93A2B5BFFE88C391A@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 17.12.23 um 22:32 schrieb Lior Weintraub:
> Hi,
> 
> We have a new SoC with eLinux porting (kernel v6.5).
> This SoC is ARM64 (A53) single core based device.
> It runs correctly on QEMU but fails with SError on emulation platform (Synopsys Zebu running our SoC model).
> There is no debugger connected to this emulation but there are several debug capabilities we can use:
> 1. Generating wave dump of CPU signals
> 2. Generate a Tarmac log
> 3. UART
> 
> Since the SError happens at early stages of Linux boot the UART is not enabled yet.
>  From the Tarmac log we can see:
>   3824884521 ps  ES  (ffff800080760888:d65f03c0) O el1h_ns:	ret 	(parse_early_param)
>   3824884522 ps  ES  (ffff800080763a60:d2801800) O el1h_ns:	mov	x0,	#0xc0	//	#192 	(setup_arch)
>                      R X0 (AARCH64) 00000000 000000c0
>   3824884523 ps  ES  (ffff800080763a64:d51b4220) O el1h_ns:	msr	daif,	x0 	(setup_arch)
>                      R CPSR 600000c5
>   3824884529 ps  ES  System Error (Abort)
>                      EXC [0x380] SError/vSError Current EL with SP_ELx
>                      R ESR_EL1 (AARCH64) bf000002
>                      R CPSR 600003c5
>                      R SPSR_EL1 (AARCH64) 600000c5
>                      R ELR_EL1 (AARCH64) ffff8000 80763a68
>   3824884925 ps  ES  (ffff800080010b80:d10543ff) O el1h_ns:	sub	sp,	sp,	#0x150 	(vectors)
>                      R SP_EL1 (AARCH64) ffff8000 808f3c50
>   3824884925 ps  ES  (ffff800080010b84:8b2063ff) O el1h_ns:	add	sp,	sp,	x0 	(vectors)
>                      R SP_EL1 (AARCH64) ffff8000 808f3d10
>   3824884926 ps  ES  (ffff800080010b88:cb2063e0) O el1h_ns:	sub	x0,	sp,	x0 	(vectors)
>                      R X0 (AARCH64) ffff8000 808f3c50
>   3824884927 ps  ES  (ffff800080010b8c:37700080) O el1h_ns:	tbnz	w0,	#14,	ffff800080010b9c	<vectors+0x39c> 	(vectors)
>   3824884935 ps  ES  (ffff800080010b90:cb2063e0) O el1h_ns:	sub	x0,	sp,	x0 	(vectors)
>                      R X0 (AARCH64) 00000000 000000c0
>   3824884937 ps  ES  (ffff800080010b94:cb2063ff) O el1h_ns:	sub	sp,	sp,	x0 	(vectors)
>                      R SP_EL1 (AARCH64) ffff8000 808f3c50
>   3824884938 ps  ES  (ffff800080010b98:140001ef) O el1h_ns:	b	ffff800080011354	<el1h_64_error> 	(vectors)
> 
> If I understand correctly, the exception happened sometime earlier and only now Linux boot code (setup_arch) opened the exception handling and as a result we immediately jump to the SError exception handler.


Yes, that sounds reasonable. If I understood correctly, you are 
running something "quite new" on some software (QEMU) and hardware 
(Synopsis) simulators.

That would mean that you have new hardware with e.g. new memory map 
not used before. What you describe might sound like in the code before 
Linux (boot loader) there is anything resulting in the SError. This 
might be an access to non-existing or non-enabled hardware. I.e. it 
might be that you try to access (read/write) an address what is not 
available, yet (or just invalid). It's hard to debug that. In case you 
are able to modify the code before Linux (the boot loader?) you might 
try to enable SError exceptions, there, too. To get it earlier and 
with that make the search window smaller. I'm not that familiar with 
QEMU, but could you try to trace which (all?) hardware accesses your 
code does. And with that analyse all accesses and with that check if 
all these accesses are valid even on the hardware (Synopsis) emulation 
system? That should be checked from valid address and from hardware 
subsystem enablement point of view.

Hth,

Dirk


>  From the Linux source:
> 	parse_early_param();
> 
> 	dynamic_scs_init();
> 
> 	/*
> 	 * Unmask asynchronous aborts and fiq after bringing up possible
> 	 * earlycon. (Report possible System Errors once we can report this
> 	 * occurred).
> 	 */
> 	local_daif_restore(DAIF_PROCCTX_NOIRQ); <---- This is when we get the exception.
> 
> After some kernel hacking (replacing printk) we could extract the logs:
> 6Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> 5Linux version 6.5.0 (pliops@dev-liorw) (aarch64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.02.1-95-g8391404e23) 11.3.0, GNU ld (GNU Binutils) 2.38) #101 SMP Sun Dec 17 20:09:06 IST 2023
> 6Machine model: Pliops Spider MK-I EVK
> 2SError Interrupt on CPU0, code 0x00000000bf000002 -- SError
> CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0 #101
> Hardware name: Pliops Spider MK-I EVK (DT)
> pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : setup_arch+0x13c/0x5ac
> lr : setup_arch+0x134/0x5ac
> sp : ffff8000808f3da0
> x29: ffff8000808f3da0c x28: 0000000008758074c x27: 0000000005e31b58c
> x26: 0000000000000001c x25: 0000000007e5f728c x24: ffff8000808f8000c
> x23: ffff8000808f8600c x22: ffff8000807b6000c x21: ffff800080010000c
> x20: ffff800080a1e000c x19: fffffbfffddfe190c x18: 000000002266684ac
> x17: 00000000fcad60bbc x16: 0000000000001800c x15: 0000000000000008c
> x14: ffffffffffffffffc x13: 0000000000000000c x12: 0000000000000003c
> x11: 0101010101010101c x10: ffffffffffee87dfc x9 : 0000000000000038c
> x8 : 0101010101010101c x7 : 7f7f7f7f7f7f7f7fc x6 : 0000000000000001c
> x5 : 0000000000000000c x4 : 8000000000000000c x3 : 0000000000000065c
> x2 : 0000000000000000c x1 : 0000000000000000c x0 : 00000000000000c0c
> 0Kernel panic - not syncing: Asynchronous SError Interrupt
> CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0 #101
> Hardware name: Pliops Spider MK-I EVK (DT)
> Call trace:
>   dump_backtrace+0x9c/0xd0
>   show_stack+0x14/0x1c
>   dump_stack_lvl+0x44/0x58
>   dump_stack+0x14/0x1c
>   panic+0x2e0/0x33c
>   nmi_panic+0x68/0x6c
>   arm64_serror_panic+0x68/0x78
>   do_serror+0x24/0x54
>   el1h_64_error_handler+0x2c/0x40
>   el1h_64_error+0x64/0x68
>   setup_arch+0x13c/0x5ac
>   start_kernel+0x5c/0x5b8
>   __primary_switched+0xb4/0xbc
> 0---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
> 
> Can you please advice how to proceed with debugging?
> 
> Thanks in advanced,
> Cheers,
> Lior.
> 
> 

