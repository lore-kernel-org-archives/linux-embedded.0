From: Vitaly Wool <vitalywool@gmail.com>
Subject: Re: [RFC PATCH] arm: drop Execute-In-Place
Date: Thu, 5 May 2011 22:05:12 +0200
Message-ID: <BANLkTik7z+rJDCAaVo5uGgMhbtpWps453g@mail.gmail.com>
References: <1304607121-13612-1-git-send-email-plagnioj@jcrosoft.com>
	<4DC2E5AA.5010604@am.sony.com>
	<4DC2E669.2000101@am.sony.com>
	<1304620350.2398.29.camel@i7.infradead.org>
	<4DC2EF19.5010309@am.sony.com>
	<alpine.LFD.2.00.1105051453280.24613@xanadu.home>
	<BANLkTimfKJPcDN+L4+z1DnsMv_BMOHpyew@mail.gmail.com>
	<4DC2F6B0.80800@am.sony.com>
	<alpine.LFD.2.00.1105051518580.24613@xanadu.home>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=698kiM/bMAQs7Aa2ld5o0MdpwrSdSFe0QaNN9BFdNfQ=;
        b=E4elnYbvAQrFlCm5/KvczqlQGER4i6ihMlE/GC3wfPcLC8CRgQhjCmWU6u+QUJrhaU
         CjzcGKQlAliFFHTp1hBqVhGJYreus4xvvHYPFDgEPxEYJ4mr59cc5bwqf79LmY0pl6dB
         k/sN+fOLD32PzHqxp2G2eMP56Wue8UnNwTIJE=
In-Reply-To: <alpine.LFD.2.00.1105051518580.24613@xanadu.home>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Tim Bird <tim.bird@am.sony.com>, Russell King <linux@arm.linux.org.uk>, linux-embedded <linux-embedded@vger.kernel.org>, Mike Frysinger <vapier.adi@gmail.com>, Tony Lindgren <tony@atomide.com>, David Woodhouse <dwmw2@infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Eric Miao <eric.miao@canonical.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, May 5, 2011 at 9:27 PM, Nicolas Pitre <nicolas.pitre@linaro.org=
> wrote:

> Just to be clear... We have XIP in the tree already. =A0If it is usef=
ul
> to someone, in-tree or out-of-tree, then it is worth keeping around.
> Even if the only user was out-of-tree which certainly wasn't the case
> when I added XIP support to the kernel, then ripping it out and addin=
g
> it back later would be more trouble than preserving it.
>
> What I was asking recently is whether or not XIP is still useful to
> someone today. =A0Apparently it is, which is the answer I was looking=
 for.

Surely it is. The last thing I tried was the i.mx deviation which is
very much based on what's in the tree. It didn't work out without some
bits of hackery and I never got it straight enough to try upstreaming.

But nevertheless, IMO XIP is not dead and is not going to be in the
closest future.

~Vitaly
