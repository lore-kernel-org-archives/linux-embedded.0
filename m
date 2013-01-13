From: "zhaoyilong" <registcn@gmail.com>
Subject: opening DEBUG in compressed/head.S, kernel crashed
Date: Sun, 13 Jan 2013 20:38:39 +0800
Message-ID: <CDB1F2C87B4043CEB341E2066361C326@VIU9IM6TKCWEEDX>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:from:to:subject:date:x-priority
         :x-msmail-priority:x-mailer:x-mimeole:x-rfc2646;
        bh=6iIXED9LeHVf0lGwLTkseRHnzjyQuznHfSnAu0LBdRY=;
        b=0Mq9x089Y7ohzHdA4oE11nKWubOo4Zu64JRCl/OUB8MrBHEDOhH1nXsYz4It923lpg
         dPh2BFt0m7DsiOb91K4sWzF6fIQgtz1B6R9wHJ6+5mqvcnC93Y5JwYpniKnmoM1qc2mP
         cydXMuPAFK5Efy95qphYRZ6Koc0i3U4XXsvQ0zWsr6z4jc/Wq95BAq4X+z3mbqsBV08F
         HbsTMjUu/4EjZFYgybDYFKi4eTIj8uSJEqEkTeF6AmTS4c3Wse4c//Xz9WanjMMDVlLK
         gcS2C4Nj7YQ5M33y2rukCskGVKrhDFHaoyK2LlWh72BJjHgbKHYp13ddN2LAGmmJDg/y
         qjwg==
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux- embedded <linux-embedded@vger.kernel.org>

 When I open the macro DEBUG in the front of  file
arch/arm/boot/decompressed/head.S,the kernel runs and stops at"Uncompre=
ssing
Linux... done, booting the kernel."
CONFIG_DEBUG_ICEDCC is closed by default, so I am sure  the code runs t=
othe
following branch:
=2E..........
=2E..........
=2E..........
=2Emacro kputc,val
mov r0, \val
bl putc
=2Eendm

=2Emacro kphex,val,len
mov r0, \val
mov r1, #\len
bl phex
=2Eendm

=2Emacro debug_reloc_start
#ifdef DEBUG
kputc #'\n'
kphex r6, 8 /* processor id */
kputc #':'
kphex r7, 8 /* architecture id */
=2E..........
=2E..........
=2E..........

Problem is happened in a context like this:

    I have a board use cpu S5PV210,and an ok kernel provide by the fact=
ory
anda  kernel download from kernel.org which carshed after printing "sta=
rting
kernel..." to dnw.
    To debug this,I want to test the macro kputc provided in this file=A1=
=AA=A1=AA
using ok kernel.
I add a line "kputc #'a' " after the tag ".text", then make error says
"undefined reference to `putc' ",it seems that compiler cant find "putc=
"
used in
the definition of macro =A1=B0kputc=A1=B1.
    This is an ok kernel,so I cant say the serial port is not open=A1=AA=
=A1=AAcan
this mean "putc" is defined already?.

So I open DEBUG hoping to see debugging info by kernel itself,but it st=
ops
at"Uncompressing Linux... done, booting the kernel."
Opening DEBUG will lead to the call of =A1=B0kputc #'\n' =A1=B1 in the =
code above
which will also call putc!

Here,my questions comes:

1=A1=A2Why the error "  undefined reference to `putc'  " disappeared?
2=A1=A2Why it stops at"Uncompressing Linux... done, booting the kernel.=
"?
3=A1=A2Can this error ( undefined reference to `putc'  ) mean the seria=
l port is
not open? Where is it defined ?
Is it refer to the C function or just an assembly macro=A3=BF=20

