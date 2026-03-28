Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A39352927;
	Sat, 28 Mar 2026 15:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713369; cv=none; b=at4zhZP3iPJapI1tCWSMLINzC3psYLe26pX+J2kPIVDF1aR8ri8YsBRlXJc2Nws2/oXH3K3mZQG9/BaY0jJTSiDREFSKVPh39CwVf0mzDBsh+MmbncK0bSb9abGjWWl5AKjbxvrL11ZEcZ2ypz1jrPO+VcDQ04B31BnQVX3tQ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713369; c=relaxed/simple;
	bh=XQ7aiXHV1qxwCknEDKi53WMl5BRAlVzgUtdxDxL7KOs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WDH2EgykubNB8UwyCwu0hKkKuYDIai7VN1gOz+cde8YkZrv/t5QqRbz3fH/ji9FVVW5+bZotSzGnpHUs50JT2dMSl7d9Zf28DYYhvKeiKePvbF5hT0cXu8qWQtNXOctv1nS8XCwy9HNkddfhEgHOg454DucRIb6rpvJGBd/EiPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqUZkWDE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqUZkWDE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF766C4CEF7;
	Sat, 28 Mar 2026 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774713368;
	bh=XQ7aiXHV1qxwCknEDKi53WMl5BRAlVzgUtdxDxL7KOs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FqUZkWDEKq09d/ap7WmBFqKmTIZNBURNQj1YCqDlpaFvPtdJ0mZzsh9a6YbWk/9/t
	 2jXxM+RqUlgYNNCGpcMqsSxBkRB6eoNNG38seSh3TmcvdffBBBWcz38EWubRNKuCpQ
	 kwe0SmTDz9V4jcSY0d9M/hHwNGavJXYvRMbZV4mQ/6k0xb00sVxfxaN6OJfeOzy3pV
	 eU/gPdDo5I44OtSmt34zD3QuyjJPRPmvHcWMBs99kDgvET9kyWssVIfISRpQP8x8E4
	 bwql4JbhTXeeAe7XqbZg6FIydzgGOuymG2hn2hmq4p+ZFhIcppumIR7A7zlrPwauxz
	 bVty5KY7d/zVg==
From: Thomas Gleixner <tglx@kernel.org>
To: Petr Mladek <pmladek@suse.com>, "Bird, Tim" <Tim.Bird@sony.com>
Cc: Michael Kelley <mhklinux@outlook.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, John Ogness
 <john.ogness@linutronix.de>
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early boot
In-Reply-To: <abPqrqgXHnDu8XWf@pathway>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <SN6PR02MB41571D45C1C8ADF89BD1FE8DD447A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <MW5PR13MB563216F6D786D4DCDFEBED2BFD45A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <abPqrqgXHnDu8XWf@pathway>
Date: Sat, 28 Mar 2026 16:56:04 +0100
Message-ID: <87mrzsaqy3.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Mar 13 2026 at 11:45, Petr Mladek wrote:
> [    9.296302] cpuidle: using governor menu
>
> Here the thermal governors are registered. I guess that they might
> reduce speed of some HW.

No. The frequency of the TSC and KVM clock are stable. For TSC that's
only true for CPUs which have X86_FEATURE_CONSTANT_TSC set, which is the
case for every x86 CPU shipped in the last 20 years.

Thanks,

        tglx
