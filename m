From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Project Proposal: add sleeping spinlocks to mainline kernel
Date: Thu, 17 Dec 2009 10:45:06 -0800
Message-ID: <4B2A7C32.10109@am.sony.com>
References: <4B296390.3090004@am.sony.com> <63386a3d0912170154k6521433fl90b2ae96efb70a34@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <63386a3d0912170154k6521433fl90b2ae96efb70a34@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: CE Linux Developers List <celinux-dev@tree.celinuxforum.org>, linux-embedded <linux-embedded@vger.kernel.org>

Linus Walleij wrote:
> 2009/12/16 Tim Bird <tim.bird@am.sony.com>:
> 
>> Summary: add sleeping spinlocks to the mainline kernel
> 
> If realtime performance overall is a big deal for CELF I would suggest
> adding "Kill-the-BKL" to the suggested projects. There are still some
> RTOS people using the BKL as an argument to flak the Linux kernel,
> c.f.
> http://www.freescale.com/files/32bit/doc/ref_manual/EMBMCRM.pdf
> (section 5.2)

The only reference I could find in section 5.2 to BKL was
an OSE BKL.  Maybe I missed the reference to the Linux BKL.
(I looked pretty quickly).

However, agree that BKL reduction is a worthy goal.

> 
> Another item could be to go through some common embedded
> arch drivers and switch them from request_irq() to request_threaded_irq()
> just based on the observation that almost nobody actually use that
> in the mainline kernel, though I'm sure they should,
> if realtime is a desired feature.
> (The wm8350-core driver is an excellent example of a situation where
> it is used properly.)

Likely, CELF would be most interested in switching to using
threaded interrupts in places where the drivers were commonly
used in embedded devices.  This would require some analysis.
But this is another good suggestion.

> NB: I'm not a member of the CE Linux Forum and nor is my company
> so I'm just talking freely here. (linux-embedded is public, hehe.)

The feedback is much appreciated!
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
