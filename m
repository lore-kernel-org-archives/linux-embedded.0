From: Abbas Raza <abbas_raza@mentor.com>
Subject: Re: Boot time: Optimize CPU bring up?
Date: Sat, 29 Jun 2013 22:34:06 +0000 (UTC)
Message-ID: <loom.20130630T003220-844@post.gmane.org>
References: <51B0770E.3070601@de.bosch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org


Dirk Behme <dirk.behme <at> de.bosch.com> writes:

> 
> Hi,
> 
> on a ARMv7 Freescale i.MX6 based system we are looking at optimizing the 
> kernel boot time. Booting a 3.5.7 kernel with SMP=y and the kernel 
> option 'nosmp' (the i.MX6 has single, dual and quad CPU versions) we get
> 
> [    0.255927] hw perfevents: enabled with ARMv7 Cortex-A9 PMU driver, 7 
> counters available
> [    0.256033] Setting up static identity map for 0x10426a28 - 0x10426a80
> [    0.260204] initcall spawn_ksoftirqd+0x0/0x58 returned 0 after 9765 usecs
> [    0.270363] initcall init_workqueues+0x0/0x39c returned 0 after 9765 
> usecs
> [    0.290265] initcall cpu_stop_init+0x0/0xd0 returned 0 after 19531 usecs
> [    0.310449] initcall rcu_spawn_kthreads+0x0/0xc0 returned 0 after 
> 19531 usecs
> [    0.310699] Brought up 1 CPUs
> [    0.310712] SMP: Total of 1 processors activated (1581.05 BogoMIPS).
> 
> I.e. ~55ms just for bringing up the 1 CPU.
> 
> Looking into some details, e.g. cpu_stop_init(), the ~19531 usecs are 
> there because the system 'hangs' 2 jiffies (CONFIG_HZ=100) in 
> cpu_v7_do_idle().
> 
> For testing purposes switching to CONFIG_HZ=1000 reduces above 54ms to 
> just ~4ms. But we are unsure to switch the whole system to 
> CONFIG_HZ=1000 just to optimize this part of the boot process.
> 
> Does anybody know why all the above parts are idling for some jiffies? 
> Is there any other optimization than CONFIG_HZ=1000 possible?
> 
> In case there are any patches floating around or this was already 
> discussed, any link would be nice.
> 
> Many thanks and best regards
> 
> Dirk
> 

Hi Dirk,

I have done some analysis to find out where it is idling for some jiffies
during kernel boot. I have compiled my findings below and also suggested
some solutions. Please take a look

starting from start_kernel 
==========================
0) scheduler init routine creates idle thread
1) rest_init() is called from start_kernel()
2  2 threads are created kernel_init and kthreadd
3) schedule() called for first time
4) kthreadd scheduled first by cfs scheduler
5) kthreadd looks if there is any new thread to be created
6) since there is no new thread to be created so it set state
TASK_INTERRUPTIBLE and calls schedule()
7) now kernel_init is picked by scheduler
8) kernel_init calls do_pre_smp_initcalls
9) when spawn_ksoftirqd initcall is run by kernel init thread, it goes to
create a kthread(ksoftirqd)
10) for this it wakes up kthreadd
11) a new kthread is created by kthreadd
12) kthreadd looks if any other kthread to be created in create list
13) since there is no kthread to be created so it calls scheduler with state
TASK_INTERRUPTIBLE
14) now scheduler picks kernel init thread to br executed next
15) kernel init thread calls wait_for_completion(&create.done) which is
supposed to be set by newly created kthread.
16) schedule timeout occurs and scheduler next picks newly created kthread.
17) newly created kthread sets state TASK_UNINTERRUPTIBLE and sends complete
signal create.done 
18) scheduler then schedules kernel init thread which goes to bind this
newly created kthread to cpu0 using kbind().
19) kernel init thread checks if newly created kthread has been dequeued.
20) if not dequeued yet, it means its still in run queue.
21) if 20 is yes then kernel init goes to sleep 

