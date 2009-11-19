From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: How to move two valuables to x86 CPU register ebx, ecx by using 
	AT&A inline asm.
Date: Thu, 19 Nov 2009 18:19:55 +0800
Message-ID: <cb9ecdfa0911190219r11fa165v331a590889edcfd0@mail.gmail.com>
References: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
	 <4B05187F.6030809@einfochips.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758043AbZKSKTv@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=KppnC5XCSKKSdp1Q9vgoe4pdBp3ofCH8/PMbou7f5UA=;
        b=PPTONLcBkIiqL9Qqk+eDWNdRUHrnQtv6fZSF4xI8omOV/6GYAn1DYkaNtpbXDC4r9i
         xBQVxGULwcZrgIe9kM5P3KOtBZgbV3WKkVLZHu2F9l+YXn98xL2L6yYArEEEIK/6VvSs
         mF6eWbWj41qE4LQRvtGYqMM9uOI0Yal+pAzR0=
In-Reply-To: <4B05187F.6030809@einfochips.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Viral Mehta <viral.mehta@einfochips.com>
Cc: kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

It doesn't works. :(

2009/11/19 Viral Mehta <viral.mehta@einfochips.com>:
> How about putting \n at the end ?
>
> Just try out,
>
> __asm__ volatile ("movl %0, %%ebx\n"
> =A0 =A0 =A0 =A0 "movl %1, %%ecx\n"
>
>
>
>
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
>> Hi All:
>> =A0 =A0I want to move two local valuables to x86 arch CPU ebx, ecx
>> register and do outb cpu instruction by using AT&A inline asm in
>> kernel driver. =A0The following code was I wrote but gcc report synt=
ax
>> error:
>> =3D=3D
>> =A0 =A0unsigned int val =3D 10;
>> =A0 =A0unsigned int tmp =3D 5;
>> =A0 =A0....
>> =A0 =A0__asm__ volatile ("movl %0, %%ebx"
>> =A0 =A0 =A0 =A0 =A0"movl %1, %%ecx"
>> =A0 =A0 =A0 =A0 =A0"outb $0x27, $0xb2"
>> =A0 =A0 =A0 =A0 =A0:
>> =A0 =A0 =A0 =A0 =A0:"r"(val), "r"(tmp)
>> =A0 =A0 =A0 =A0 =A0:"%ebx", "%ecx"
>> =A0 );
>>
>> Does anyone can point me out. Any reply is appreciated.
>>
>> BRs, H. Johnny
>>
>> --
>> To unsubscribe from this list: send an email with
>> "unsubscribe kernelnewbies" to ecartis@nl.linux.org
>> Please read the FAQ at http://kernelnewbies.org/FAQ
>>
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
