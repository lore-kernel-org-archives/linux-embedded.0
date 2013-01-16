From: "zhaoyilong" <registcn@gmail.com>
Subject: How to use DEBUG macros in compressed/head.S
Date: Wed, 16 Jan 2013 16:17:39 +0800
Message-ID: <94B6F8A1EDC14A8CB9308D5F65F19892@VIU9IM6TKCWEEDX>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:from:to:subject:date:x-priority
         :x-msmail-priority:x-mailer:x-rfc2646:x-mimeole;
        bh=Z4pj3oEc9sLHXeqFXY+iSA9aO/W08ud3lL+iS0hRfHI=;
        b=jjC8Mhfgx6aCZb1UFn1bcWHaUDfzibeBt4zDS7ZxeLVNnh9W6OjDk8N8PLb8Y+HMi0
         1LJQ/j9aOxzhp39WKG8WK2Dpso0NSXjHwG1fnK7+wsjxw7UEMjG/e2F0hIxRM+NnwjsF
         o5a2q2aOfphPvly6TK5tjw4iBJyWccB+z+lAqlrbwtzC2ebTFg+Rkpoy0z80nJudpD+q
         QHqURZ+wtJ4CD6L7kewTQTcRsue2XEhihBPrKX0BMLXLBX87rwUsCVomdPtfulHJBYA4
         JriRUf2Hli3Xzu9YBKWdTTOH3jc1jJ2YzA6GjWVYZ8qJPiDTaKMBBqRiBzqPbV+LiLOx
         J3MQ==
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
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
    To debug this,I want to test the macro kputc provided in this file=97=
=97
using ok kernel.
I add a line "kputc #'a' " after the tag ".text", then make error says
"undefined reference to `putc' ",it seems that compiler cant find "putc=
"
used in
the definition of macro =93kputc=94.
    This is an ok kernel,so I cant say the serial port is not open=97=97=
can
this mean "putc" is defined already?.

So I open DEBUG hoping to see debugging info by kernel itself,but it st=
ops
at"Uncompressing Linux... done, booting the kernel."
Opening DEBUG will lead to the call of =93kputc #'\n' =94 in the code a=
bove
which will also call putc!

Here,my questions comes:

1?Why the error "  undefined reference to `putc'  " disappeared?
2?Why it stops at"Uncompressing Linux... done, booting the kernel."?
3?Can this error ( undefined reference to `putc'  ) mean the serial por=
t is
not open? Where is it defined ?
Is it refer to the C function or just an assembly macro?

