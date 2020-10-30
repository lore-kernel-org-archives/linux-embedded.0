From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] init/Kconfig: Increase default log buffer size
 from 128 KB to 512 KB
Date: Fri, 30 Oct 2020 09:01:15 +0100
Message-ID: <CAMuHMdVfxiJ8evasLQ6Hc59jMJdU7R6Eyn7X3rM20O3T4Z6nKg@mail.gmail.com>
References: <20200811092924.6256-1-pmenzel@molgen.mpg.de> <20200811092924.6256-2-pmenzel@molgen.mpg.de>
 <20200811105352.GG6215@alley>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200811105352.GG6215@alley>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Mladek <pmladek@suse.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Ogness <john.ogness@linutronix.de>, Linus Torvalds <torvalds@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Tue, Aug 11, 2020 at 12:55 PM Petr Mladek <pmladek@suse.com> wrote:
> On Tue 2020-08-11 11:29:24, Paul Menzel wrote:
> > Commit f17a32e97e (let LOG_BUF_SHIFT default to 17) from 2008 was the
> > last time, the the default log buffer size bump was increased.
> >
> > Machines have evolved, and on current hardware, enough memory is
> > present, and some devices have over 200 PCI devices, like a two socket
> > Skylake-E server, resulting a lot of lines.
> >
> > Therefore, increase the default from 128 KB to 512 KB. Anyone, with
> > limited memory, can still lower it.
> >
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -681,9 +681,9 @@ config IKHEADERS
> >         kheaders.ko is built which can be loaded on-demand to get access to headers.
> >
> >  config LOG_BUF_SHIFT
> > -     int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
> > +     int "Kernel log buffer size (17 => 128KB, 19 => 512KB)"
> >       range 12 25
> > -     default 17
> > +     default 19
> >       depends on PRINTK
> >       help
> >         Select the minimal kernel log buffer size as a power of 2.
>
> Honestly, I do not have experience with changing the defaults. People
> hacking small devices might complain. Well, this can be solved
> by increasing the default only when BASE_FULL is set.
>
> I am personally fine with increasing the default when BASE_FULL
> is set. The amount of messages is growing over time because of
> increasing complexity of both the hardware and software.
> Fortunately also the amount of available memory is growing.

Note that making this change means that some of the embedded
defconfigs may need to gain a CONFIG_LOG_BUF_SHIFT=17
line...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
