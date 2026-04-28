Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E2E3F1674
	for <linux-embedded@vger.kernel.org>; Tue, 28 Apr 2026 11:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375046; cv=pass; b=GPp4o1+q8zSDiQbKgQIFz/lojqWDSiwhzXA9u79zptqnVtd28JVsCmxeSSbkSN0r6CJW+zX8ExtXKKNJeTIDIjWd/ewqG/3sj1thV376ud4bHu4Zl1ECApnnxy97QyUI++v86GoMo7ojVki7qF+i+TVS7lBcKG2G//uwhBqoLYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375046; c=relaxed/simple;
	bh=yHZ7nDDgRumQp59ozeM8cTCHWOcX1fPI09HtwqhBVtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPllH2FfVXjUY9UvM7kai/gBPRjGyZb7h9eRCL0+LjAgng5oN5wrdhohrhsI6ImtR4S3fKGd6/olDb43wyF8PMwIOY17e47seoKhpBtgRc+k0xPQVtMioJHx7z80UB7MH9FUGQXuMXM21L9i4j47XUYRIRaQorl49K3y7dkndPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=h2C1X0Yo; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="h2C1X0Yo"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-42c0b0ffac1so4356034fac.2
        for <linux-embedded@vger.kernel.org>; Tue, 28 Apr 2026 04:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777375043; cv=none;
        d=google.com; s=arc-20240605;
        b=LVMMz6WVFJr7aymdzJD8dnwXBYpfMBdWrM5DrVEyx3B8lY+KCFWkPZGJrgbLJwz/re
         su7q8ezd9meiSMd125lt//a3/b8gw6J/swBqoavLqTijmJzRAp4uKIVipW4RgJTDAdRF
         412SKK5/iLNM0qCrfHLXqu/ghsnrxgsN0cqS+GlV9Gz2pcRZjmZHcXHkXxM/9EM4HGMk
         vjuhidkwAn1gD9Lv3XXpxx9p2vie6cxrK+RGpeKWVnblq5435d5I7oGa6FR5Hb8STy8w
         0S2gWElXIT/e8k4YTjX9P0qv5tM73NBQ8pUiGzROhyu0mMeCJvVFpnKuF/0w87IiZLqJ
         g8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1yL7MQ5o+5a8ehVsqH3AIVBOcB29UNl9oA+yypG6LE=;
        fh=nPL19VihrTnl2/Mrw4iwbOOrpNgLiTW0A39sPzFg91o=;
        b=j2dVSK5U+1UJqdB/y0jzQl8NncLISiGlEbPT2zW+cIo40hO7JXhO1oL9iZnrzZWUaQ
         YgU/Sgsf0PWgaARC5Bl7eTxWv/j1G1zasdkUHo4D98BInqvN3aJYpW1NDF0NkYrPPVxU
         bSQtWC49UEjza6WNHimQ2mAB88GVDk+6F+fzFd71piLFP1iqHyGAcuR2574vKYQyVF80
         lNXmczXWVO1uiofIdd6rq/z9nv+ZNdUhEQal9Pw0L9d7m0Ug3p7tZvYII0Na8kcBv2vl
         Jsu2MD23/GSKoWHCBmLEpnRrkLGOXjW4bvlFGZZsE14HRw6K5vqWBDZ27ZBWvitUShZI
         gyhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1777375043; x=1777979843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1yL7MQ5o+5a8ehVsqH3AIVBOcB29UNl9oA+yypG6LE=;
        b=h2C1X0Yo7VrQkWPKGUjEnBiAoE2XjBBmRd3vJIkalt9TWJhp7qQ94Qh6Pesq1vMRGe
         XuzQF59cvCbBMKw4En3cunCqmcoNo6foSw7O8H3Fvz17X62TVz6RudxB8i8XKjUdTWa9
         lC8XyHzGsoU9cC6y7ATZiC/icT9qZ39Ow3up3K4TL5ccnF+KgaBFh0T7YCj/V9cdamzU
         IZkJOtD2B0t/GwdRA4wUO0EWkeyBSiKoTcxXdU5j6HfL0UiQWAb20atV9N0lTRFsrQTQ
         N1C5elLoiNU6RLP7dJgjSJNt1lZYqpiibBQ5xKNUGw2fovqVT9zq6jBXZedpKYqBjZPr
         J5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375043; x=1777979843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g1yL7MQ5o+5a8ehVsqH3AIVBOcB29UNl9oA+yypG6LE=;
        b=d1ptn4pJRltpC2DueefzAh58D9xGMdhivqY++RVor6+h3nWcgT9fx+/QlCzQV+rVPG
         dWwNEoSx+UEGJdD4OiBWCx6vPRaKC3f+fwBr8JSzbD5/9GEXWngPHYjVO6afqfhXKB/U
         2b+9dc4FW8um1piNXdgRMY+EHmRJZj3eaTl4uRF2wltnUPyjYHJ+kvGizC+I9OOLo14i
         5as0uWzR/ncs6iQJN0PeDxIb+2ltPTam6VDpnTe6+ZF7J8KC3+Ucm+uVCVTOXIawHNim
         tof+bdXDWFZJ84RKHmQ6Lcy1xp1H9tHQn5f9vH5jQBowmmUxTQoiLlKatuyg2fFbMG3s
         F40w==
