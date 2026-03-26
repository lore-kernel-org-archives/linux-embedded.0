Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C570631A55B;
	Thu, 26 Mar 2026 09:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517101; cv=none; b=qLeeXh+/OJBfVIlmzmSG7mfUswxMW3WVdehI+5f1dOK97wz4oge6ks2eAXPoFedtlWxBE09HAK6otSk7bnSpYClsXfU/ch7ww1Va3H31LwshE5/YqeO8Icl/s0lxWa1Qai2R3CbSWNpr8YzRet08+Bv459FVPCrKB0zohhHNb2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517101; c=relaxed/simple;
	bh=Wufgy7xk/yz8YeTRbvx50kA1rPPWSzebRrq3cNZFIfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o0irbDhyKRG7JBrgOn6mHxLvAfYyErTqP/vDYdU/AQ2TrIjs9P/RZaCwyTXhDwckRiaboCIyN/t7ky4IK8kr9BIgkVgSNqRGhALhXoTAgtXWosExRgzzb/TvJlIxcAf9eXpcyacHWUSZfhtpre2iwnapA0xG4m+fymZZi7tZoMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cGhSqneB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8zfp9ilx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cGhSqneB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8zfp9ilx"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774517097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eo7VLpQtGg3eZuQj/OMYrTI0eykUkExF8A6OUrc65X0=;
	b=cGhSqneBcJt69W7NI7JLn+MdLSo7kQk/fmbRj784wkjNvJAq1PQiomrgkIcvAPsIFWty4T
	F6vkcF9F5bJ/8hpZ63djWKkLLD/BCpPkBLU1NSArFKBswHS/pO8JtvJ1TRRW7cGVHhoqJl
	HBmL9yB7+NmkDAsOxwoHPax1ZWknZHL8Mv7KQWqY2gFQxmiehaeP40P1ChE1fx4VxjBDD0
	wDpO5OVQeKS2LoDh8gyd5L7DIjxcpkoYDNv0Pu6z864a3yM6H9vAzZgYZepNb1lnSgTz36
	YPKc5/u0aHJRtMMAiLGa51v26VUmWFaUfMaf73iJSXMdxYnICq4z7j13a9zOOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774517097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eo7VLpQtGg3eZuQj/OMYrTI0eykUkExF8A6OUrc65X0=;
	b=8zfp9ilxYLMCvnyRoilT+DnSrylQctrBkSY7Dhzu6kmQG4VoziZey7499dmTpz5TddrPSj
	qczyz122cXGZXPAQ==
To: "Bird, Tim" <Tim.Bird@sony.com>, Michael Kelley <mhklinux@outlook.com>,
 Petr Mladek <pmladek@suse.com>, Shashank Balaji
 <shashankbalaji02@gmail.com>
Cc: "rostedt@goodmis.org" <rostedt@goodmis.org>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas
 Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>
Subject: RE: [PATCH v3] printk: fix zero-valued printk timestamps in early boot
In-Reply-To: <MW5PR13MB56324CC9F20373A19325061CFD48A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <SN6PR02MB41571D45C1C8ADF89BD1FE8DD447A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <MW5PR13MB563216F6D786D4DCDFEBED2BFD45A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <abPqrqgXHnDu8XWf@pathway>
 <BN7PR02MB4148F06A53EA3A4061765405D442A@BN7PR02MB4148.namprd02.prod.outlook.com>
 <MW5PR13MB56324CC9F20373A19325061CFD48A@MW5PR13MB5632.namprd13.prod.outlook.com>
Date: Thu, 26 Mar 2026 10:30:56 +0106
Message-ID: <87fr5nx7rr.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Tim,

On 2026-03-24, "Bird, Tim" <Tim.Bird@sony.com> wrote:
> Yeah - I was worried about other timestamps not being in synchronization
> with my adjusted printk timestamps.  Looks like that worry was justified.
>
> At this point, there are two avenues:
>
>  1) double-down and embed the offset (from power-on rather than from time_init)
>     all the way into local_clock() and/or whatever is providing CLOCK_MONOTONIC
>     and CLOCK_BOOTTIME, or
>
>  2) back off, and abandon adding the offset to local_clock()-based printk timestamps.
>     This would leave a discontinuity when EARLY_PRINTK_TIMES was enabled,
>     between the (now) non-zero early printk timestamps and the ones following
>     time_init().  This has the benefit of changing less code, and only affecting
>     the early printk timestamps (and none of the rest of the system).  And it has
>     the downside of leaving the possibly confusing time discontinuity
>     early in the kernel log.  So far, I haven't seen any tools confused by this, and
>     I can put a message before time_init() to inform humans about the switch.
>
> The purpose of this patch is really focused on that early period of boot, where all
> other timing and tracing mechanisms are unavailable, and limiting the impact to
> just those early (currently zero) timestamps seems like the best course.

I have always felt that printk timestamping should be using a
userspace-accessible clock, such as CLOCK_MONOTONIC, rather than the CPU
local clock. This simplifies applications coordinating their own logs
with raw kernel logs.

I was wondering if your pre-boot timing could be used as the init values
for CLOCK_MONOTONIC, so that CLOCK_MONOTONIC is a clean continuation of
your pre-boot clocking.

And then we could use this opportunity to switch printk to
CLOCK_MONOTONIC.

This might also make sense if initializing CLOCK_MONOTONIC is somehow
more straight forward that tracking an extra CPU local clock diff.

John Ogness
