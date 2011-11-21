From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: [PATCH RFC 1/5] scripts: Add sortextable to sort the kernel's
 exception table.
Date: Mon, 21 Nov 2011 10:25:36 -0800
Message-ID: <4ECA97A0.3090005@gmail.com>
References: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com> <1321645068-20475-2-git-send-email-ddaney.cavm@gmail.com> <201111201822.13614.vapier@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=tNTbazuYwIVS2dOw7ZwZwBJL51hHr1pg7RKOXQP4uk0=;
        b=a2A0OmIkh+eQ+lnbYzHP5r8WOUGKEzDPMrfHn4hHOpMNZ5lUZCJ3bsEITLxPX1Is3Y
         lwN2IWhsvibvglnuN2c3kKFDiK9Y76MdQMJIWKFJYH4GWXeeeG7Gq0C7uTWChuMJVDet
         4+HZXM9mHV14pcVjTl749XGJu4Ltv5LKePAxs=
In-Reply-To: <201111201822.13614.vapier@gentoo.org>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-embedded@vger.kernel.org, x86@kernel.org, David Daney <david.daney@cavium.com>

On 11/20/2011 03:22 PM, Mike Frysinger wrote:
> On Friday 18 November 2011 14:37:44 David Daney wrote:
>> --- /dev/null
>> +++ b/scripts/sortextable.c
>>
>> +/*
>> + * sortextable.c: Sort the kernel's exception table
>> + *
>> + * Copyright 2011 Cavium, Inc.
>> + *
>> + * Based on code taken from recortmcount.c which is:
>
> seems like it'd be nice if the duplicate helper funcs were placed in a common
> header file rather than copying&  pasting between them.
>

Yes, I may try to factor out some common code if we decide to move 
forward with the patch set.


>> +	switch (w2(ehdr->e_machine)) {
>> +	default:
>> +		fprintf(stderr, "unrecognized e_machine %d %s\n",
>> +			w2(ehdr->e_machine), fname);
>> +		fail_file();
>> +		break;
>> +	case EM_386:
>> +	case EM_MIPS:
>> +	case EM_X86_64:
>> +		break;
>> +	}  /* end switch */
>
> unlike recordmcount, this file doesn't do anything arch specific.  so let's just
> delete this and be done.

Not really true at this point.  We don't know the size or layout of the 
architecture specific exception table entries, likewise for 
CONFIG_ARCH_HAS_SORT_EXTABLE, we don't even know how to do the comparison.

I was trying to be a little conservative and only apply the build time 
sort to configurations that I could test.

David Daney