X-Forwarded-Encrypted: i=1; AFNElJ/yEcF1xUh3tMrz6SLKEs5LSPO8Y3uvu+JVPg0DphHUstImrr8i9jliVjd23yFs0yjgHunrrwjuCL6e/zoAcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Ii0ZWXTQzk3V8mn0F8fXAzPal8B/Ak7M0O0PD2AsDEReOppZ
	8OBRr5cFnqj5uj0luNFUozzJrNo2TihcnWfppPfbgpm2oQbQB5rOvBEUBTN4khY659WwOXC0xX+
	uc/Y/j/mRD2iZ32v9qAknbJkqf4u0JYwP20JMIMhL7g==
X-Gm-Gg: AeBDiesyEvyKgdZo/jxL8TnbMdHqCuM0buZkalT9F7TKLjKF3TOjkDxKdhflPpSuQ0V
	L9SyBf6ECmzV8WlsPxPS5Bk0HrAgArhkIcZ8+mMpxUqI3YTuZk2qVJlgpp/RoWlkTWML0Ko/H2v
	LZ22IaAHpSeP9hTgf7zcMV/lKjgMtTGorsp6V7Mb2dnf+mTmZ/+/j07qz8sv4V5vdghiEyA5+8G
	PvEaEJPwm/1GzjQoOJ/FfAKGScDnA+bt0PYCVZGsGjuJxqRnFaZ04O2ciMTpSg9A2cb8dCT/Jru
	pXJw+QZANaIUwF0dPBURoPFvZ2nmTF0nNi0eD3SqnrJ3uhoKM5E6KR4obktqjxNw1AKE4oPtXjk
	Y5BB3r9ZloEZOUTE1/WNXes5vnHOIo6P4Y0cL3c3TMuPmlEToPg==
X-Received: by 2002:a05:6820:198e:b0:696:2cb1:9ffb with SMTP id
 006d021491bc7-6965cbdda64mr1287295eaf.55.1777375042740; Tue, 28 Apr 2026
 04:17:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <CALqELGz3qJ=KtDmBHMRP4NMSmmeZGKxk6SpTCQGcvGru5Dn0SA@mail.gmail.com> <MW5PR13MB56327ABDE42B1CB0D02B8D5BFD372@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB56327ABDE42B1CB0D02B8D5BFD372@MW5PR13MB5632.namprd13.prod.outlook.com>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 28 Apr 2026 12:17:10 +0100
X-Gm-Features: AVHnY4JlgIrS1aCydo8B4ZIY4euCG8iTruB65AsvPH5juDwwCJG0sLb78ioz-ps
Message-ID: <CALqELGx+8=honboz+_dRP8tX2ngnquQhizxNg5J+yVwa_YgUhQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"geert@linux-m68k.org" <geert@linux-m68k.org>, "tglx@kernel.org" <tglx@kernel.org>, 
	"shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim,

