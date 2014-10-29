From: Tim Bird <tim.bird@sonymobile.com>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Wed, 29 Oct 2014 16:49:46 -0700
Message-ID: <54517D1A.4030206@sonymobile.com>
References: <5441F592.6090807@gmail.com> <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com> <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com> <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net> <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr> <5447C7BE.60506@landley.net> <alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net> <alpine.LFD.2.11.1410231334250.6969@knanqh.ubzr> <20141023181336.GC10477@piout.net> <alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E68C@seldmbx02.corpusers.net> <alpine.LFD.2.11.1410231616570.6969@knanqh.ubzr> <54498344.8080507@landley.net> <alpine.LFD.2.11.141023184740
 0.6969@knanqh.ubzr> <544AAA9F.8060808@landley.net> <CAMuHMdVhfNAVdB3iHcyfXfjk1ES-bX9Xm5ySKND7qsHTFNL72Q@mail.gmail.com> <alpine.LFD.2.11.1410271546010.18007@knanqh.ubzr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.11.1410271546010.18007@knanqh.ubzr>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolas Pitre <nico@fluxnic.net>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Landley <rob@landley.net>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>, Grant Likely <grant.likely@secretlab.ca>



On 10/27/2014 01:29 PM, Nicolas Pitre wrote:
> On Fri, 24 Oct 2014, Geert Uytterhoeven wrote:
> 
>> Several patches are linked from
>> http://elinux.org/Deferred_Initcalls
>>
>> Latest version is
>> http://elinux.org/images/5/51/0001-Port-deferred-initcalls-to-3.10.patch
> 
> In the hope of providing some constructive and concrete feedback to this 
> thread, here's what I have to say about the patch linked above ( I 
> looked only at the latest version):
> 
> - Commented out code is not acceptable for mainline. But everyone knows 
>   that already.
> 
> - Returning a null byte through the /proc file is dubious.
> 
> - The /proc interface is probably not the best. I'd go with an entry in 
>   /sys/kernel instead.
> 
> - If the deferred_initcall section is empty, this could return 1 upfront 
>   and do the free_initmem() earlier as it used to.
> 
> - It was mentioned somewhere that the config system could use a 4th 
>   state in addition to n, m and y.  That would be required before this 
>   goes upstream simply to express all the dependencies between modules.  
>   Right now if a core module is configured with m, then all the 
>   submodules that depend on it inherit the modular-only restriction.  
>   The same would need to be enforced for deferred initcalls.
> 
> - Currently all deferred initcalls are lumped together in a single 
>   section with no regards to the original initcall level. This is likely 
>   to cause trouble if two initcalls are called in a different order than 
>   intended. Nothing prevents that from happening right now.
> 
> This patch is still not generic enough for mainline inclusion IMHO.  It 
> currently falls in the "you better know what you're doing" category and 
> that is possibly good enough for its actual users.  Trying to make this 
> more generic is going to require some more work.  And this would have to 
> come with serious arguments explaining why simply using modules in the 
> first place is not acceptable.

Sorry to take so long to reply.  This feedback is very welcome,
and I appreciate the time taken to review the patch.  I
apologize in advance for the rather long response...

I have been thinking about the points you made previously,
and have given the problem space some more thought.  I agree
that as it stands this is a very niche solution, and it would
be good to think about the broader picture and how things
might be designed differently to make the "feature" usable
more easily and to a broader group.

Taking a step back, the overall goal is to allow user space
to do stuff while the kernel is still initializing statically
linked drivers, so the device's primary function can be ready
as soon as possible (and not wait for secondarily-needed
functionality to initialize). For things that are able to be
made into a module (and for situations where the kernel module
loading is turned on), this feature should not be needed in
its current form.  In that case, user space already has control
over module load ordering and timing.

The way the feature is expressed in the current code is that a
set of drivers are marked for deferred initialization (I'll refer
to this as issue 0).  Then, at boot: 1) most drivers are initialized
normally, 2) user space is started, and then 3) user space indicates
to the kernel that the deferred drivers should be initialized.

This is very coarse, allowing only two categories of drivers: (ignoring
other boot phases for the moment) - regular drivers and deferred drivers.
It also requires source code changes to mark the drivers to be deferred.
Finally, it requires an explicit notification from user-space to complete
the process.  All of these attributes are undesirable.

There may also be an opportunity here to work out more granular driver
load ordering, which would benefit other systems (especially those that
are hitting the EPROBE_DEFER issue).

As it stands now, the ordering of the initcalls within a particular level
is pretty much arbitrary (determined by link order, usually without oversight
by the developer).  Just FYI, here are some numbers culled from a recent
kernel:

initcall macro		number of instances in kernel source
--------------		------------------------------------
early_init		446
core_init		614
postcore_init		150
arch_init		751
subsys_init		573
fs_init			1372
device_init		1211
late_init		440