for HZ=100, it sleeps for 10ms while for HZ=1000, it sleeps for 1ms

                if (unlikely(on_rq)) {
                        ktime_t to = ktime_set(0, NSEC_PER_SEC/HZ);
                        set_current_state(TASK_UNINTERRUPTIBLE);
                        schedule_hrtimeout(&to, HRTIMER_MODE_REL);
                        continue;
                }

22) Now scheduler picks newly created kthread from run queue.
23) this kthread is dequeues by calling schedule with TASK_UNINTERRUPTIBLE
state set
24) Now at this time all the kthreads are in dequeued state except idle i.e

kthreadd --> dequeued
kernel init --> dequeued
kthread (ksoftirqd) --> dequeued

25) Nothing left on run queue so scheduler calls idle thread.
26) Now system runs in idle thread until 1 timer tick is received i.e for
10ms (HZ=100)
27) when 1 timer tick is received, system get out from idle thread
28) scheduler wakes up kernel init thread 
29) kernel init thread again checks if kthread (ksoftirqd) has been dequeued 
30) if it founds it dequeued, it finally binds it with cpu0
31) kernel init continues execution and kthread (ksoftirqd) is woken up and
put on run queue again for cpu0.
32) kthread gets scheduled later and run_ksoftirqd() is called then.

So 1 timer tick is always consumed in idle loop in step 21 while booting
whenever there is a need to bind a kthread to cpu. The same thing happens with
early initcalls init_workqueues and cpu_stop_init causing the boot time to
increase.

Possible solutions to decrease the boot time:
==============================================

--------------------------------------------------------
1) Increasing CONFIG_HZ=100 (default) to CONFIG)_HZ=1000
--------------------------------------------------------

Increasing the timer ticks i.e HZ=1000 which will cause step 21 to sleep for
only 1ms.

draw backs: increasing the timer ticks decreases throughput.

OR 

--------------------------------
2) use CONFIG_PREEMPT_VOLUNTARY:
--------------------------------

draw backs: Reduces the maximum latency of rescheduling at the cost of
slightly lower throughput.

OR

-------------------------------------------------------------------
3) Don't wait before binding a kthread to cpu0 in presmp initcalls: 
-------------------------------------------------------------------

Since we are running presmp initcalls(only cpu0 is up), why do we need to
wait before binding a kthread to cpu0?
Souldn't we skip this wait like it is done in !SMP case (assuming that
presmp just equals !SMP)

#ifdef CONFIG_SMP
void scheduler_ipi(void);
extern unsigned long wait_task_inactive(struct task_struct *, long match_state);
#else
static inline void scheduler_ipi(void) { }
static inline unsigned long wait_task_inactive(struct task_struct *p,
                                               long match_state)
{
        return 1;
}
#endif

Above piece of code does not wait in case of !SMP. I beleive that same
should be done for presmp initcalls. But i haven't found any such
implementations
in code.

draw backs: in my opinion there shouldn't be any. Comments needed.

OR

-----------------------------------------------------------
4) Don't sleep for 1 tick before binding a kthread to cpu0:
-----------------------------------------------------------

1 timer tick is always consumed in idle loop in step 21 while booting
whenever there is a need to bind a kthread to cpu. Why do we need to sleep
kernel init thread for 1 tick ? why don't we just call the schedule() in
wait_task_inactive(), yeild the cpu so that kthread can get scheduled ASAP
and gets dequeued. kernel init thread will be scheduled next ASAP and it
will get out of wait_task_inactive (Does'nt it seem quicker as compared to
sleeping for 1 tick?)

                if (unlikely(on_rq)) {
                        //ktime_t to = ktime_set(0, NSEC_PER_SEC/HZ);
                        //set_current_state(TASK_UNINTERRUPTIBLE);
                        //schedule_hrtimeout(&to, HRTIMER_MODE_REL);
			schedule();
                        continue;
                }

Above changes will cause step 21 to never sleep.

or (if sleeping is necessary)

Modifying the above code to sleep for smaller time (1ms in case of HZ=100)
but for this i guess we will need hrtimer to work at that time. But it was
found that hrtimer does not work at that time for any resolution higher that
10ms(in case of HZ=100). 

draw backs: not known yet. Comments needed.

It would be very nice if we can get some comments on above analysis from
community.

Thanks .
Abbas Raza

