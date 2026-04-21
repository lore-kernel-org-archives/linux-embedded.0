Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A435DA75
	for <linux-embedded@vger.kernel.org>; Tue, 21 Apr 2026 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760433; cv=none; b=oSBdRMomiZahF5DCfJhXVfiapOla2To43BrPBz2yA7eKGJDY/zBrzC4+I8jHtB4M+16DqBw+jvtS+8kxQZvuJSDnYcvO/jyaf+RrgufXh5vRueWLr3B5YnE9sFYH7QK5kVlCNa4eYg7imMo6MpURyoLuCTynea3DpPRNlkpEjrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760433; c=relaxed/simple;
	bh=/VZ5kriGWaiBxu3SgCheS5BJ8WdBrbRkGNaCxaPDoeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEGgMk2yP5hKB4reVE6dYR2wtVjlRLz2ECd8fg9f0MCVZ1W41pyNRCGzbbFI5hF9GArOdP0qOLNFkMVFulHc/im5Jq+qttde+fRAiSPw2DdTfMS6CtESXvz9d/nFP6/0Lg+W1qroNFxHj98Q6u8I4puS3bj68TN94v6iy9OsID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fjE/lyvR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fjE/lyvR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43eada6d900so3896607f8f.0
        for <linux-embedded@vger.kernel.org>; Tue, 21 Apr 2026 01:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776760430; x=1777365230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRvr1BPib4X2D3T0QNvR+79b+TxBNI5uhJQokMSK6Z0=;
        b=fjE/lyvRyYx6eAXp/7muWGFkZmZaZIwZK33ubfLW1N86HFOoQSay3O2hRnHsfPJDIT
         sKAn1pw4wRLU5XcI+KZ8r+HpcN/mqtWPgweWuyYiET4HZWvsseqmOfFoGRAulAOS1eH8
         dyCOcJXphFQrLsV/ATMfdChT3KkqvL7R80TRPvWf4zcOhtplIKRjPoVgrcxwzYq2e0MQ
         MEz1pPDLxbNeldxSMJL2wKOEYlQtwcPwt37CHUqq9FaMoTdy9xGsKxEeIhhz+iR6vOCp
         cSdXQEj4jDv8JR98mayPhTb7TLAHlJeKAjMV/GW58RN5T0vRQTpjynn979drMgjMnHSQ
         6pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760430; x=1777365230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRvr1BPib4X2D3T0QNvR+79b+TxBNI5uhJQokMSK6Z0=;
        b=N5J6It9wvRjPpVN6pUgvv/H6NOnVVdHZU6aQQBpYxP2BYaIjXL1vitpjrtqnMpY7IU
         GDB9V1MQpPkz7+a43YQNKDhTVd5O1qXYeG+NUuKMik6ZyVzIeuAO5UNIxm2fmMVsGFx3
         OI1HU6o5SJQ6BFohfGLM81G0cQAUxg5+obM0inwgMJjijNRkMQ+IZH5OXaarquNcJPrh
         gFaZBt2cFOQQ7G4IMyaVre2483L4YTOx6jf7XdFjROFDo4qb+u7M2wYxS46Rt9TWf7A3
         mGxbhuS+zFgvqggTaoS8sXXtG0+IHIf8Msy8kK+LavwqaYBVgFUP5Yj6HIkxAbX6Dbz6
         a1+w==
X-Forwarded-Encrypted: i=1; AFNElJ+YvYHzMs2KcAgq+do1fRf5Yau7ei8Rm0X7yG3bqgpdnnJfvKAOadkLBy0lYHKHbfOYRJfJA/OIitWyb0Cwfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfKNNWb1zI44crDENrgQ2d5BCQIPbUr3PqlnmD6JVfR/sx6i8W
	clbezSsFZY+ANAciNFwnlFpwQi26Wjc39RXm9jRI6SyGNvHxJ/JvVhNxtlwTX5Mj0Hc=
