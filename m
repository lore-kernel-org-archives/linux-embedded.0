From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Subject: Re: How to move two valuables to x86 CPU register ebx, ecx by using 
	AT&A inline asm.
Date: Fri, 20 Nov 2009 14:48:28 +0800
Message-ID: <2375c9f90911192248h368fa79di1761e7b4c479b25b@mail.gmail.com>
References: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=xCFdpwR8UDU0OTqk4Diz9CAcyq7ELntau2+K7Tfeey0=;
        b=JNyFO5WAsHbSAHMsmndO6ZER6uFCR2Yxq4oZ3EhzAYKTgleiVjuY4wSRNqWOVtIgsn
         lZMPRR9CNW2uZAPgQsiHfgyxzXeuHZiCEvWDyRjXbco28EN6/2SFO58OHXv+2gHFjp2C
         Am/azV8QEMQbMeognU/4gYGQwztijW6wCp3+c=
In-Reply-To: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Thu, Nov 19, 2009 at 5:50 PM, Johnny Hung <johnny.hacking@gmail.com>=
 wrote:
> Hi All:
> =C2=A0 =C2=A0I want to move two local valuables to x86 arch CPU ebx, =
ecx
> register and do outb cpu instruction by using AT&A inline asm in
> kernel driver. =C2=A0The following code was I wrote but gcc report sy=
ntax
> error:

You must mean AT&T.

> =3D=3D
> =C2=A0 =C2=A0unsigned int val =3D 10;
> =C2=A0 =C2=A0unsigned int tmp =3D 5;
> =C2=A0 =C2=A0....
> =C2=A0 =C2=A0__asm__ volatile ("movl %0, %%ebx"

You need to put "\n\t" in the end of each asm statement.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"movl %1, %%ecx"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"outb $0x27, $0xb2"


This is wrong, 'outb' instruction cann't accept both of
its operands as constants, IIRC.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:"r"(val), "r"(tmp)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:"%ebx", "%ecx"
> =C2=A0 );
>
> Does anyone can point me out. Any reply is appreciated.

Regards.