On Tue, 28 Apr 2026 at 06:30, Bird, Tim <Tim.Bird@sony.com> wrote:
>
> > -----Original Message-----
> > From: Andrew Murray <amurray@thegoodpenguin.co.uk>
> > Hi Tim,
> >
> > On Fri, 10 Apr 2026 at 21:41, Tim Bird <tim.bird@sony.com> wrote:
> > >
> > > During early boot, printk timestamps are reported as zero before
> > > kernel timekeeping starts (i.e. before time_init()).  This
> > > hinders boot-time optimization efforts.  This period ranges from
> > > 17 to 1700 milliseconds on different embedded machines running Linux.
> > >
> > > Add support for early timestamps based on processor cycle-generators
> > > that need no kernel initialization. Use a statically-configured
> > > frequency value for converting cycles to nanoseconds. This means
> > > that this feature cannot be turned on in generic distro kernels.
> > > It is intended for temporary use during kernel development and
> > > boot-time research and optimization only.
> > >
> > > This yields non-zero timestamps for printks from the very start
> > > of kernel execution.  The timestamps are relative to the start of
> > > an architecture-specific counter (e.g. tsc on x86_64 and cntvct_el0
> > > on arm64).  Affected timestamps reflect time from cycle counter
> > > init (usually machine power-on or virtual machine start) instead of
> > > time from the kernel's timekeeping initialization. This results in a
> > > discontinuity in the printk timestamp values, one time, when
> > > kernel timekeeping starts.
> > >
> > > Signed-off-by: Tim Bird <tim.bird@sony.com>
> > > ---
> >
> > The limitation of this series is that while it narrows the window
> > where delays may be hiding, it doesn't remove the window completely.
> > For example, there may be a delay prior to the first printk (perhaps
> > unlikely). It would instead be useful to understand how much time has
> > passed since execution was handed over to the kernel.
>
> Hey Andrew,
>
> My patch allows one to add a printk as the very first line in start_kerne=
l(), which
> I believe is the earliest you can do so in C code in the kernel proper.
>
> You are correct that this patch doesn=E2=80=99t measure time before
> that first line of C code accessible to instrument with printks.  So ther=
e's
> more blind spots in the total system boot than this patch addresses.
>
> >
> > Also, in my view, the goal of this work is really to identify
> > regressions in boot time, though this can be achieved via other means.
> > Replacing zero timestamps in printk messages with real timestamps is
> > only necessary to make it easier to bisect where those delays are
> > hiding, i.e. between two printk messages. But that benefit it limited
> > given how small the window is. (And if a regression is spotted,
> > someone would likely add debug to find it anyway).
>
> In my experience, although the kernel's blind spot is relatively small on=
 x86, it
> is quite a bit larger on other platforms: 183 milliseconds on a raspberry=
 pi
> and 1700 milliseconds on a FPGA-based riscv board.  When I've used the
> patch in its current form, along with sprinkling printks and measurements
> in other place in init/main.c and other relevant early functions in the k=
ernel,
> it has yielded valuable data about the timings in this blind spot, that I=
 can
> easily read using the console and dmesg.

I've tested this on my PocketBeagle2...

Before (abbreviated):

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
...
[    0.000000] GICv3: CPU0: using allocated LPI pending table
@0x0000000080660000
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.000000] arch_timer: cp15 timer running at 200.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0x3ffffffffffffff
max_cycles: 0x2e2049d3e8, max_idle_ns: 440795210634 ns
[    0.000001] sched_clock: 58 bits at 200MHz, resolution 5ns, wraps
every 4398046511102ns
[    0.009241] Console: colour dummy device 80x25
[    0.013890] Lock dependency validator: Copyright (c) 2006 Red Hat,
Inc., Ingo Molnar
[    0.021836] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.026049] ... MAX_LOCK_DEPTH:          48


