Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C803ACA61;
	Tue, 14 Apr 2026 22:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776206917; cv=none; b=otIp95YnWopqP+4y0XMqqD1tk+9pClYbU43L49zbKKidvpNuvQkaaOfUq7fay89K5XG/ZkejWI1BpkZWkY38ncvHx9tBGs6y9hZPgFxnPfAzp66EH70wfifwK8mBsOJja2meR34O6BPsPJawm1o5DQdyfl6F2rvNjcQYuIyBx7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776206917; c=relaxed/simple;
	bh=r6RDvxhyX6YiPRskh2rejwalb3HkFTcbmhbV9a88g/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fptCMLyehJWmCp53hdngi39D1ylQpQGS3kNllPjUMNn9tvDzPDVLEHRSLqGgA7UdoO696O5+HltCmKwUsnnv0HcNoxY2Mg2lGoJ8tiMxq2RzrQQYwpJ5TkaPfLhnJ7h2ccc+VYp/s5VYr7LH/onLb/yhpqlsDlJ2iHEzbuyed1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIeF0wN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIeF0wN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20269C19425;
	Tue, 14 Apr 2026 22:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776206916;
	bh=r6RDvxhyX6YiPRskh2rejwalb3HkFTcbmhbV9a88g/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YIeF0wN1H/0V9YhzLeaT3jub8Fr0QXgcMdQda17TIkkcVEvteTI44SgkhAIasXh8k
	 Ad0mQCvJzTCejkHpPVrCordMYcYHTnd/jwjLgMVo7UmqFjbqYboA6Sw42cHR3gCaWj
	 8bUuztBtkubiGmtZDM1hqS2GrdOziCI7CtlDlUAv81Hd0gKAATxLvnGft3jfjnlwMm
	 yXctf6Qf2aDF8b8q+/BIuhCRb7B2JJcmqrINeYDQW4S+23i6r1QuoCtBAQhNQA4AAi
	 pK7Y+JH0hNa559F9h6Py1XqGZ5X2IAUpaCSqhh3zQNgJCE+9G4NSCptIxSWbmksFLN
	 GxZ+BtfZZ80yQ==
From: Thomas Gleixner <tglx@kernel.org>
To: "Bird, Tim" <Tim.Bird@sony.com>, kernel test robot <lkp@intel.com>,
 "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "john.ogness@linutronix.de"
 <john.ogness@linutronix.de>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>
Cc: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "francesco@valla.it" <francesco@valla.it>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "shashankbalaji02@gmail.com"
 <shashankbalaji02@gmail.com>, "linux-embedded@vger.kernel.org"
 <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
In-Reply-To: <MW5PR13MB563241C9F7C8BCAF0D5F3D21FD242@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260410203741.997410-2-tim.bird@sony.com>
 <202604121822.OvOLcTnO-lkp@intel.com>
 <MW5PR13MB563241C9F7C8BCAF0D5F3D21FD242@MW5PR13MB5632.namprd13.prod.outlook.com>
Date: Wed, 15 Apr 2026 00:48:33 +0200
Message-ID: <87o6jldupq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Apr 13 2026 at 17:58, Tim Bird wrote:
> This is a false positive warning from the compiler (see below).

This is _NOT_ a false positive warning. The compiler is absolutely
correct.

>>     34
>>     35	/* returns a nanosecond value based on early cycles */
>>     36	static inline u64 early_times_ns(void)
>>     37	{
>>     38		if (CONFIG_EARLY_CYCLES_KHZ)
>>     39			/*
>>     40			 * Note: the multiply must precede the division to avoid
>>     41			 * truncation and loss of resolution
>>     42			 * Don't use fancier MULT/SHIFT math here.  Since this is
>>     43			 * static, the compiler can optimize the math operations.
>>     44			 */
>>   > 45			return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;
> Based on this conditional, it's not possible for CONFIG_EARLY_CYCLES_KHZ to be zero
> on this line of code.  Does GCC not catch this?
> if (0)
>    x = <some expression>/0;
>
> So this is a false positive.

You clearly fail to understand how compilers work. The dead code
elimination happens _after_ the evaluation of the code and the compiler
does not care whether your initial condition evaluated to false or
not. That's documented compiler behaviour,

Whether GCC complains about it or not is completely irrelevant.

> I'll see if I can silence this warning.

Don't put much effort into it. This whole hack is going nowhere.

Thanks,

        tglx

