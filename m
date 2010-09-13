From: Robin Theunis <robint91@gmail.com>
Subject: Re: ARM target not boot after remap memory
Date: Mon, 13 Sep 2010 20:28:54 +0200
Message-ID: <AANLkTinzchkOZ67+wVXejLb+UqLRCu+zrzVB4j5zG2_w@mail.gmail.com>
References: <AANLkTi=tWwaFHB0DY=j0UaqbYdYJpGJpmWdGC4aMufSw@mail.gmail.com>
	<20100913121247.GA4003@sig21.net>
	<AANLkTiksacwuOwqJGZ0F3M1jhZ6Srr88wbfBQodOGOAt@mail.gmail.com>
	<20100913172606.GA14462@sig21.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=cVTeK9MmEA1veWqJCur0HZVMcay5K38nRQDtiVOJC0E=;
        b=nZmcFESGfouko6zITORypRjdhmaV2IJg5PfrgtqRtB2asAWtUeFz9Nr1ylfbxlZe88
         ndyzeOu/LcJzRfS/RZ5MA4H2a7p/H5eyNsLIWZS3NOMM4YAYseUE5W7TEkOH/I4dVmIA
         3L3ihJ2oGwj99sJ0VFkYUruIVjs9yiNr0qJas=
In-Reply-To: <20100913172606.GA14462@sig21.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Johannes Stezenbach <js@sig21.net>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

The __log_buf

<5>Linux version 2.6.34.1robin9200v1.0 (robin@pc-robin) (gcc version
4.3.5 (Buildroot 2010.08) ) #36 Mon Sep 13 15:18:08 CEST 2010
<4>CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=3Dc0007177
<4>CPU: VIVT data cache, VIVT instruction cache
<4>Machine configuration botched (nr 251), unable to continue.

I don't understand it. What does it means? I have my mach types setup c=
orrectly.

Robin

2010/9/13 Johannes Stezenbach <js@sig21.net>:
> On Mon, Sep 13, 2010 at 04:30:17PM +0200, Robin Theunis wrote:
>>
>> I have compiled =A0the kernel with early printk on and debug_LL, It =
still
>> doesn't nothing after that line.
>
> Please don't top-post.
>
> Did you add "earlyprintk" to your kernel command line
> like the EARLY_PRINTK menuconfig help text suggests?
>
> arch/arm/mach-at91/include/mach/debug-macro.S also suggests
> the LL debug output goes to AT91 debug unit not to normal UART
> (not sure about this, I don't know much about AT91).
> Did you try to dump __log_buf using JTAG?
>
>
> HTH
> Johannes
>