I'm going to rattle off a few ideas - I'm not sure which ones might
stick,  I just want to bounce these around and see what people think.
Note that I didn't think of most of these, but I'm just repeating ones
that have been stated, and adding a few thoughts of my own.

First, if the ordering of initialization is not the default
provided by the kernel, it needs to be recorded somewhere.  A developer
needs to express it (or a tool needs to figure it out), but if it is
going to be reflected in the final kernel behaviour (or image), the
kernel needs it at boot time (if not compile time).  The current
initcall system hardcodes a "level" for each driver initialization
routine in the source code itself, by putting it in the macro
name for each init routine.  There can
only be one such order expressed in the code itself.

For developers who wish to express another order (or priority), a
new mechanism will need to be used.  If possible, I strongly prefer
putting this into the KCONFIG system, as that is where other details
about kernel configuration are stored, and there are pre-existing tools
for dealing with the format.  I am hesitant to create a special language
or config format for this (unless it is much simpler than adding something
to Kconfig).  As Nicolas pointed out, Kconfig already has information
about dependencies in terms of not allowing a driver to be a module
if a dependent module is statically linked. Having the tool warn for
violations of that ordering would be valuable.

Possibly, we could use a fourth driver state ('D' for deferred), but
this still only allows very coarse ordering granularity.
How about if we added a numeric value for each driver, and had the macro
somehow use that number in ordering or deferring the driver initialization?
Say we supported order groups 0-9, with order 8 and 9 being deferred?

So we could add something like:
CONFIG_USB_EHCI_HCD_INITORDER=9

Here are some questions...
Do all driver initialization routines have a corresponding config
variable? Also, do we really want to manually add all these CONFIG
items?  Is there a way to allow expressing a config item like this,
automatically, without having to create each one in a Kconfig file?
Is the set of routines that we might want to defer small enough that
we could get by with just defining only a specific set of these
(rather than for all possible drivers and initcalls)?  
Can we get by with just listing exceptions to default ordering, or
is something more comprehensive required?

Another possibility is a binary post-processor, which reorders
the initcall tables in the kernel, after the compile has finished.
So, rather than relying on the compiler, there would be a separate
tool to modify the kernel binary to have the desired init ordering.
The initcall macro could be extended to provide input to this tool,
and the tool could read a separate configuration file indicating
the routines that should be reordered in the boot sequence.

Another idea would be to make the starting of user-space it's own
initialization routine, which was not necessarily started as the last thing
after all other statically linked driver initializations.  Then, it
could begin operation before other drivers were initialized. It's init
order could be controlled using the same mechanism as other initcalls.

Right now, user space starts as if it were a late_initcall, with an
INITORDER=9, but if this were configurable, that might solve a lot
of the problem.  A developer could push the order of user-space start
earlier into the initialization sequence, if they needed to.

If stricter ordering was required, such as making sure user-space
got cycles before other drivers, then the threads managing such
initializations would need to be prioritized.  Maybe user space
could elevate it's scheduling priority, or a configuration item
could indicate a high starting scheduling priority, so that user
space would be guaranteed to run before other (lower-priority)
init routines. This would allow lower-priority initializations
to proceed in piecemeal fashion (using up cycles whenever the
high-priority user-space was not busy).  The "trigger"
for allowing low-priority initializations to proceed could then be
something like the user-space thread lowering its scheduling priority
back to "normal".  This would use already-existing syscalls, and
would not require a /sys or /proc trigger mechanism.

I'm not sure if the problem drivers (USB and networking) are
interruptible during their init routines (especially on UP machines).
This would need to be tested, to see if they can start in the
background and not cause a big delay to the higher priority task.

Grant Likely suggested deferring the ordering decision in a
way that allowed it to be expressed at runtime rather than at
compile-time. That, I think, would require a more substantial
rework of the initcall system, probably requiring to make it
text-driven.  It does have the possibility of solving some
other driver init ordering problems that are now being
addressed with EPROBE_DEFER.  My guess is that making the initcall
system text-driven would increase the size of it to a degree
that it would make more sense just to turn on the loadable
module system.  But I'm open to ideas how this might be done
efficiently.  I don't see how this could be done in a binary
fashion, as I'm pretty sure Grant would intend for this
ordering information to live outside a particular binary
instance of the kernel (similar to device tree).

I think a lot of this is what Nicolas was getting at last week,
and I didn't understand the ideas he was putting forth. Since
this is a niche case, it may not be worth rewriting the
initcall system to handle it.  But I'm interested in whether
people think this is worth working on or not.  This patch *has*
been useful (and used), so there's clearly an unfulfilled need.
And maybe this discussion can result in a solution that is more
general and amenable to mainlining.

Thanks for listening.
 -- Tim
