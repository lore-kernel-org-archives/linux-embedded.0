From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: Expose system Serial Number to userspace.
Date: Wed, 29 Aug 2012 19:07:10 +0200
Message-ID: <503E4C3E.3030608@gmail.com>
References: <09ee18b0d2e3d7f34a9e510b3f8d7702@mail.gmail.com> <503E3DDB.8050708@gmail.com> <75d49b059819c35d03995bd86e72d6fb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=h++XL5HzqoJ5dsevc6eGM7eSoq2+lhMklgXSj7HINhs=;
        b=x2Awv8MzRgdvpSjHLCZy0/IYDSeSJdtPTg1l2M0ju7TY2uwnnq34b1cXfLnblVrw1M
         Odo9CcAGn3Ao2AbgHAJM6sL1gU9PfaORnEmU94MmwrOU6UeIgzM+IfKIR9oUxaH98Yiy
         MSgyuwWSxAmxeBY8La20T6HL7bUU37seat/YS5VVOb8Oi3NSO8+/VZGZ/nG+B1WZvCZG
         AC/6mfFGDvq0vnCMbpmYv/+MbzhoLenVWBoWbVqEKyIySgFQNB8hAWCYU/qOLm7X7Es2
         cJwGmf7mLAmgOWRvEInZ+VRQrMXDaj0bu4PPvAd09c9Z4vH554cGOOV5R4Pgr7ngapIH
         lo4g==
In-Reply-To: <75d49b059819c35d03995bd86e72d6fb@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brad Arnold <brad@check-it.ca>
Cc: linux-embedded@vger.kernel.org

Il 29/08/2012 18:57, Brad Arnold ha scritto:
> That'll help me move along. I'm currently storing the mac and serial in
> the u-boot environment, but I was thinking I might want to move those two
> to the OTP. But at least having some level of write protection in u-boot
> is nice. I wasn't aware that this existed, because it's disabled by
> default in the config for Marvell boards.
>
> I'll have to look at that example program futher...
>
> Brad
>
>

(Please no top-posting). Of course, if you have got a separate flash 
partition for the uboot env, you can map it read-only in linux, it's safer.

Marco
