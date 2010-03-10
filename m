From: Yuasa Yoichi <yuasa@linux-mips.org>
Subject: Re: [PATCH v2] char drivers: Ram oops/panic logger
Date: Wed, 10 Mar 2010 18:20:33 +0900
Message-ID: <21eaeb5a1003100120x6cd3f69ak598954af3c9fe955@mail.gmail.com>
References: <4B968834.3040609@gmail.com>
	 <21eaeb5a1003091808s2d7638cxd524952a7d84b378@mail.gmail.com>
	 <2ea1731b1003100002w104633ffy1ae46ef3d245e5b5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=8MHyps5glTrbe9QUGNEpNATeOH0UVT6At0oZ/2JnB80=;
        b=PUiUtRwvM5/34AFfeAbuN0K8gCuvjDWpgAGaGkLSSG0WYMHnfaUFYNk6+0t4R9FzJv
         0hNXFudRTEzISeZv9RmhHFx+yFv+HfcqBgKPQbYx/WW8rHnBdnJoytfvuhiypBK/4hux
         5uq2AwG6tAf7Y7j4AI25LrBg8vQlqk76/XM0s=
In-Reply-To: <2ea1731b1003100002w104633ffy1ae46ef3d245e5b5@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

2010/3/10 Marco Stornelli <marco.stornelli@gmail.com>:
> 2010/3/10 Yuasa Yoichi <yuasa@linux-mips.org>:
>> Hi,
>>
>> 2010/3/10 Marco Stornelli <marco.stornelli@gmail.com>:
>>> Ramoops, like mtdoops, can log oops/panic information but in RAM.
>>
>> What is different from mtdoops + mtd-ram?
>>
>> Yoichi
>>
>
> It can be used in a very easy way with persistent RAM for systems
> without flash support. For this systems, with this driver, it's no
> more needed add to the kernel the mtd subsystem with advantage in
> footprint as I said in the description.

right.
But,

> In addition, you can save
> flash space and store this information only in RAM. I think it's very
> useful for embedded systems.

CONFIG_MTD_RAM uses only RAM.
I think there's no big difference about this point.

Yoichi
