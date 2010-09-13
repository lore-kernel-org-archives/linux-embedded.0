From: Robin Theunis <robint91@gmail.com>
Subject: Re: ARM target not boot after remap memory
Date: Mon, 13 Sep 2010 15:11:07 +0200
Message-ID: <AANLkTi=XoouQ7RtcfSHiGG5vVUcuYAZtuhfzYqOaa8aW@mail.gmail.com>
References: <AANLkTi=tWwaFHB0DY=j0UaqbYdYJpGJpmWdGC4aMufSw@mail.gmail.com>
	<4C8E1417.4060204@compulab.co.il>
	<20100913124049.GG30787@n2100.arm.linux.org.uk>
	<AANLkTi=dT1uMrRctB4=Hvh35zVc-DtReWmHj-18cd9XT@mail.gmail.com>
	<20100913125140.GH30787@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=qQQJekAQERTT/6G/9/ImsR+D0o7l4cYFJzxqagLyZoE=;
        b=f4c7QgC7kPH9QkqR/kVzB6iishEjjzJXehRSq3t/VcFKDUvlDfRsi3hJuP/v9Pr/vu
         xkX4/S+Nfa8Ghhy+6kMqKWGQh1lsYZMBnkUv0f5rN+nk64MrfCQxb3kODNLBSP4mznlb
         H9JlUJtvOD5yloOTkJUsUaXQJzaVr97kOcIDc=
In-Reply-To: <20100913125140.GH30787@n2100.arm.linux.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

I have tested it.

When I compiled the kernel with debug_LL on the and triggered such an
error by changing r1 to
something different. And then I got an error of unsupport machine.


2010/9/13 Russell King - ARM Linux <linux@arm.linux.org.uk>
> On Mon, Sep 13, 2010 at 02:48:18PM +0200, Robin Theunis wrote:
>> Hi Russell,
>>
>> Yes I have tested it. I made a breakpoint at 0x2008000 and viewed th=
at
>> the r1 register and there in I found the correct ID.
>
> Ensure that CONFIG_DEBUG_LL is enabled, and that it outputs to the co=
rrect
> UART. =A0The kernel will produce some messages via the DEBUG_LL stuff=
 prior
> to entering the __error loop.
>