After (abbreviated):

[    2.658895] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
...
[    3.619549] GICv3: CPU0: using allocated LPI pending table
@0x0000000080660000
[    3.627177] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    3.635146] arch_timer: cp15 timer running at 200.00MHz (phys).
[    3.641227] clocksource: arch_sys_counter: mask: 0x3ffffffffffffff
max_cycles: 0x2e2049d3e8, max_idle_ns: 440795210634 ns
[    0.000001] sched_clock: 58 bits at 200MHz, resolution 5ns, wraps
every 4398046511102ns
[    0.009249] Console: colour dummy device 80x25
[    0.013897] Lock dependency validator: Copyright (c) 2006 Red Hat,
Inc., Ingo Molnar
[    0.021843] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.026055] ... MAX_LOCK_DEPTH:          48

That shows nearly a second of boot time prior to timestamps. In this
case it's due to a slow console as it's using earlycon
("earlycon=3Dns16550a,mmio32,0x02860000"), without that I get:

[   36.979738] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
...
[   37.399295] GICv3: CPU0: using allocated LPI pending table
@0x0000000080660000
[   37.399531] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[   37.400446] arch_timer: cp15 timer running at 200.00MHz (phys).
[   37.400463] clocksource: arch_sys_counter: mask: 0x3ffffffffffffff
max_cycles: 0x2e2049d3e8, max_idle_ns: 440795210634 ns
[    0.000001] sched_clock: 58 bits at 200MHz, resolution 5ns, wraps
every 4398046511102ns
[    0.000962] Console: colour dummy device 80x25
[    0.001032] Lock dependency validator: Copyright (c) 2006 Red Hat,
Inc., Ingo Molnar
[    0.001037] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.001041] ... MAX_LOCK_DEPTH:          48

Showing approximately 0.42 seconds, for the curious that comes from
the following, but I've not investigated:

[   37.073687] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[   37.335840] ftrace: allocating 66138 entries in 260 pages

In its current form this is useful to me, though it would be helpful
if it were clearer when the timestamps switch.

Feel free to add:

Tested-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

Though I'll test again in later revisions of this series.

>
> >
> > Given the risks identified by others with this series and the above, I
> > thought I'd suggest an alternative approach.
> >
> > Perhaps we can rely on a prior boot stage (e.g. U-Boot) to capture a
> > timestamp (perhaps cntvct on arm) immediately prior to kernel
> > handover, this could be stored in the device tree and it could include
> > architecture information on where that timestamp came from. During
> > boot, once timekeeping is initialised, the architecture specific
> > timekeeping initialisation code can print relevant timestamp values to
> > the console, alongside the data captured in the device tree.
> >
> > Userspace tools (systemd-analyze) or log parsing tools, can then make
> > sense of the values. The time between kernel handover and the end of
> > timekeeping initalisation printk can be calculated. You could also
> > subtract the earliest non-zero printk timestamp from this figure to
> > measure the time between kernel handover and first non-zero timestamp.
> >
> > Besides logging values from hardware registers to the console, this
> > approach pushes out all the maths to userspace or log parsing tools.
> > It also doesn't impact existing printk timestamps and can be
> > structured to not introduce new get_cycles types of functions.
>
> It is certainly of value to get a measure of the time between
> the bootloader and the kernel start (ie, the kernel self-decompressor).
> But that's a different problem than the one I originally intended
> to solve with this patch, which was the zero-valued printks in the kernel=
,
> before kernel timekeeping start.

Yes, I appreciate that, and of course it's not either problem, both
can be solved :)


>
> Because my code is using the same cycle counter as U-boot, it will operat=
e
> with the same time-base, making it easier to correlate the times that U-b=
oot
> records with the times reported in the early printks, using an external t=
ool.
> One could certainly output cycles in a few places and set up a correspond=
ence
> using external tooling.
> That's what this patch was striving for:
>  https://lore.kernel.org/all/20250823044034.189939-1-v-singh1@ti.com/
>
> That was posted as part of the effort described in [1].

