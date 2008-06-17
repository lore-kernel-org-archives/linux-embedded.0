From: Tim Bird <tim.bird@am.sony.com>
Subject: Recommendation for activating a deferred module init in the kernel
Date: Tue, 17 Jun 2008 11:23:18 -0700
Message-ID: <48580116.9070504@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded <linux-embedded@vger.kernel.org>

Hi all,

I am working with a product team on bootup time issues.  One technique
that we are forward-porting from an old kernel (and that I thought I
might work on mainlining) is to compile modules statically into the kernel,
but defer their initialization until after boot time.

Normally, module init routines are declared with module_init(), which,
when they are statically linked into the kernel, uses the macro
__define_initcall() to add an entry to a special init segment.
This is called during bootup by do_initcall() (in init/main.c),
and the memory where the function resides is eventually freed.

There are several phases of initcalls (see include/linux/init.h),
including core, postcore, arch, subsys, fs, rootfs, device, and late.

In our modification, we:
 1) add another phase for deferred initcalls
 2) modify the module_init macro definition to use that phase, for the
 modules we wish to defer initialization of
 3) modify the free code to not free the memory until later
 4) add an ioctl to trigger the deferred initialization (and memory free)

One of the main sub-systems that we defer initialization of this
way is USB, and this saves quite a bit of time.  (Of course the
same, or slightly more CPU cycles are eventually used during
bootup time.  But this lets us get to user space quicker so we
can start user-visible applications faster.)

I'm not that happy using an ioctl for this trigger.  What is
the preferred method of activating a kernel feature like this?
I presume something in /proc or /sys, but I'm not sure.

Also, is there something like this in the kernel now that I'm
missing?

Any advice or comments would be welcome.

Thanks,
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

