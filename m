From: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: New MMC maintainer needed
Date: Fri, 31 Jul 2009 16:36:24 +0300
Message-ID: <6d1efe520907310636g3c8fab76vc495169326fe77f1@mail.gmail.com>
References: <812689.20578.qm@web37604.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751352AbZGaNg0@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=v/PdUjSGvaHSy0/GyJQVGzqtnpJUItLYBvlfrg3b8QE=;
        b=wzFYUkNgsduNCIE35/7YeOU0fd8E3m+wnGXAWcjM63vdbbczjuS2pjFOQlCptvT9iW
         4LHRF9BnSCVtWI6tDt5rsk+7dTVgr+eONuvbWKCimReEtbKsio2TFo8fcWMBnxl74/sn
         kjMKuYdb1FmckGSx5so6c6i3Q4olxbisGF12I=
In-Reply-To: <812689.20578.qm@web37604.mail.mud.yahoo.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Dubov <oakad@yahoo.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org, Nicolas Pitre <nico@cam.org>, Nicolas Ferre <nicolas.ferre@rfo.atmel.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Tony Lindgren <tony@atomide.com>, David Brownell <david-b@pacbell.net>, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, Pavel Pisa <ppisa@pikron.com>, Jarkko Lavinen <jarkko.lavinen@nokia.com>, Ben Dooks <ben@fluff.org>, saschasommer@freenet.de, avorontsov@ru.mvista.com, ian@mnementh.co.uk, HaraldWelte@viatech.com, JosephChan@via.com.tw, Adrian Hunter <adrian.hunter@nokia.com>, Pierre Ossman <pierre@ossman.eu>

On Wed, Jul 15, 2009 at 7:59 AM, Alex Dubov<oakad@yahoo.com> wrote:
>
>> I'm afraid the time has come for me
>> to step down as maintainer for the
>> MMC/SD/SDIO subsystem and for someone else to take over the
>> rudder. It
>> is no secret that I haven't been able to give the
>> maintainer role the
>> resources it required, and as a result it has gone from
>> being a fun
>> hobby to a burdensome chore. I was hoping it was a
>> temporary slump, but
>> this has been the norm for over a year now, so it's time
>> for me to
>> throw in the towel.
>
> What an unfortunate thing.
>
> Franky speaking, I couldn't manage any time to work on Linux
> in the last year myself. I had such a great plans for Memstick
> and such, yet none advanced.
>
> At this rate, the future of the flash cards on Linux will
> become highly uncertain.
> :-(
>

Me too.

I had plans to reverse engineer and then write drivers for my ricoh 5
in one controller
for SD and memstick mode (especialy XD)
Now I know that RE part isn't the hardest probably, but writing the
core support for XD subsystem (your was rejected I see)

I am also an owner of a jmicron controller, and thanks to you memstick
on it is supported.

What to do now?

Best regards,
         Maxim Levitsky