Thanks, I was trying to find more information on this.

Andrew Murray

>
> That would be a valuable thing to do, and possibly there is some coordina=
tion
> we could do to harmonize these efforts or have them use each other's faci=
lities.
> But again, that's solving a different problem than the one my patch solve=
s.
>
> >
> > If this type of approach is taken, it may be worth investigating other
> > initiatives in this area, for example [1], [2], [3] which may be
> > relevant.
> >
> > [1] https://static.sched.com/hosted_files/osseu2025/a2/EOSS_2025_Unifie=
d%20Boot%20Time%20log%20based%20measurement.pdf
> > [2] https://issues.chromium.org/issues/40986147
> > [3] https://github.com/FirmwareHandoff/firmware_handoff
>
> I worry that if I change the problem I'm trying to solve, or the scope
> of the required external tools, it will be harder to get a patch accepted
> to solve the thing I'm interested in.
>  -- Tim
>
>
> > Thanks,
> >
> > Andrew Murray
> >
> > > V3 -> V4
> > >   Replace config vars with single one: CONFIG_EARLY_CYCLES_KHZ
> > >   Replace runtime calibration with static config variable
> > >   Remove reference to get_cycles()
> > >   Add support for RISCV platforms
> > > V2 -> V3
> > >   Default CONFIG option to 'n'
> > >   Move more code into early_times.h (reduce ifdefs in init/main.c)
> > >   Use match64 helper routines
> > >   Use cycles_t instead of u64 type
> > >   Add #defines for EARLY_CYCLES_BIT and EARLY_CYCLES_MASK
> > >   Invert if logic in adjust_early_ts()
> > > V1 -> V2
> > >   Remove calibration CONFIG vars
> > >   Add 'depends on' to restrict arches (to handle ppc bug)
> > >   Add early_ts_offset to avoid discontinuity
> > >   Save cycles in ts_nsec, and convert on output
> > >   Move conditional code to include file (early_times.h>
> > > ---
> > >  include/linux/early_times.h | 55 +++++++++++++++++++++++++++++++++++=
++
> > >  init/Kconfig                | 30 ++++++++++++++++++++
> > >  kernel/printk/printk.c      |  3 ++
> > >  3 files changed, 88 insertions(+)
> > >  create mode 100644 include/linux/early_times.h
> > >
> > > diff --git a/include/linux/early_times.h b/include/linux/early_times.=
h
> > > new file mode 100644
> > > index 000000000000..82bacfd0e26b
> > > --- /dev/null
> > > +++ b/include/linux/early_times.h
> > > @@ -0,0 +1,55 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +
> > > +#ifndef _EARLY_TIMES_H
> > > +#define _EARLY_TIMES_H
> > > +
> > > +#include <linux/timekeeping.h>
> > > +#ifdef CONFIG_ARM64
> > > +#include <asm/sysreg.h>
> > > +#endif
> > > +
> > > +#ifdef CONFIG_EARLY_CYCLES_KHZ
> > > +static inline u64 early_unsafe_cycles(void)
> > > +{
> > > +#if defined(CONFIG_X86_64)
> > > +       /*
> > > +        * This rdtsc may happen before secure TSC is initialized, an=
d
> > > +        * it is unordered. So please don't use this value for crypto=
graphy
> > > +        * or after SMP is initialized.
> > > +        */
> > > +       return rdtsc();
> > > +#elif defined(CONFIG_ARM64)
> > > +       return read_sysreg(cntvct_el0);
> > > +#elif defined(CONFIG_RISCV_TIMER)
> > > +       u64 val;
> > > +
> > > +       asm volatile("rdtime %0" : "=3Dr"(val));
> > > +       return val;
> > > +#else
> > > +       return 0;
> > > +#endif
> > > +}
> > > +
> > > +#define NS_PER_KHZ     1000000UL
> > > +
> > > +/* returns a nanosecond value based on early cycles */
> > > +static inline u64 early_times_ns(void)
> > > +{
> > > +       if (CONFIG_EARLY_CYCLES_KHZ)
> > > +               /*
> > > +                * Note: the multiply must precede the division to av=
oid
> > > +                * truncation and loss of resolution
> > > +                * Don't use fancier MULT/SHIFT math here.  Since thi=
s is
> > > +                * static, the compiler can optimize the math operati=
ons.
> > > +                */
> > > +               return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_=
EARLY_CYCLES_KHZ;
> > > +       return 0;
> > > +}
> > > +#else
> > > +static inline u64 early_times_ns(void)
> > > +{
> > > +       return 0;
> > > +}
> > > +#endif
> > > +
> > > +#endif /* _EARLY_TIMES_H */
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index 7484cd703bc1..40c3123c2c27 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -792,6 +792,36 @@ config IKHEADERS
> > >           or similar programs.  If you build the headers as a module,=
 a module called
> > >           kheaders.ko is built which can be loaded on-demand to get a=
ccess to headers.
> > >
> > > +config EARLY_CYCLES_KHZ
> > > +       int "Frequency of the early times cycle counter, in KHz"
> > > +       default 0
> > > +       depends on PRINTK
> > > +       depends on ARM64 || X86_64 || RISCV_TIMER
> > > +       help
> > > +         Specifies the frequency value (in KHz) of the cycle counter
> > > +         used for early times information.
> > > +
> > > +         Set this to provide timing information for printks in early=
 boot
> > > +         (before the start of kernel timekeeping), that would otherw=
ise
> > > +         show as 0.
> > > +
> > > +         To calculate the value for your system, boot your system, a=
nd
> > > +         use the value expressed on the tsc or cntvct_el0 calibratio=
n line
> > > +         in your kernel message log:
> > > +         ex x86_64: tsc: Refined TSC clocksource calibration: 2095.0=
57 MHz
> > > +          In that case, use the value 2095057.
> > > +         ex arm64: arch_timer: cp15 timer running at 54.00MHz (phys)=
.
> > > +         In that case, use the value of 54000.
> > > +
> > > +         Note that this causes the kernel to show, for some early pr=
intks,
> > > +         times that are relative to processor power on, instead of
> > > +         relative to the start of kernel timekeeping.  When kernel
> > > +         timekeeping starts, the timestamps values reset, causing
> > > +         a discontinuity in the timestamp values.  If you see
> > > +         non-monotonic printk timestamps, please don't freak out.
> > > +
> > > +         Set to 0 to disable this feature.
> > > +
> > >  config LOG_BUF_SHIFT
> > >         int "Kernel log buffer size (16 =3D> 64KB, 17 =3D> 128KB)"
> > >         range 12 25
> > > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > > index 0323149548f6..ddeab81f04ef 100644
> > > --- a/kernel/printk/printk.c
> > > +++ b/kernel/printk/printk.c
> > > @@ -46,6 +46,7 @@
> > >  #include <linux/ctype.h>
> > >  #include <linux/uio.h>
> > >  #include <linux/sched/clock.h>
> > > +#include <linux/early_times.h>
> > >  #include <linux/sched/debug.h>
> > >  #include <linux/sched/task_stack.h>
> > >  #include <linux/panic.h>
> > > @@ -2294,6 +2295,8 @@ int vprintk_store(int facility, int level,
> > >          * timestamp with respect to the caller.
> > >          */
> > >         ts_nsec =3D local_clock();
> > > +       if (unlikely(!ts_nsec))
> > > +               ts_nsec =3D early_times_ns();
> > >
> > >         caller_id =3D printk_caller_id();
> > >
> > > --
> > > 2.43.0
> > >
> > >



--=20
Andrew Murray, Director
https://www.thegoodpenguin.co.uk

The Good Penguin Ltd is a company registered in England and Wales with
company number 12374667 and VAT number 341687879. Registered office:
The Good Penguin Ltd, Merlin House, Priory Drive, Langstone, Newport,
Wales, NP18 2HJ, UK.
