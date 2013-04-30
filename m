From: Stanislav Meduna <stano@meduna.org>
Subject: Re: Need help to measure and tune the latency in Linux RT
Date: Tue, 30 Apr 2013 14:13:07 +0200
Message-ID: <517FB553.3000001@meduna.org>
References: <CALJd4cbfqRFiGHshv8A+0A8kFo_qW=rvREsdgj3jQ=-0Rix0-g@mail.gmail.com> <20130430111021.GC31290@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-rt-users-owner@vger.kernel.org>
In-Reply-To: <20130430111021.GC31290@titan.lakedaemon.net>
Sender: linux-rt-users-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: Ashoka K <ashok.vinu@gmail.com>, linux-embedded@vger.kernel.org, linux-newbie@vger.kernel.org, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, linux-rt-users@vger.kernel.org

>> This critical thread is at RR priority 50.

Try to put it higher than the irq thread handling your HD hardware.
I've even encountered hardware where I had to put the ATA thread
in the SHED_OTHER domain - see [1] for the thread.

>> I used a HR timer thread with RR pri 55 to wakeup the critical thread
>> every 1 milli sec to do the job.

Which prio is the ksoftirqd running at? The HRTIMER interrupts are
routed through it so it also has to be high enough.

I got burned with this myself [2]

Regards
                                     Stano

[1] http://www.spinics.net/lists/linux-rt-users/msg08711.html
[2] http://www.spinics.net/lists/linux-rt-users/msg08745.html

