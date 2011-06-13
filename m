From: Alan Carvalho de Assis <acassis@gmail.com>
Subject: Re: [Celinux-dev] About the "Tiny Linux Kernel" project
Date: Mon, 13 Jun 2011 12:54:37 -0300
Message-ID: <BANLkTikLErAaNAgR2GaB9Be1W2gVc4F6aQ@mail.gmail.com>
References: <BANLkTikupJVJtF1hbnC6Y67E8ma7xNmeGg@mail.gmail.com>
	<4DF2B3EC.6020700@am.sony.com>
	<4DF2B952.30309@am.sony.com>
	<BANLkTik27PR-74=CFrn_Zq6EVx579cLLOA@mail.gmail.com>
	<BANLkTinEc6RpqJ4w=fZMBEZmf_-9Gyu9Hg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=S/PJ6jMxq9T/w9YyYcComf2hQZOuHn1Ij6sR5Al9Z2Y=;
        b=wzREI7JdeZJQXBQtp+0JItYnK2jkCv8ScUGX3EpE5GFyRrnJp5IZ37JmSIa/7B0L9Y
         s5sQxrlRIJBCwXMSX80cVHTt1qT6tWYuFvJQIaTbg9aiYgbCtGmSMyEb/cMHgItyTB0n
         Y7Yg4LkTywI4MvvrRpNPjybGoqAiIrCbjBlQg=
In-Reply-To: <BANLkTinEc6RpqJ4w=fZMBEZmf_-9Gyu9Hg@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wu zhangjin <wuzhangjin@gmail.com>
Cc: Tim Bird <tim.bird@am.sony.com>, Dongdong Deng <libfetion@gmail.com>, Zhan Rongkai <zhanrongkai@gmail.com>, "celinux-dev@tree.celinuxforum.org" <celinux-dev@tree.celinuxforum.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hi Wu,

On 6/13/11, wu zhangjin <wuzhangjin@gmail.com> wrote:
>>
>> Although I didn't test it yet with 3MB, I'm pretty sure that Dillo2
>> (www.dillo.org) could fit in 3MB of RAM. The binary size is less than
>> 1MB. But it depends what you mean by modern. It doesn't support HTML5,
>> but support current HTML4 and CSS.
>
> midori and arora are another two candidates:
>
> $ ls -lh /usr/bin/midori
> -rwxr-xr-x 1 root root 550K 2010-06-23 03:00 /usr/bin/midori
>
> $ ls -lh /usr/bin/arora
> -rwxr-xr-x 1 root root 1.3M 2010-07-21 17:23 /usr/bin/arora
>

I think midori and arora cannot it in 3MB because they are linked
against my shared libraries, please take a look on return of:
$ ldd /usr/bin/midori

Dillo2 is statically linked with FLTK (by default FLTK applications
are statically linked) and even statically linked it have less than
1MB.

BR,

Alan
