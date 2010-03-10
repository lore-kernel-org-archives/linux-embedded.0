From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH v2] char drivers: Ram oops/panic logger
Date: Wed, 10 Mar 2010 13:15:25 +0100
Message-ID: <2ea1731b1003100415i46dd8fcem85b85f49fb1a479@mail.gmail.com>
References: <4B968834.3040609@gmail.com>
	 <21eaeb5a1003091808s2d7638cxd524952a7d84b378@mail.gmail.com>
	 <2ea1731b1003100002w104633ffy1ae46ef3d245e5b5@mail.gmail.com>
	 <21eaeb5a1003100120x6cd3f69ak598954af3c9fe955@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=5MXQ7AYfsgnOdwebpT2Zn5GMN/xL59NFBsNSSzZknN4=;
        b=aJVBe1EUCRDNRG0RLl8NWu8iW3UWzutoh+MIMqIrTmwqOAS/ScXNnnRxr6L7InLoav
         dv3WnVZggj1QSWYVzXxSniBnq0ZGtdDE8yPQgnQ+J/8el7PBU4ZwY5mq8BVSHlREJZzF
         U3G1yvhakTBkTuvcBiJgos802fBd8wreeFZT0=
In-Reply-To: <21eaeb5a1003100120x6cd3f69ak598954af3c9fe955@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuasa Yoichi <yuasa@linux-mips.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

2010/3/10 Yuasa Yoichi <yuasa@linux-mips.org>:
> 2010/3/10 Marco Stornelli <marco.stornelli@gmail.com>:
>> 2010/3/10 Yuasa Yoichi <yuasa@linux-mips.org>:
>>> Hi,
>>>
>>> 2010/3/10 Marco Stornelli <marco.stornelli@gmail.com>:
>>>> Ramoops, like mtdoops, can log oops/panic information but in RAM.
>>>
>>> What is different from mtdoops + mtd-ram?
>>>
>>> Yoichi
>>>
>>
>> It can be used in a very easy way with persistent RAM for systems
>> without flash support. For this systems, with this driver, it's no
>> more needed add to the kernel the mtd subsystem with advantage in
>> footprint as I said in the description.
>
> right.
> But,
>
>> In addition, you can save
>> flash space and store this information only in RAM. I think it's very
>> useful for embedded systems.
>
> CONFIG_MTD_RAM uses only RAM.
> I think there's no big difference about this point.
>

I meant with the "classic" use of mtdoops, therefore with a flash
partition without use MTD_RAM. Using MTD_RAM, it's more or less the
same thing, with the exception of "where" you want deploy the log. For
example: if in your system you have got a nvram you can use it without
problem, you need to specify the address of the nvram to the module.
Very simple. I  think it's a small driver but very useful, feedback
from other embedded guys are welcome.

Marco
