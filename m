From: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 10:26:37 +0100
Message-ID: <200901021026.37905.a.miskiewicz@gmail.com>
References: <200901020207.30359.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=BEUNZD6eJzPXeYF0F54bkbiDMERf6YYrfMvi6pjboa4=;
        b=voaxx4dW+Y4gfCmtbUgxHVxU6aFcUkiv5FPsxaaYtAiBT28LgNPeBOzDR43rbBHIwU
         Bt25s088OuUXhnrxxKt+3+hDmCFKzFnqg05qxdXLtJM4LjugCQfbMQ4kVapjDGE53Ett
         KbTDaPj218KdwPToqMaZeFFxcQT4fNvQTLmj4=
In-Reply-To: <200901020207.30359.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-kernel@vger.kernel.org
Cc: Rob Landley <rob@landley.net>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Friday 02 of January 2009, Rob Landley wrote:
> Before 2.6.25 (specifically git bdc807871d58285737d50dc6163d0feb72cb0=
dc2 )
> building a Linux kernel never required perl to be installed on the bu=
ild
> system.  (Various development and debugging scripts were written in p=
erl
> and python and such, but they weren't involved in actually building a
> kernel.) Building a kernel before 2.6.25 could be done with a minimal
> system built from gcc, binutils, bash, make, busybox, uClibc, and the=
 Linux
> kernel, and nothing else.

And now bash is going to be required... while some distros don't need/h=
ave=20
bash. /bin/sh should be enough.

Heh,
--=20
Arkadiusz Mi=C5=9Bkiewicz        PLD/Linux Team
arekm / maven.pl            http://ftp.pld-linux.org/
