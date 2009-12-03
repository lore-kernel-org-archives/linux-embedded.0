From: ladislav klenovic <lklenovic@gmail.com>
Subject: Badness at net/sched/sch_generic.c:219
Date: Thu, 3 Dec 2009 13:36:52 +0100
Message-ID: <e46ca7a80912030436u21455741of01a18d92b5721dc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=2C83GuVVzF7FIVbU8D0pZYD7Vcu4YiX2fYSVa+VoMxI=;
        b=LRwGWSEj4rF/+7rxg5DDkF/Ta8Dc1pnGKcbiMDNuFdB+Zimk/xeAP4H9sHRJOvnBaJ
         lUj+k5IyiwVxRhr5csBZSuSCX4yrdByUFcKA/Y+C0NH7kAgh3WsH4cDh3kWuNiqhwtQP
         2a9gKC9/WGxc9zxKz+2j5c1jpPh99pdUOkeuk=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hi,
I am running on mpc8272 with 2.6.27.25 kernel and use freescale
ethernet driver.I got the following oops below after 2 days uptime.
It happened only once and doesn't seem to be reproducible. Any idea
what could happen there:

Badness at net/sched/sch_generic.c:219
NIP: c0199014 LR: c0025c68 CTR: 00000001
REGS: c02c3d90 TRAP: 0700   Tainted: P           (2.6.27.25-eboard-r17)
MSR: 00029032 <EE,ME,IR,DR>  CR: 88002082  XER: 00000000
TASK = c02a8578[0] 'swapper' THREAD: c02c2000
GPR00: 00000000 c02c3e40 c02a8578 cf89e800 c02caef0 012e18ea 00000000 ffffffff
GPR08: c02bd028 c02d0000 fffd2b0e 000d2f00 c3f2e7df 10090e0c 0fffb000 ffffffff
GPR16: 00000000 007fff00 00000000 00000000 00000000 0fff82e4 00000000 007ffeb0
GPR24: 00000000 00000000 c02cb060 c02d0000 c02c2000 c0198ee4 00000100 cf89e800
NIP [c0199014] dev_watchdog+0x130/0x204
LR [c0025c68] run_timer_softirq+0x12c/0x1b4
Call Trace:
[c02c3e40] [3fd54c78] 0x3fd54c78 (unreliable)
[c02c3e50] [c0025c68] run_timer_softirq+0x12c/0x1b4
[c02c3e80] [c0021494] __do_softirq+0x64/0xd4
[c02c3ea0] [c00060fc] do_softirq+0x40/0x58
[c02c3eb0] [c002132c] irq_exit+0x38/0x48
[c02c3ec0] [c000cb64] timer_interrupt+0x138/0x150
[c02c3ee0] [c000f708] ret_from_except+0x0/0x14
--- Exception: 901 at cpu_idle+0x94/0xd8
LR = cpu_idle+0x94/0xd8
[c02c3fa0] [c0009140] cpu_idle+0xd4/0xd8 (unreliable)
[c02c3fb0] [c0206c00] __got2_end+0x58/0x68
[c02c3fc0] [c028181c] start_kernel+0x2b0/0x2c4
[c02c3ff0] [00003438] 0x3438
Instruction dump:
48000050 801f0198 3d20c02b 817f019c 8129abd4 7c005a14 7d490051 40a00034
3d20c02d 80099930 2f800000 40be0014 <0fe00000> 38000001 3d20c02d 90099930

--
Ladislav
