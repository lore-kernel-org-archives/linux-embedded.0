From: Alan Carvalho de Assis <acassis@gmail.com>
Subject: Re: [Celinux-dev] About the "Tiny Linux Kernel" project
Date: Mon, 13 Jun 2011 12:11:58 -0300
Message-ID: <BANLkTik27PR-74=CFrn_Zq6EVx579cLLOA@mail.gmail.com>
References: <BANLkTikupJVJtF1hbnC6Y67E8ma7xNmeGg@mail.gmail.com>
	<4DF2B3EC.6020700@am.sony.com>
	<4DF2B952.30309@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=8ww6qR7oomCEAV3/w6sB2CAU2RGR4I8ZM91WIXxQeB0=;
        b=M3IE4jEPIRKkANopxlTHSwF20PlLxzAxH6l0L0cZTCXdK0bZJXE2iw5vJLQ5US2qkq
         fgimhU+zolCj4uJSyx7qcV5zHWHXMPNYhBJ8dWV2Kzmcrx/WvDkz7JA00QaJogqsJOsv
         awzF3AbvirxEPVVm4TcICXeDJQbynbfe7ZEAo=
In-Reply-To: <4DF2B952.30309@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: wu zhangjin <wuzhangjin@gmail.com>, Dongdong Deng <libfetion@gmail.com>, Zhan Rongkai <zhanrongkai@gmail.com>, "celinux-dev@tree.celinuxforum.org" <celinux-dev@tree.celinuxforum.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hi Tim,

On 6/10/11, Tim Bird <tim.bird@am.sony.com> wrote:
> On 06/10/2011 05:16 PM, Tim Bird wrote:
>> The system has a full network and bluetooth stack, sensor
>> monitoring software, and a web browser.
> Oops. Should be "web server".  I don't know of a modern
> browser that fits in less than 3 meg.

Although I didn't test it yet with 3MB, I'm pretty sure that Dillo2
(www.dillo.org) could fit in 3MB of RAM. The binary size is less than
1MB. But it depends what you mean by modern. It doesn't support HTML5,
but support current HTML4 and CSS.

Best Regards,

Alan
