From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: local_save_flags(flags)
Date: Thu, 18 Sep 2008 18:51:23 -0400
Message-ID: <8bd0f97a0809181551u477911f6iccea3c74c6e6832d@mail.gmail.com>
References: <8bd0f97a0809181507u265ec60eu597500ab6187e211@mail.gmail.com>
	 <545834.68406.qm@web63405.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=hrYVblUbdxNKelAEWHf7NWaubGbNY82h8BYDx6JHgYs=;
        b=vPdCqvPsIkqvy5hxslFmZ6BESbs7om3oR+H67NJwxvF7gVu3baCMIbvS+c1QmXkbtQ
         FFe5tJv2prbDOXlSpVg71IN8ju6t+Xsy+vP6BzmFU09A4MlnW/9lndld//vH5D3gHmQB
         nyy1UerwsQS81oMv7GEt/pr3Ohf5+5I/rpJt4=
In-Reply-To: <545834.68406.qm@web63405.mail.re1.yahoo.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux embedded <linux-embedded@vger.kernel.org>

On Thu, Sep 18, 2008 at 18:45, Fundu wrote:
>> that book explicitly covers your question.  read chapter 2
>> where it
>> covers these irq functions.
>
> as i said i'm reading the book and actully i did read that chapter.
>
> for me, here's the exact line that needs clarification,
> In chapter 2, page 42 last paragraph(starts with "However, if ..." )
>
> here's the code snippet he's talking about.
> Point A:
> local_irq_disable();
> /* critical section ...*/
> local_irq_enable();
>
>
> Author say, if irg are already disabled at Point A (see snippet above) then local_irq_enable() creates an unpleasant side effect of re-enabling interrupts rather than restoring interrupt state.

this was the section i referred to ... but i guess it made perfect
sense to me since i'm familiar with the details

> 1) first what's the difference between re-enabling and restoring interrupt state.

many irq controllers have a global enable bit.  you can restore the
interrupt mask state without toggling that bit.

> 2) so is disable interrupts twice a problem, or just enabling them when after they are diabled (which sounds like how it should be ) a problem.

both are a problem.  the non-state saving version cannot be used
recursively nor in parallel to the state-saving version.
-mike
