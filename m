From: K Richard Pixley <rpixley@graphitesystems.com>
Subject: Re: embedding dtb file into kernel
Date: Thu, 12 Feb 2015 14:30:06 -0800
Message-ID: <54DD296E.7080901@graphitesystems.com>
References: <54DD0018.7010409@graphitesystems.com> <54DD22BF.4040607@sonymobile.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=graphitesystems.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=+BdkR+7hyp5u7TKukDqxl+iKJ8wZ8ZUI60lZSomQyeQ=;
        b=shRprSWN4kuO6LZC5eaJwVL+CtKwA6aMfxvS8a7ACr9c1E6ueHhYnYSA7EJoKh/yUt
         26CoSuNXDa5LFqYmu207DSwLSSCHczN+rZfr8JQOnMQK50qvASk0lfoEvHtUVV6WN5u7
         NiKM3ajb72kgeRqpxNG6oMY2pIBg9ZN5oea9Y=
in-reply-to: <54DD22BF.4040607@sonymobile.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@sonymobile.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 2/12/15 14:01 , Tim Bird wrote:
> On 02/12/2015 11:33 AM, K Richard Pixley wrote:
>> I'm having trouble figuring out how to embed a dtb file into my kernel.
>> I'm thinking that there should be a standard, architecture independent
>> facility for this akin to initramfs, yes?
>>
>> Could someone please either point me to the standard facility, relevant
>> doc, a currently building board that uses the standard facility, or
>> outline what needs to be done to do this with a new board?
>>
>> If it matters, (I can't think why it would), I'm working with powerpc on
>> a 3.10 kernel.  But if there are better facilities in other versions I'd
>> appreciate hearing about that too.
> The normal method is just to cat the two files together, like so:
>   $ cat zImage <filename>.dtb > zImage_w_dtb
>
> See https://community.freescale.com/thread/315543 for one example, on ARM.
> I'm not sure what the status is for appended DTBs on powerpc, but it's
> easy enough you can just try it and see what happens.
>   -- Tim

Thanks!

How do I tell the kernel where to find that dtb?  Is there a relevant 
config option?

--rich
