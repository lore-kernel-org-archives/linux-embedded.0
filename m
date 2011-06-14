From: wu zhangjin <wuzhangjin@gmail.com>
Subject: Re: [Celinux-dev] About the "Tiny Linux Kernel" project
Date: Tue, 14 Jun 2011 08:52:40 +0800
Message-ID: <BANLkTi=CFjnMWazP4Xmwg1ns-vmW_=N_XQ@mail.gmail.com>
References: <BANLkTikupJVJtF1hbnC6Y67E8ma7xNmeGg@mail.gmail.com>
	<4DF2B3EC.6020700@am.sony.com>
	<4DF2B952.30309@am.sony.com>
	<BANLkTik27PR-74=CFrn_Zq6EVx579cLLOA@mail.gmail.com>
	<BANLkTinEc6RpqJ4w=fZMBEZmf_-9Gyu9Hg@mail.gmail.com>
	<BANLkTikLErAaNAgR2GaB9Be1W2gVc4F6aQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=YVXrfD10INWKTouc3sbEmt0Mtqg3hWYXVFITkSRT39w=;
        b=gaoLzc7/RkidgYx0fFOqp4Bmc01a/SrWblIc/6pTtzSzAatcQWs/4vZYZtog43hYbO
         +vwhD3fw0eO1tOnMXhMfEf+S5rPuQACNKcUW+NwcHXp5zIiaV6VKogP4RHRZIWX7d6Na
         ibZQTZMnOmP5a+K2ZBmf3mD3YLu8+LeTcYNR8=
In-Reply-To: <BANLkTikLErAaNAgR2GaB9Be1W2gVc4F6aQ@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Carvalho de Assis <acassis@gmail.com>
Cc: Tim Bird <tim.bird@am.sony.com>, Dongdong Deng <libfetion@gmail.com>, Zhan Rongkai <zhanrongkai@gmail.com>, "celinux-dev@tree.celinuxforum.org" <celinux-dev@tree.celinuxforum.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Mon, Jun 13, 2011 at 11:54 PM, Alan Carvalho de Assis
<acassis@gmail.com> wrote:
> Hi Wu,
>
> On 6/13/11, wu zhangjin <wuzhangjin@gmail.com> wrote:
>>>
>>> Although I didn't test it yet with 3MB, I'm pretty sure that Dillo2
>>> (www.dillo.org) could fit in 3MB of RAM. The binary size is less than
>>> 1MB. But it depends what you mean by modern. It doesn't support HTML5,
>>> but support current HTML4 and CSS.
>>
>> midori and arora are another two candidates:
>>
>> $ ls -lh /usr/bin/midori
>> -rwxr-xr-x 1 root root 550K 2010-06-23 03:00 /usr/bin/midori
>>
>> $ ls -lh /usr/bin/arora
>> -rwxr-xr-x 1 root root 1.3M 2010-07-21 17:23 /usr/bin/arora
>>
>
> I think midori and arora cannot it in 3MB because they are linked
> against my shared libraries, please take a look on return of:
> $ ldd /usr/bin/midori
>
> Dillo2 is statically linked with FLTK (by default FLTK applications
> are statically linked) and even statically linked it have less than
> 1MB.

Yes, but will libopt[1] help If most of the functions in your shared
libraries are not really used?

"The Library Optimizer Tool is used to reduce the size of shared
libraries for an embedded system or other size-contrained environment.
"

Best Regards,
Wu Zhangjin

---
http://libraryopt.sourceforge.net/use.html

>
> BR,
>
> Alan
>
