From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: kernel command line from u-boot
Date: Thu, 7 Aug 2008 10:29:57 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0808071023030.19078@localhost.localdomain>
References: <8c675e9b0808062141s74f1a7bfob5cab6b23b0268d3@mail.gmail.com> <Pine.LNX.4.64.0808071050280.9798@vixen.sonytel.be> <8c675e9b0808070427v42a4055bwae3adfb160a4e1ab@mail.gmail.com> <Pine.LNX.4.64.0808071618120.9798@vixen.sonytel.be>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0808071618120.9798@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Amol Lad <amol.lad@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, 7 Aug 2008, Geert Uytterhoeven wrote:

> On Thu, 7 Aug 2008, Amol Lad wrote:
> > > Probably nobody noticed as this part of the code takes care of the
> > > `obsolete-style' parameters. `module_param' is the new way.
> >
> > Ohh, btw how module_param is different from obsolete style paramaters
> > ? Do we need to pass arguments to kernel from bootloader using a
> > different method for getting them processed using module_param ?
>
> Documentation/kernel-parameters.txt:
>
> Module parameters for loadable modules are specified only as the
> parameter name with optional '=' and value as appropriate, such as:
>
>         modprobe usbcore blinkenlights=1
>
> Module parameters for modules that are built into the kernel image
> are specified on the kernel command line with the module name plus
> '.' plus parameter name, with '=' and value if appropriate, such as:
>
>         usbcore.blinkenlights=1

  um ... all of the above handles those command-line parms that are
defined in *module* source files, but that doesn't solve the problem
of defining those parms that are always built into the kernel and are
currently defined by one of __setup_param() or __early_param().

  from include/linux/init.h:

=====
struct obs_kernel_param {
        const char *str;
        int (*setup_func)(char *);
        int early;
};

/*
 * Only for really core code.  See moduleparam.h for the normal way.
 *
 * Force the alignment so the compiler doesn't space elements of the
 * obs_kernel_param "array" too far apart in .init.setup.
 */
=====

  is the module-based approach really supposed to eventually replace
the above?  how?

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
