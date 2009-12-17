From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: Project Proposal: add sleeping spinlocks to mainline kernel
Date: Thu, 17 Dec 2009 10:54:23 +0100
Message-ID: <63386a3d0912170154k6521433fl90b2ae96efb70a34@mail.gmail.com>
References: <4B296390.3090004@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=lGnSnLj0e1SttN6b4upbTTfcQwNR3GQU1/cHzzoZS8o=;
        b=rkZ9IpRBGr85iq+xRtPmu8nOVzGeA+dtQMkM92aEnFHjMy6ajlQ0uEVwZpSjtg9AJO
         dcaUNo//eiWmUrQqu8nnCqKP+CIzE9Nj4ipYvAWD6Ty+fkRZTlD7LalbzLCxZ6zOTuqr
         0vDcNQEa2FHbZs5yypawZLgcCUa8OyIMsebQc=
In-Reply-To: <4B296390.3090004@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: CE Linux Developers List <celinux-dev@tree.celinuxforum.org>, linux-embedded <linux-embedded@vger.kernel.org>

2009/12/16 Tim Bird <tim.bird@am.sony.com>:

> Summary: add sleeping spinlocks to the mainline kernel

If realtime performance overall is a big deal for CELF I would suggest
adding "Kill-the-BKL" to the suggested projects. There are still some
RTOS people using the BKL as an argument to flak the Linux kernel,
c.f.
http://www.freescale.com/files/32bit/doc/ref_manual/EMBMCRM.pdf
(section 5.2)

Another item could be to go through some common embedded
arch drivers and switch them from request_irq() to request_threaded_irq()
just based on the observation that almost nobody actually use that
in the mainline kernel, though I'm sure they should,
if realtime is a desired feature.
(The wm8350-core driver is an excellent example of a situation where
it is used properly.)

NB: I'm not a member of the CE Linux Forum and nor is my company
so I'm just talking freely here. (linux-embedded is public, hehe.)

Yours,
Linus Walleij
