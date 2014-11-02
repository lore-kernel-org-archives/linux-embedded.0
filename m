From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Sat, 01 Nov 2014 23:46:11 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1411012237400.11690@knanqh.ubzr>
References: <5441F592.6090807@gmail.com>
 <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
 <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr> <5447C7BE.60506@landley.net>
 <alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410231334250.6969@knanqh.ubzr>
 <20141023181336.GC10477@piout.net>
 <alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E68C@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410231616570.6969@knanqh.ubzr>
 <54498344.8080507@landley.net>
 <alpine.LFD.2.11.1410231847400.6969@knanqh.ubzr>
 <544AAA9F.8060808@landley.net>
 <CAMuHMdVhfNAVdB3iHcyfXfjk1ES-bX9Xm5ySKND7qsHTFNL72Q@mail.gmail.com>
 <alpine.LFD.2.11.1410271546010.18007@knanqh.ubzr>
 <54517D1A.4030206@sonymobile.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <54517D1A.4030206@sonymobile.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Tim Bird <tim.bird@sonymobile.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Landley <rob@landley.net>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>, Grant Likely <grant.likely@secretlab.ca>

On Wed, 29 Oct 2014, Tim Bird wrote:

> I have been thinking about the points you made previously,
> and have given the problem space some more thought.  I agree
> that as it stands this is a very niche solution, and it would
> be good to think about the broader picture and how things
> might be designed differently to make the "feature" usable
> more easily and to a broader group.
> 
> Taking a step back, the overall goal is to allow user space
> to do stuff while the kernel is still initializing statically
> linked drivers, so the device's primary function can be ready
> as soon as possible (and not wait for secondarily-needed
> functionality to initialize). For things that are able to be
> made into a module (and for situations where the kernel module
> loading is turned on), this feature should not be needed in
> its current form.  In that case, user space already has control
> over module load ordering and timing.
> 
> The way the feature is expressed in the current code is that a
> set of drivers are marked for deferred initialization (I'll refer
> to this as issue 0).  Then, at boot: 1) most drivers are initialized
> normally, 2) user space is started, and then 3) user space indicates
> to the kernel that the deferred drivers should be initialized.
> 
> This is very coarse, allowing only two categories of drivers: (ignoring
> other boot phases for the moment) - regular drivers and deferred drivers.
> It also requires source code changes to mark the drivers to be deferred.
> Finally, it requires an explicit notification from user-space to complete
> the process.  All of these attributes are undesirable.
> 
> There may also be an opportunity here to work out more granular driver
> load ordering, which would benefit other systems (especially those that
> are hitting the EPROBE_DEFER issue).
> 
> As it stands now, the ordering of the initcalls within a particular level
> is pretty much arbitrary (determined by link order, usually without oversight
> by the developer).  Just FYI, here are some numbers culled from a recent
> kernel:
> 
> initcall macro		number of instances in kernel source
> --------------		------------------------------------
> early_init		446
> core_init		614
> postcore_init		150
> arch_init		751
> subsys_init		573
> fs_init		1372
> device_init		1211
> late_init		440

Did you count module_init instances which are folded into the 
device_init leven when built-in?

> I'm going to rattle off a few ideas - I'm not sure which ones might
> stick,  I just want to bounce these around and see what people think.
> Note that I didn't think of most of these, but I'm just repeating ones
> that have been stated, and adding a few thoughts of my own.
> 
> First, if the ordering of initialization is not the default
> provided by the kernel, it needs to be recorded somewhere.  A developer
> needs to express it (or a tool needs to figure it out), but if it is
> going to be reflected in the final kernel behaviour (or image), the
> kernel needs it at boot time (if not compile time).  The current
> initcall system hardcodes a "level" for each driver initialization
> routine in the source code itself, by putting it in the macro
> name for each init routine.  There can
> only be one such order expressed in the code itself.
> 
> For developers who wish to express another order (or priority), a
> new mechanism will need to be used.  If possible, I strongly prefer
> putting this into the KCONFIG system, as that is where other details
> about kernel configuration are stored, and there are pre-existing tools
> for dealing with the format.  I am hesitant to create a special language
> or config format for this (unless it is much simpler than adding something
> to Kconfig).  As Nicolas pointed out, Kconfig already has information
> about dependencies in terms of not allowing a driver to be a module
> if a dependent module is statically linked. Having the tool warn for
> violations of that ordering would be valuable.

