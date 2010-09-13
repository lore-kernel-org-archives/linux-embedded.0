From: Robin Theunis <robint91@gmail.com>
Subject: Fwd: ARM target not boot after remap memory
Date: Mon, 13 Sep 2010 16:31:04 +0200
Message-ID: <AANLkTim4pJYMyRpb8SQddS_fiReQKKCvBCFrgEGUb+v+@mail.gmail.com>
References: <AANLkTi=tWwaFHB0DY=j0UaqbYdYJpGJpmWdGC4aMufSw@mail.gmail.com>
	<20100913121247.GA4003@sig21.net>
	<AANLkTiksacwuOwqJGZ0F3M1jhZ6Srr88wbfBQodOGOAt@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=ZQe/a/M7uDhtOoZDAP2ErLgVvl6zm9J/+UNNpTCqwsI=;
        b=f1/Lq829XRRP8RugSX4/xbZZmDWRJYB+jRDrm7uVdubMPYOrGleODQpYTcuRVKR4RB
         4/bwcQSiBxzM3ClobTggG2ZUNfoZMXwrFTOl90L7nFYc5ODpMEaocbJ6TYg1KQIvAdt6
         6hyGDgXF7dJ5MuBzxZBIyw2UrT4xTYiqY+108=
In-Reply-To: <AANLkTiksacwuOwqJGZ0F3M1jhZ6Srr88wbfBQodOGOAt@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

hi Johannes

I have compiled =A0the kernel with early printk on and debug_LL, It
still doesn't nothing after that line.

Robin

2010/9/13 Johannes Stezenbach <js@sig21.net>:
> On Mon, Sep 13, 2010 at 01:25:26PM +0200, Robin Theunis wrote:
>>
>> Uncompressing Linux... done, booting the kernel.
>> ---
>>
>> Here is stalls. With my jtag probe I can locate the problem.
>>
>> ---
>> > halt
>> target state: halted
>> target halted in ARM state due to debug-request, current mode: Super=
visor
>> cpsr: 0x600000d3 pc: 0xc000af3c
>> MMU: enabled, D-Cache: enabled, I-Cache: enabled
>> > =A0 arm disassemble 0xc000af3c
>> 0xc000af3c =A0 =A00xeafffffe =A0 =A0 =A0B 0xc000af3c
>> ---
>>
>> This just loops at that address. Why does it that?
>
> Maybe it panicked but you can't see the message since
> you have not enabled EARLY_PRINTK.
>
> Since you have JTAG, you could also dump the printk
> buffer __log_buf to see the message.
>
>
> HTH
> Johannes
>
