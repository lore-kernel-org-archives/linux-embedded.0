From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: How to move two valuables to x86 CPU register ebx, ecx by using 
	AT&A inline asm.
Date: Mon, 23 Nov 2009 11:14:42 +0800
Message-ID: <cb9ecdfa0911221914t78f7849h9f00c68420f63d14@mail.gmail.com>
References: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
	 <4B065712.4050202@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756188AbZKWDOh@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=pFsqi3p1CMNrWPkw1Shxd3hHIpr9DX0yT0Sjs00R5lg=;
        b=Wi0NOBSogbMouFDJ65NSEi/89nuXofEiOYCRJRA1uW/9zNmTdsCv9/bLsHE+tdnJmz
         UICNgM5UKRBP23N3et6RKwqPuOKytK/SojFhmfYv/fM/NyUCJHLhKiAz+FT5+EGx6TTf
         xU0AHdn5GTXlY3amR9Bo/8oSahaEzKfeLUtBc=
In-Reply-To: <4B065712.4050202@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

After testing:

# gcc inlineasm.c
inlineasm.c: Assembler messages:
inlineasm.c:7: Error: suffix or operands invalid for `out'
[root@debian-johnny] ~/workspace/test

# cat inlineasm.c
#include <stdio.h>

int main ()
{
    unsigned int val = 5, tmp = 10;
    asm volatile ("outb $0x27, %%al"
     :
     : "a" (0xb2), "b"(val), "c" (tmp)
    );
}

    It seems the source of outb instruction cannot be a constant. Is
there a AT&T instructions document for x86?

BRs, H. Johnny
> Why not just:
> ("outb $0x27, %%al" : : "a" (0xb2), "b"(val), "c" (tmp));
> --
> js
> Faculty of Informatics, Masaryk University
> Suse Labs, Novell
>
