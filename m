Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693F924CEEA;
	Tue, 14 Apr 2026 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776206313; cv=none; b=ZMs/nWuXh/3SyLgPrswpejChljS62ZUDKAYS9J/g/vM+Pdl9cVQ6xmth6vgHTLqksbL/tglt/MAMKhxc/5Ai1wj+7KTqOrVdFAixph1QTleTzm4b3oU5Edw954c4GxpIS4cIkKGGpnfj1gLXkIYS0uMOzOMRhjcRpmYQKrNsz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776206313; c=relaxed/simple;
	bh=FEeg267hAQ3q2MBbRFlgve3BJgyoncAw4TT4qk7HPSs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZDaHcIxCEN4ILeRJS5Ultj2BAmlQmBOFrUFJg+iRWTqZd2HlNdQ3JnloHKP72zD2qzGzXrE82WChu33Xni1JjpXdTBKHbCoHRAjELe8hCoE6yHdDLDC3RIInZAX2exLHooRJUUlwLULUOdcALwRzdRrJswIIlI1vX3AReBKymkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=psKzG/GO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="psKzG/GO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61400C19425;
	Tue, 14 Apr 2026 22:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776206313;
	bh=FEeg267hAQ3q2MBbRFlgve3BJgyoncAw4TT4qk7HPSs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=psKzG/GO591lYu/DGCAaCK5LBJz9ul3W7i/PjpL2kU8v8T/E0zZXDX5ijFy3OEpmq
	 8FM0eOmvCNse5w4sKqcaCIMD7/VNp9xNfeDB5VwWYFX3JB6N0VabfFB9qOHF6uPpKl
	 EmCfIvgbmGfdV29+PVmXlD84BhZbZ4QSUl8zVjPcDnU3B4y8gqLuvxpGgp9vhIONGO
	 tO9MiXE81SrYeC+8eCyg6ow+cKc8LmPH4M7Yc+q4GVmCTkGDUKbaGWxG00uEH5wR0C
	 4bGnYhEitb9NcjBFI67mE8tYcgiorpY5q92YzNug/UHuLWDR3ChLXLAezMlPz51n3E
	 YvVr111QTT1IQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org,
 john.ogness@linutronix.de, senozhatsky@chromium.org
Cc: francesco@valla.it, geert@linux-m68k.org, shashankbalaji02@gmail.com,
 linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird
 <tim.bird@sony.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
In-Reply-To: <20260410203741.997410-2-tim.bird@sony.com>
References: <20260410203741.997410-1-tim.bird@sony.com>
 <20260410203741.997410-2-tim.bird@sony.com>
Date: Wed, 15 Apr 2026 00:38:29 +0200
Message-ID: <87qzohdv6i.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 10 2026 at 14:37, Tim Bird wrote:
> +
> +#include <linux/timekeeping.h>
> +#ifdef CONFIG_ARM64
> +#include <asm/sysreg.h>
> +#endif
> +
> +#ifdef CONFIG_EARLY_CYCLES_KHZ
> +static inline u64 early_unsafe_cycles(void)
> +{
> +#if defined(CONFIG_X86_64)
> +	/*
> +	 * This rdtsc may happen before secure TSC is initialized, and
> +	 * it is unordered. So please don't use this value for cryptography
> +	 * or after SMP is initialized.
> +	 */
> +	return rdtsc();
> +#elif defined(CONFIG_ARM64)
> +	return read_sysreg(cntvct_el0);
> +#elif defined(CONFIG_RISCV_TIMER)
> +	u64 val;
> +
> +	asm volatile("rdtime %0" : "=r"(val));
> +	return val;
> +#else
> +	return 0;
> +#endif
> +}

No. Generic code and generic headers have no business to implement any
architecture specific code and there is zero justification for
architecture specific #ifdefs in generic code.

Ask your favourite AI assistant for an opinion.

> +#define NS_PER_KHZ	1000000UL

The existing nomenclature for nanosecond related constants is NSEC_* 

> +
> +/* returns a nanosecond value based on early cycles */
> +static inline u64 early_times_ns(void)
> +{
> +	if (CONFIG_EARLY_CYCLES_KHZ)
> +		/*
> +		 * Note: the multiply must precede the division to avoid
> +		 * truncation and loss of resolution
> +		 * Don't use fancier MULT/SHIFT math here.  Since this is
> +		 * static, the compiler can optimize the math operations.
> +		 */
> +		return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;

This code will result in a division by zero warning from any reasonable
compiler because this is evaluated _before_ it is eliminated.

> @@ -2294,6 +2295,8 @@ int vprintk_store(int facility, int level,
>  	 * timestamp with respect to the caller.
>  	 */
>  	ts_nsec = local_clock();
> +	if (unlikely(!ts_nsec))
> +		ts_nsec = early_times_ns();

I explained to you how this wants to be implemented to be useful and you
declared that you are unwilling to put the effort in.

My NAK for this disgusting and tasteless hack still applies.

Either you are willing to work with the community and the relevant
maintainers or you can keep your hackery maintained out of tree for
those who care about it and are willing to ignore the fallout. 

Thanks,

        tglx
