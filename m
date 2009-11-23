From: Brian Gerst <brgerst@gmail.com>
Subject: Re: How to move two valuables to x86 CPU register ebx, ecx by using 
	AT&A inline asm.
Date: Mon, 23 Nov 2009 00:43:47 -0500
Message-ID: <73c1f2160911222143j196fac7cqf0464c4ad9c35cfc@mail.gmail.com>
References: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
	 <4B065712.4050202@gmail.com>
	 <cb9ecdfa0911221914t78f7849h9f00c68420f63d14@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=7KbBnIKDF58j0lcCLdm5P18OobsAnBSigqGDGlVNJMg=;
        b=jFXLVbKAkqymR7QxTAGASyN4pr0/ZZl7BG8EufbKiC2ctL66vf4JMx1VfYtZS6feWl
         WE1/hDWfaMOZfUa2uReR7+7v0G4quR+v8EXn9G19+nqhpRV1CLd0+P3IF0qGT8GhELup
         w2mucC2LRh8Mni5odFx4qzoCbOag3RVjbdYI0=
In-Reply-To: <cb9ecdfa0911221914t78f7849h9f00c68420f63d14@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: Jiri Slaby <jirislaby@gmail.com>, kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Sun, Nov 22, 2009 at 10:14 PM, Johnny Hung <johnny.hacking@gmail.com=
> wrote:
> After testing:
>
> # gcc inlineasm.c
> inlineasm.c: Assembler messages:
> inlineasm.c:7: Error: suffix or operands invalid for `out'
> [root@debian-johnny] ~/workspace/test
>
> # cat inlineasm.c
> #include <stdio.h>
>
> int main ()
> {
> =C2=A0 =C2=A0unsigned int val =3D 5, tmp =3D 10;
> =C2=A0 =C2=A0asm volatile ("outb $0x27, %%al"
> =C2=A0 =C2=A0 :
> =C2=A0 =C2=A0 : "a" (0xb2), "b"(val), "c" (tmp)
> =C2=A0 =C2=A0);
> }
>
> =C2=A0 =C2=A0It seems the source of outb instruction cannot be a cons=
tant. Is
> there a AT&T instructions document for x86?

In AT&T syntax, the source register comes first.  So it should be
"outb %%al, $0x27", assuming that 0x27 is the port number you are
trying to write to.

--
Brian Gerst