I think you're confusing two issues: ordering and dependency.  The 
dependency affects some of the ordering, but only a small portion of it.  
Within an initcall level the ordering is a result of the link order and 
therefore rather arbitrary.

IMHO the current initcall level system is simply too simple for the 
current kernel complexity.  The number of levels, and especially their 
names, are also completely arbitrary.  It probably made sense back when 
initcalls were introduced, but it is just too inflexible now.

Initcalls should instead be turned into targets and prerequisites, just 
like dependencies in a makefile.  This way, the ultimate target "execute 
/sbin/init in userspace" could indicate its prerequisite as "mount root 
fs".  Then "mount root fs" could have "USB storage" as a prerequisite 
depending on the boot args. From "USB storage" you could have two 
prerequisites: "USB stack" and "USB device enumeration".  And so down to 
the very first initcalls with no prerequisites.  Oh and I forgot to list 
"open console device" as another prerequisite for "execute /sbin/init". 
And "boot args" would have dependencies of its own, like "parse DT" 
maybe. Etc.

This way, no arbitrary initcall levels would be needed.  And we wouldn't 
have to play games when choosing the right initcall level when creating 
a new subsystem that has to sit in between existing levels.

That also makes a very clear minimum execution dependency tree for the 
work to be done in order to make user space usable as soon as possible. 
And parallel initcall execution would also be unambiguous, just like 
simultaneous jobs using 'make'.

Anything else like manual ordering or prioritizing of drivers when 
configuring the kernel will lead to madness.  The ultimate best ordering 
can and must be unique. Some of that ordering automation is already done 
by the module tools based on symbol dependencies when you run modprobe 
so only the required modules are loaded, and in the right order.

> Here are some questions...
> Do all driver initialization routines have a corresponding config
> variable?

No.  Many built-in initcalls are not configurable.

> Another possibility is a binary post-processor, which reorders
> the initcall tables in the kernel, after the compile has finished.
> So, rather than relying on the compiler, there would be a separate
> tool to modify the kernel binary to have the desired init ordering.
> The initcall macro could be extended to provide input to this tool,
> and the tool could read a separate configuration file indicating
> the routines that should be reordered in the boot sequence.

Thing is: initcall ordering should not be represented with a list.  It 
is actually a tree.  And the tree can be dynamic depending on the 
dependencies things like kernel command line arguments may create.

> Another idea would be to make the starting of user-space it's own
> initialization routine, which was not necessarily started as the last thing
> after all other statically linked driver initializations.  Then, it
> could begin operation before other drivers were initialized. It's init
> order could be controlled using the same mechanism as other initcalls.

Absolutely.

> Right now, user space starts as if it were a late_initcall, with an
> INITORDER=9, but if this were configurable, that might solve a lot
> of the problem.  A developer could push the order of user-space start
> earlier into the initialization sequence, if they needed to.

But it is figuring out all the dependencies, and _only_ those 
dependencies which is the actual problem.

> Grant Likely suggested deferring the ordering decision in a
> way that allowed it to be expressed at runtime rather than at
> compile-time.

We probably came to the same conclusion then.

> That, I think, would require a more substantial
> rework of the initcall system, probably requiring to make it
> text-driven. 

Nah...  The initcall specifier macro would simply have to accept a list 
of prerequisites.  Then a runtime equivalent would have to be created.

> It does have the possibility of solving some
> other driver init ordering problems that are now being
> addressed with EPROBE_DEFER.  My guess is that making the initcall
> system text-driven would increase the size of it to a degree
> that it would make more sense just to turn on the loadable
> module system.

Not everything can be turned into a module though.  And the in-kernel 
initcalls still could benefit from explicit dependencies to get rid of 
the multi-level thing we have now.

And this can be implemented gradually.  This could start with only a few 
meta initcalls called early_init,
core_init, postcore_init, etc. and they would initially depend on each 
other, simply executing the existing initcalls in a backward compatible 
way.  Then the legacy initcalls could be moved over one by one to the 
new system.

I'll try to find some time to play with this idea and see if it can go 
somewhere in practice.


Nicolas
