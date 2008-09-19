From: Daniel THOMPSON <daniel.thompson@st.com>
Subject: Re: local_save_flags(flags)
Date: Fri, 19 Sep 2008 10:52:29 +0100
Message-ID: <48D3765D.3080408@st.com>
References: <545834.68406.qm@web63405.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <545834.68406.qm@web63405.mail.re1.yahoo.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: Mike Frysinger <vapier.adi@gmail.com>, linux embedded <linux-embedded@vger.kernel.org>

Fundu wrote:
> 
>> that book explicitly covers your question.  read chapter 2
>> where it
>> covers these irq functions.
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
> 
> 1) first what's the difference between re-enabling and restoring interrupt state. 
> 2) so is disable interrupts twice a problem, or just enabling them when after they are diabled (which sounds like how it should be ) a problem.
> 
> hope i have made myself clear enough for you to respond.

I think you are confused by the term 'flags'. In this case 'flags' is
not the interrupts that are pending, there are the interrupts that where
enabled before calling local_irq_save().

Does an example help? Consider driver A that calls 'library' code B.

void driver_A()
{
  local_irq_disable();
  /* do something critical */
  library_code_B();
  /* do something else critical */
  local_irq_enable();

  /* NO BUG - if interrupts are not locked when local_irq_disable()
   * was called.
   */
}

void library_code_B(void)
{
#if BUGGY_CODE_COMES_FIRST
    local_irq_disable();
    /* do something critical */
    local_irq_enable();

    /* BUG HERE - driver A thinks interrupts are still disabled but
     * they are not
     */
#else
   flags = local_irq_save();
   /* do something critical */
   local_irq_restore(flags);

   /* NO BUG - interrupts are still locked (flags is used to remember
    * that interrupts were locked when we called local_irq_save().
    */
#endif
}

In fewer words: use local_irq_save/restore() if you don't know whether
interrupts where locked or not when your function was called.

PS There are only a small number of drivers that should use the
   local_irq_... family of functions anyway. Normally you should use
   create a spin lock and use spin_lock_irq() and spin_lock_irqsave()
   instead.

-- 
Daniel Thompson (STMicroelectronics) <daniel.thompson@st.com>
1000 Aztec West, Almondsbury, Bristol, BS32 4SQ. 01454 462659

If a car is a horseless carriage then is a motorcycle a horseless horse?
