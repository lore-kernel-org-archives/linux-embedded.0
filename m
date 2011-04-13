From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: Super Fast Boot of Embedded Linux: 300 ms from boot loader to
 shell
Date: Wed, 13 Apr 2011 19:27:44 +0200
Message-ID: <4DA5DD10.6030305@gmail.com>
References: <BANLkTi=Zahmo_d1Fo7JnaD3iJHAuhSAZGQ@mail.gmail.com>	<4DA331F9.5070902@gmail.com> <BANLkTimLGVfS=wbkmYMRkirsARwFHNYWVw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=XUOENsezkUSCib4xDv7rsYdnOmsGcpwC9t9pLMCys5I=;
        b=Xuu6UTS7q8VMRUP+6jyWBGFn4t8H5UXuEjfSTbhkSVm2MOTFN+a4qsEaN7NElYG+RN
         kv1r5VrdBvjo8U4HSTaEYyj6MFJEtA3wV//NzmWMEk2SOg5UdjBbYEABLN02Sv/voHkx
         F8i2gJAOoeBlBbxdLQhRiXmbe089XnJfG3tWA=
In-Reply-To: <BANLkTimLGVfS=wbkmYMRkirsARwFHNYWVw@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Constantine Shulyupin <const@makelinux.com>
Cc: linux-embedded@vger.kernel.org

Il 13/04/2011 16:53, Constantine Shulyupin ha scritto:
> Thank you Marco for your feedback. I've added summary of used
> optimization method:
> =95 Reduction of kernel and filesystem size
> =95 Kernel features: naked boot, initrd without compression
> =95 Optimization of NAND flash interface in boot loader
> =95 Boot time was measured with utility tstamp
> =95 You can find more detailed list of methods at http://elinux.org/B=
oot_Time
> =95 Techniques for improving embedded Linux startup time, presentatio=
n:
> http://www.makelinux.com/emb/fastboot/MontaVista
>
> Actually, detailed implementations of optimization methods are
> described in numerous documents.

I really know. I was talking about *your* optimization method, but if I=
=20
well understand you've just applied a list of well known methods.
