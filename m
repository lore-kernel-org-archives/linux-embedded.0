From: wu zhangjin <wuzhangjin@gmail.com>
Subject: Re: [Celinux-dev] About the "Tiny Linux Kernel" project
Date: Mon, 13 Jun 2011 23:39:30 +0800
Message-ID: <BANLkTinEc6RpqJ4w=fZMBEZmf_-9Gyu9Hg@mail.gmail.com>
References: <BANLkTikupJVJtF1hbnC6Y67E8ma7xNmeGg@mail.gmail.com>
	<4DF2B3EC.6020700@am.sony.com>
	<4DF2B952.30309@am.sony.com>
	<BANLkTik27PR-74=CFrn_Zq6EVx579cLLOA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=lULnpWZ/cyCwfCJV7pUdPzK7UTKKwA7Zo3xYqlIZlNM=;
        b=ZckHNys3EoEkpmGXcvI2s71rGcvQX3yoKUbDqKeFv/llhuNx+bFzltKJLWbRwQIJEL
         teHO5umsoO9MY1sa/DvKSasibkgDU6rfyqcwh3mrinSxqoYBmDTSdGCQHUWt3i2r0IfO
         9slZme5g/YtFue66ardcOjXrU7CCWBFAc/Dgw=
In-Reply-To: <BANLkTik27PR-74=CFrn_Zq6EVx579cLLOA@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alan Carvalho de Assis <acassis@gmail.com>
Cc: Tim Bird <tim.bird@am.sony.com>, Dongdong Deng <libfetion@gmail.com>, Zhan Rongkai <zhanrongkai@gmail.com>, "celinux-dev@tree.celinuxforum.org" <celinux-dev@tree.celinuxforum.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Mon, Jun 13, 2011 at 11:11 PM, Alan Carvalho de Assis
<acassis@gmail.com> wrote:
> Hi Tim,
>
> On 6/10/11, Tim Bird <tim.bird@am.sony.com> wrote:
>> On 06/10/2011 05:16 PM, Tim Bird wrote:
>>> The system has a full network and bluetooth stack, sensor
>>> monitoring software, and a web browser.
>> Oops. Should be "web server". =A0I don't know of a modern
>> browser that fits in less than 3 meg.
>
> Although I didn't test it yet with 3MB, I'm pretty sure that Dillo2
> (www.dillo.org) could fit in 3MB of RAM. The binary size is less than
> 1MB. But it depends what you mean by modern. It doesn't support HTML5=
,
> but support current HTML4 and CSS.

midori and arora are another two candidates:

$ ls -lh /usr/bin/midori
-rwxr-xr-x 1 root root 550K 2010-06-23 03:00 /usr/bin/midori

$ ls -lh /usr/bin/arora
-rwxr-xr-x 1 root root 1.3M 2010-07-21 17:23 /usr/bin/arora

Regards,
Wu Zhangjin

>
> Best Regards,
>
> Alan
>
