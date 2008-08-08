From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: kernel command line from u-boot
Date: Fri, 8 Aug 2008 11:53:16 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0808081135160.10163@localhost.localdomain>
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
> > Ohh, btw how module_param is different from obsolete style
> > paramaters ? Do we need to pass arguments to kernel from
> > bootloader using a different method for getting them processed
> > using module_param ?
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

  slightly off-topic but, since we're on the subject, i'm still
puzzled by something i read a while back as to how all command-line
parameters are supposed to eventually be implemented using the
moduleparam technique.  i don't see how that's possible.

  as i read it, there are two types of boot-time kernel parms in terms
of how they're implemented:

  1) "core" parms
  2) module-related parms

  the first type are declared using either __setup() or early_param(),
macros that are defined in include/linux/init.h, and are made part of
the kernel image thusly:

=====

/*
 * Only for really core code.  See moduleparam.h for the normal way.
 *
 * Force the alignment so the compiler doesn't space elements of the
 * obs_kernel_param "array" too far apart in .init.setup.
 */
#define __setup_param(str, unique_id, fn, early)                        \
        static char __setup_str_##unique_id[] __initdata __aligned(1) = str; \
        static struct obs_kernel_param __setup_##unique_id      \
                __used __section(.init.setup)                   \
                __attribute__((aligned((sizeof(long)))))        \
                = { __setup_str_##unique_id, fn, early }

=====

  as you can see, the "core" parameters are placed in the .init.setup
section in the ELF-format kernel image.  (and they're processed in
init/main.c, in the obsolete_checksetup() routine.)

  module-related parms are, on the other hand, defined using the
contents of include/linux/moduleparam.h:

=====

/* This is the fundamental function for registering boot/module
   parameters.  perm sets the visibility in sysfs: 000 means it's
   not there, read bits mean it's readable, write bits mean it's
   writable. */
#define __module_param_call(prefix, name, set, get, arg, perm)          \
        /* Default value instead of permissions? */                     \
        static int __param_perm_check_##name __attribute__((unused)) =  \
        BUILD_BUG_ON_ZERO((perm) < 0 || (perm) > 0777 || ((perm) & 2)); \
        static const char __param_str_##name[] = prefix #name;          \
        static struct kernel_param __moduleparam_const __param_##name   \
        __used                                                          \
    __attribute__ ((unused,__section__ ("__param"),aligned(sizeof(void *)))) \
        = { __param_str_##name, perm, set, get, { arg } }

=====

  clearly, these are treated differently as they are placed in the
__param section of the kernel image.  so it seems fairly clear that,
as much as it's convenient to have the module-related boot-time parms,
you'll never be able to get rid of the core technique for
implementation of boot-time parms.  or am i missing something
critical?

  what i do *see* is that there are *way* too many boot-time parms
that are implemented as core parms when they should be transformed to
module parms.  the current doc file for parms,
Documentation/kernel-parameters.txt, is an absolute nightmare as it
mixes core and module parameters together in a confusing way.

  as a totally random example, consider this from
drivers/isdn/hisax/config.c:

  __setup("hisax=", HiSax_setup);

obviously, given the use of __setup(), that's being implemented as a
core parm, but why?  the kernel-parameters.txt file even has to
emphasize that this is a feature dependent parm:

    hisax=          [HW,ISDN]
                    See Documentation/isdn/README.HiSax.

  IMHO, it would far more sense if parms like that are transformed
from core parms to module parms, whereupon each module would be
responsible for documenting its own associated parms, while the
kernel-parameters.txt could be stripped down to referring to *only*
core parms, as opposed to the disorganized chaos that it is now.

  anyway, just my $0.02.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
