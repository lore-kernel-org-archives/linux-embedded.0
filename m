From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: GPIO triggers kernel reboot
Date: Sat, 25 Jan 2014 18:54:40 -0800
Message-ID: <52E478F0.60903@gmail.com>
References: <52E3E031.6040709@denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=V2mf+Jd5yG7f50ORilqRbaFTp17vnWtpVTolrNh/6NA=;
        b=QQhSybXOon4DNNK5H+ELbpbwWXZXxmMOOmgiLGThAtilGE0GrasaBxuOU+f+6TLBqf
         TpyapX4TKLFsQotBgdu14LckCY6S38mtAbSAl1j1EK8I1lUL07hRtRZ3jRI28Y0bsHG9
         g8Bl/XX+Tv2Zm4w7C/L+k2gdd8n4KlUUlB4cZA/GtrBnh6QpAhlA4L+0K6Eg1J8LoBqW
         3XoA7HMMc9SE0jJVvHOg1XEOGVC8ss3rxsF4vDesuZG8SllSWKmLqd5WDaE4kyayGHzy
         eYS1lXsof8LFDZdjF5w4uzw1S/8+mSdSsNZ+0o7SyGl24clc6jIn5eXaqb2v7eXr6+iG
         3nPQ==
In-Reply-To: <52E3E031.6040709@denx.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: hs@denx.de, linux-embedded@vger.kernel.org
Cc: Wolfgang Denk <wd@denx.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Le 25/01/2014 08:02, Heiko Schocher a =E9crit :
> Hello all,
>
> is it possible to reboot current mainline kernel triggered from a
> GPIO in kernel space?
>
> If not, how can be done this, so that it has a chance to go into
> mainline?

Your GPIO could (should) be bound to a gpio-keys driver which will=20
deliver key presses event; which you can ultimately bind to the action=20
of triggering a system reboot.

Granted, this makes you cross a lot of layers, and requires user-space=20
to implemnt the reboot policy, but what you are asking for is both a=20
mechanism and policy mix, which is usually not accepted.

You are probably working with HW which won't change, but wiring a reset=
=20
button to a system reset output is usually much simpler ;)

>
> Thanks for any suggestions
>
> bye,
> Heiko
