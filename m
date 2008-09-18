From: Fundu <fundu_1999@yahoo.com>
Subject: Re: local_save_flags(flags)
Date: Thu, 18 Sep 2008 15:45:14 -0700 (PDT)
Message-ID: <545834.68406.qm@web63405.mail.re1.yahoo.com>
References: <8bd0f97a0809181507u265ec60eu597500ab6187e211@mail.gmail.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0809181507u265ec60eu597500ab6187e211@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux embedded <linux-embedded@vger.kernel.org>



> that book explicitly covers your question.  read chapter 2
> where it
> covers these irq functions.
as i said i'm reading the book and actully i did read that chapter. 

for me, here's the exact line that needs clarification,
In chapter 2, page 42 last paragraph(starts with "However, if ..." )

here's the code snippet he's talking about.
Point A:
local_irq_disable();
/* critical section ...*/
local_irq_enable();


Author say, if irg are already disabled at Point A (see snippet above) then local_irq_enable() creates an unpleasant side effect of re-enabling interrupts rather than restoring interrupt state. 

1) first what's the difference between re-enabling and restoring interrupt state. 
2) so is disable interrupts twice a problem, or just enabling them when after they are diabled (which sounds like how it should be ) a problem.

hope i have made myself clear enough for you to respond.

TIA  




      
