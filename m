From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: How to move two valuables to x86 CPU register ebx, ecx by using 
	AT&A inline asm.
Date: Thu, 19 Nov 2009 19:11:40 +0800
Message-ID: <cb9ecdfa0911190311j6cc50c34hfc7e398cbf0a1072@mail.gmail.com>
References: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
	 <4B05187F.6030809@einfochips.com>
	 <cb9ecdfa0911190219r11fa165v331a590889edcfd0@mail.gmail.com>
	 <4B051C40.5040003@einfochips.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Ip+YNIGsV0QuesJ0FP7Za484sKyPJLzOCQQ3cmP+iMU=;
        b=ZM5Yyaa1z2e6f0mNvC7sJ8VOVcuELMQ2F7cc3/feHkKTCTz7Hf1dMl42i0PKv8t2SY
         9kdBBy0Npa+TV9/2KeuwGts9WB4Yn1qtf4POUy3+AL+rmkuCFOrRa0+bCdeGfHtaaFHq
         TL1Wb0AF/XEbSkygn8XqXF621ei1+njZSWLfo=
In-Reply-To: <4B051C40.5040003@einfochips.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Viral Mehta <viral.mehta@einfochips.com>
Cc: kernelnewbies@nl.linux.org, linux-embedded@vger.kernel.org

Thank you. I got error because the valuable I actually pass is a
member of structure point. ex.

       __asm__ volatile ("movl (%0), %%ebx\n"
         "movl (%1), %%ecx\n"
         : : "r"(ptr->cnt), "r"(ptr->blk) );

I reassigned ptr->cnt and ptr->blk to local unsigned int valuable and
compile successfully. BTW, the first ':' is mean output operands,
second ':' is mean input operands but how about third ':'. Does it
mean which registers had been changed in inline asm code? So, does gcc
do push and pop to retain these registers in the front and end of asm
code?
    I have tried to compile inline asm in user space application and
use gcc -S flag to translate c code to asm code. How do I translate
kernel driver to asm code without compile to obj file?

Thank your help
BR, H. Johnny

2009/11/19 Viral Mehta <viral.mehta@einfochips.com>:
> [root@viral temp_c_files]# gcc foo.c
> [root@viral temp_c_files]# cat foo.c
> #include <stdio.h>
> int main()
> {
> =A0 =A0 =A0 unsigned int val =3D 10;
> =A0 =A0 =A0 unsigned int tmp =3D 5;
>
> =A0 =A0 =A0 __asm__ volatile ("movl (%0), %%ebx\n"
> =A0 =A0 =A0 =A0 "movl (%1), %%ecx\n"
> =A0 =A0 =A0 =A0 : : "r"(val), "r"(tmp) );
> }
>
> [root@viral temp_c_files]#
> Thanks,
> Viral Mehta,
> Embedded Software Engineer,
> Tel. No. 91 79 26563705, Ext. 423
> www.einfochips.com <http://www.einfochips.com>
> Prepare and Prevent rather than Repair and Repent
>
>
> Johnny Hung wrote:
>>
>> It doesn't works. :(
>>
>> 2009/11/19 Viral Mehta <viral.mehta@einfochips.com>:
>>
>>>
>>> How about putting \n at the end ?
>>>
>>> Just try out,
>>>
>>> __asm__ volatile ("movl %0, %%ebx\n"
>>> =A0 =A0 =A0 =A0"movl %1, %%ecx\n"
>>>
>>>
>>>
>>>
>>> Thanks,
>>> Viral Mehta,
>>> Embedded Software Engineer,
>>> Tel. No. 91 79 26563705, Ext. 423
>>> www.einfochips.com <http://www.einfochips.com>
>>> Prepare and Prevent rather than Repair and Repent
>>>
>>>
>>> Johnny Hung wrote:
>>>
>>>>
>>>> Hi All:
>>>> =A0 I want to move two local valuables to x86 arch CPU ebx, ecx
>>>> register and do outb cpu instruction by using AT&A inline asm in
>>>> kernel driver. =A0The following code was I wrote but gcc report sy=
ntax
>>>> error:
>>>> =3D=3D
>>>> =A0 unsigned int val =3D 10;
>>>> =A0 unsigned int tmp =3D 5;
>>>> =A0 ....
>>>> =A0 __asm__ volatile ("movl %0, %%ebx"
>>>> =A0 =A0 =A0 =A0 "movl %1, %%ecx"
>>>> =A0 =A0 =A0 =A0 "outb $0x27, $0xb2"
>>>> =A0 =A0 =A0 =A0 :
>>>> =A0 =A0 =A0 =A0 :"r"(val), "r"(tmp)
>>>> =A0 =A0 =A0 =A0 :"%ebx", "%ecx"
>>>> =A0);
>>>>
>>>> Does anyone can point me out. Any reply is appreciated.
>>>>
>>>> BRs, H. Johnny
>>>>
>>>> --
>>>> To unsubscribe from this list: send an email with
>>>> "unsubscribe kernelnewbies" to ecartis@nl.linux.org
>>>> Please read the FAQ at http://kernelnewbies.org/FAQ
>>>>
>>>>
>>>>
>>>> Email Scanned for Virus & Dangerous Content by :
>>>> www.CleanMailGateway.com
>>>>
>>>>
>>>>
>>>>
>>>
>>> --
>>> ___________________________________________________________________=
__
>>> Disclaimer: This e-mail message and all attachments transmitted wit=
h it
>>> are intended solely for the use of the addressee and may contain le=
gally
>>> privileged and confidential information. If the reader of this mess=
age
>>> is not the intended recipient, or an employee or agent responsible =
for
>>> delivering this message to the intended recipient, you are hereby
>>> notified that any dissemination, distribution, copying, or other us=
e of
>>> this message or its attachments is strictly prohibited. If you have
>>> received this message in error, please notify the sender immediatel=
y by
>>> replying to this message and please delete it from your computer. A=
ny
>>> views expressed in this message are those of the individual sender
>>> unless otherwise stated.Company has taken enough precautions to pre=
vent
>>> the spread of viruses. However the company accepts no liability for=
 any
>>> damage caused by any virus transmitted by this email.
>>> ___________________________________________________________________=
__
>>>
>>>
>>>
>>
>>
>> Email Scanned for Virus & Dangerous Content by : www.CleanMailGatewa=
y.com
>>
>>
>>
>
> --
> _____________________________________________________________________
> Disclaimer: This e-mail message and all attachments transmitted with =
it
> are intended solely for the use of the addressee and may contain lega=
lly
> privileged and confidential information. If the reader of this messag=
e
> is not the intended recipient, or an employee or agent responsible fo=
r
> delivering this message to the intended recipient, you are hereby
> notified that any dissemination, distribution, copying, or other use =
of
> this message or its attachments is strictly prohibited. If you have
> received this message in error, please notify the sender immediately =
by
> replying to this message and please delete it from your computer. Any
> views expressed in this message are those of the individual sender
> unless otherwise stated.Company has taken enough precautions to preve=
nt
> the spread of viruses. However the company accepts no liability for a=
ny
> damage caused by any virus transmitted by this email.
> _____________________________________________________________________
>
>
