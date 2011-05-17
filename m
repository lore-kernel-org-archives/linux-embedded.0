From: Dirk Behme <dirk.behme@googlemail.com>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Tue, 17 May 2011 21:18:26 +0200
Message-ID: <4DD2CA02.9040707@googlemail.com>
References: <BANLkTi=2jW5PHB6QCaddHeZH0P=9PKWosw@mail.gmail.com> <1305577420-3685-1-git-send-email-abogani@kernel.org> <878vu6nftw.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=3s2qvQCI1f5vFNCz+9sZjP4LwhCr2lkqMBsivNio3FI=;
        b=Ea7RtSPVXoQlQiVyqjJwgXtXRnzkonpL6J3QQFF6TgRhNQmkzU1VhapUoDV2LMm2zd
         eYZGYbTwWypyJvkZ2o7LuQCQrcxXwpd18oW51fUSbRJZEoBthAfGgwkrSh2zjJ5w/U//
         fNGYgy0jlYiZNqPnalkITun5ibEcSAKTIKcWs=
In-Reply-To: <878vu6nftw.fsf@rustcorp.com.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Alessio Igor Bogani <abogani@kernel.org>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>

On 17.05.2011 05:52, Rusty Russell wrote:
> On Mon, 16 May 2011 22:23:40 +0200, Alessio Igor Bogani<abogani@kernel.org>  wrote:
>> This work was supported by a hardware donation from the CE Linux Forum.
>>
>> Signed-off-by: Alessio Igor Bogani<abogani@kernel.org>
>> ---
>>   kernel/module.c |    6 ++----
>>   1 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/kernel/module.c b/kernel/module.c
>> index 6a34337..54355c5 100644
>> --- a/kernel/module.c
>> +++ b/kernel/module.c
>> @@ -2055,10 +2055,8 @@ static const struct kernel_symbol *lookup_symbol(const char *name,
>>   	const struct kernel_symbol *stop)
>>   {
>>   	const struct kernel_symbol *ks = start;
>> -	for (; ks<  stop; ks++)
>> -		if (strcmp(ks->name, name) == 0)
>> -			return ks;
>> -	return NULL;
>> +	return bsearch(name, start, stop - start,
>> +			sizeof(struct kernel_symbol), cmp_name);
>>   }
>>
>>   static int is_exported(const char *name, unsigned long value,
>
> Applied.

Sorry, but where have you applied it?

With the version above we should get a warning

kernel/module.c: In function 'lookup_symbol':
kernel/module.c:1809: warning: unused variable 'ks'

?

Best regards

Dirk
