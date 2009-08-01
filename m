From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: [PATCH] USB:musb:fix dependency of selecting TWL4030_USB
Date: Sat, 1 Aug 2009 22:51:18 +0800
Message-ID: <d82e647a0908010751k7d8627c1m312b1316ba652563@mail.gmail.com>
References: <1249131718-21388-1-git-send-email-tom.leiming@gmail.com>
	 <5A47E75E594F054BAF48C5E4FC4B92AB0305398DC4@dbde02.ent.ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=gMakvUxJ/3rOb5QArx3cefdGUaan37kGHrYeFazbVSg=;
        b=uxu7HqI24V/P7QSGi3MP1jbBcyJCUlU8U7HFifhQaQ9oLF8JXf/7VG8HI6e1FpZKz4
         Ul35ddfb3HqV3PczPMx6rTsmybPu4RM8BNHq2BRn9rls1/50MwIvVxnFdnLI9u0rTDKo
         NF3Jvskd5o0LMKUcsvU/sM0zBJdzKqlrfm/xU=
In-Reply-To: <5A47E75E594F054BAF48C5E4FC4B92AB0305398DC4@dbde02.ent.ti.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Gadiyar, Anand" <gadiyar@ti.com>
Cc: "greg@kroah.com" <greg@kroah.com>, "dbrownell@users.sourceforge.net" <dbrownell@users.sourceforge.net>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

2009/8/1 Gadiyar, Anand <gadiyar@ti.com>:
> Ming Lei wrote:
>>
>> From: Ming Lei <tom.leiming@gmail.com>
>>
>> All machines based on OMAP34XX should select TWL_4030_USB if
>> they want to support musb.
>
> Not really. The OMAP3 EVM uses an NXP ISP1504 transceiver instead,
> and so registers a NOP transceiver instead.

Oh, I forget that twl4030 is a standalone chip, so please ignore the patch.

Maybe we should remove the dependency on MACH_OMAP_3430SDP, because
many machines may use twl4030.


-- 
Lei Ming
