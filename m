From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: How to move two valuables to x86 CPU register ebx, ecx by using
 AT&A 	inline asm.
Date: Fri, 20 Nov 2009 09:45:06 +0100
Message-ID: <4B065712.4050202@gmail.com>
References: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753362AbZKTIpH@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :x-enigmail-version:content-type:content-transfer-encoding;
        bh=Vrg71SjtqtFaiPS8DutUaNAWUq6C9Le4ugpuOoRudVM=;
        b=CtPbQzkk50iQZTdkqqpp3fr57Amt1IGl/bamD4MFwzKt1D1iUnGXBwt4/ScOKasFu5
         ORp1LeCfAAhznSOm5VTQ31yze9NAQenYtCOnJgz+SX5dd77LJlV2RzZRn5VDF7xOxwyC
         lh6SdkNyojs0mb4d2n8R2OKtsktfYsSvvquDc=
In-Reply-To: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On 11/19/2009 10:50 AM, Johnny Hung wrote:
> Hi All:
>     I want to move two local valuables to x86 arch CPU ebx, ecx
> register and do outb cpu instruction by using AT&A inline asm in
> kernel driver.  The following code was I wrote but gcc report syntax
> error:
> ==
>     unsigned int val = 10;
>     unsigned int tmp = 5;
>     ....
>     __asm__ volatile ("movl %0, %%ebx"
>           "movl %1, %%ecx"
>           "outb $0x27, $0xb2"
>           :
>           :"r"(val), "r"(tmp)
>           :"%ebx", "%ecx"
>    );
> 
> Does anyone can point me out. Any reply is appreciated.

Why not just:
("outb $0x27, %%al" : : "a" (0xb2), "b"(val), "c" (tmp));
-- 
js
Faculty of Informatics, Masaryk University
Suse Labs, Novell