X-Gm-Gg: AeBDiet+9+1LEcp6JlS9Ds+Afgy6J4Ctd9IIJpjAfxWL2K4DYi3aH6EtzlKY/FbDG4s
	f3YaegXArv03OUG+3C3agarEWcSEoxNYxt+Pa63jC7RnIcfg+r4s0gX2bxgrDNM8meHiqsNcalX
	hCfl3pM7grU07GZ6RuJCRsugAUjcszcaUvuTLozi0VdL5Ofp0OdFjEhGe2qM99/ZN1ahyM9Ymyg
	2Dxv8/1dyyKO2DfQATr1lF4fxC6Kiktw5sPMpURTmyFcxA4ZEhkrEhlbxtNSWMbvzXYhaub1zG+
	Lk8kOwdOSBxV/Xwdd6gGjvYIsvDslictcbcYnzIKyu+ImNOnrgMIwAFobz5iu6nSEz2XWMJJHEb
	W8tPHabLP28Vjf/cWJN3tuwPnqPzM1H3pTCqabjZEihYj6PiHAfJci1l2XA7ct5jbblPzD52X7Z
	d4bvvOxSeLurnWGit5G5vG3DjAFeqp9xVEeFcBFeuY+zvYd5nw6pU=
X-Received: by 2002:a05:6000:24ca:b0:43e:a70d:7632 with SMTP id ffacd0b85a97d-43fe3e0b463mr26551326f8f.25.1776760430040;
        Tue, 21 Apr 2026 01:33:50 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm40281158f8f.20.2026.04.21.01.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:33:49 -0700 (PDT)
Date: Tue, 21 Apr 2026 10:33:47 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"francesco@valla.it" <francesco@valla.it>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	"shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>,
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Message-ID: <aec2a2RPO9rYQa0D@pathway.suse.cz>
References: <20260410203741.997410-1-tim.bird@sony.com>
 <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx>
 <aeINb8-a83R3QDXd@pathway.suse.cz>
 <MW5PR13MB5632F6F08DB75F7CCBC2AFA1FD2F2@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR13MB5632F6F08DB75F7CCBC2AFA1FD2F2@MW5PR13MB5632.namprd13.prod.outlook.com>

On Mon 2026-04-20 22:18:29, Bird, Tim wrote:
> > From: Petr Mladek <pmladek@suse.com>
> >    2. The early timestamps provided by the bogo cycles
> >       are not synchronized with timestamps from
> >       the proper time keeping.
> > 
> >       Would it help to print a disclaimer, similar to,
> >       for example, trace_printk() first use?
> >       Something like:
> > 
> > [    0.002912] **********************************************************
> > [    0.002917] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
> > [    0.002921] **
> > [    0.002935] ** Using BOGO early timestamps
> > [    0.002939] **
> > [    0.002943] ** They are not properly calibrated and might use a source
> > [    0.002949] ** with an unstable frequency.
> > [    0.002953] **
> > [    0.002957] ** They are not comparable with timestamps after
> > [    0.002961] ** the timekeeping is initialized.
> > [    0.002966] **
> > [    0.002968] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
> > [    0.002971] *******************************************************
> 
> That's a bit long, but I think a warning like this is useful.

Yeah, feel free to make it shorter. I just wanted to explain what is
going on and what is the effect.

> > [    0.002975] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> > [    0.002998] Linux version 7.0.0-rc6-v8+ (tbird@timdesk) (aarch64-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU
> > Binutils for Ubuntu) 2.42) #20 SMP PREEMPT Fri Apr 10 11:57:48 MDT 2026
> > [    0.003002] KASLR enabled
> > [    0.003338] random: crng init done
> > [    0.003866] Machine model: Raspberry Pi 4 Model B Rev 1.5
> > [    0.004495] efi: UEFI not found.
> > ...
> > [    0.183552] Root IRQ handler: gic_handle_irq
> > [    0.183561] GIC: Using split EOI/Deactivate mode
> > [    0.183699] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> > [    0.183958] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
> > [    0.183952] arch_timer: cp15 timer running at 54.00MHz (phys).
> > [    0.183957] **********************************************************
> > [    0.183962] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
> > [    0.183967] **
> > [    0.183971] ** End of BOGO early timestamps
> > [    0.183976] **
> > [    0.183982] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
> > [    0.183989] **********************************************************
> 
> I actually worked on a notice like this, to bridge/explain the transition (for humans).  But it turned
> out that different platforms initialized their clocks differently enough that it would have
> required putting the notice in different places, which would have required architecture-specific
> #ifdefs in generic code (so I didn't do it).

I think that we could print both notices from the printk() code:

 + 1st one before the very first message
 + 2nd one before the first message with a proper timestamp from
   the local_clock().

Best Regards,
Petr
