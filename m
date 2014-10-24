From: Rob Landley <rob@landley.net>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Fri, 24 Oct 2014 14:38:07 -0500
Message-ID: <544AAA9F.8060808@landley.net>
References: <5441F592.6090807@gmail.com> <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com> <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com> <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net> <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr> <5447C7BE.60506@landley.net> <alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net> <alpine.LFD.2.11.1410231334250.6969@knanqh.ubzr> <20141023181336.GC10477@piout.net> <alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E68C@seldmbx02.corpusers.net> <alpine.LFD.2.11.1410231616570.6969@knanqh.ubzr> <54498344.8080507@landley.net> <alpine.LFD.2.11.141023184740
 0.6969@knanqh.ubzr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.11.1410231847400.6969@knanqh.ubzr>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolas Pitre <nico@fluxnic.net>
Cc: "Bird, Tim" <Tim.Bird@sonymobile.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On 10/23/14 19:36, Nicolas Pitre wrote:
> On Thu, 23 Oct 2014, Rob Landley wrote:
> 3) You, too, conveniently avoided to define the initial problem so far.
>    That makes for rather sterile conversations about alternative 
>    solutions that could score higher on the mainline acceptance scale.

With modules, you can already defer large portions of kernel-side system
bringup until userspace is ready for them. With static linking, you can't.

This patch series sounds like it lets static drivers hold off their
initialization until userspace sends them an insmod-equivalent event
through sysfs, possibly with associated arguments since the module
codepath already implements that so exposing it through the new
mechanism in the static linking case would be trivial.

Seems conceptually fairly straightforward to me, but I'm just guessing
since nobody's yet linked to the patches during this thread (that I've
noticed).

>>>> In some cases, the system may want to defer initialization of some drivers
>>>> until explicit action through the user interface.  So the trigger may not be
>>>> called until well after boot is "completed".
>>>
>>> In that case the "trigger" for initializing those drivers should be the 
>>> first time they're accessed from user space.
>>
>> Which gets us back to one of the big reasons <strike>systemd</strike>
>> devfsd failed years ago: you have to probe the hardware in order to know
>> which /dev nodes to create, so you can't have accessing the /dev node
>> probe the hardware. (There's no /dev node for a usb controller...)
> 
> There is /sys/bus/usb/devices that could be accessed in order to trigger 
> the initial setup and probe.  It is most likely that libusb does that, 
> but this could be made to work with a simple 'cat' or 'touch' invocation 
> as well.

Please let me know which "devices" to trigger to launch an encrypted
ramdisk driver that has nontrivial setup because it needs to generate
keys (and collect enough entropy to do so). Or how about a driver that
programs a set of gpio pins to a specific behavior, obviously that's
triggered by examining the hardware.

A module can produce multiple /dev nodes from one piece of hardware, a
piece of hardware can produce no dev nodes (speaking of usb, the actual
bus-level driver), dev nodes may not have any associated hardware but
still require setup (/dev/urandom if you care about the quality of the
entropy pool)...

This is why devfs didn't work. You're trying to do this at the wrong
level. If you want to defer a module's init, doing so at the _module_
level is the only coherent way to do it.

>>> That could be the very first time libusb or similar tries to 
>>> enumerate available USB devices for example.  No special interface 
>>> needed.
>>
>> So now you're requiring libusb enumerating usb devices, when before this
>> you could just reach out and open /dev/ttyUSB0 and it would be there.
> 
> You can't just "reach out" with the deferred initcall scheme either, do 
> you?

You can already can do this with modules. Just don't insmod until you're
ready.

Right now the implementation ties together "the code is in kernel" with
"the code starts running", so you can't both statically link the module
and control when it starts doing stuff. That really _seems_ like it's
just an implementation detail: decoupling them so the code is in kernel
but doesn't call its init function until userspace tells it to does not
sound like a huge conceptual stretch.

Is there an actual reason to invent a whole new unrelated thing instead?

>> This is an embedded solution?
>>
>>>>>>> I'm suggesting that they no longer prevent user space from executing
>>>>>>> earlier.  Why would you then still want an explicit trigger from user
>>>>>>> space?
>>>> Because only the user space knows when it is now OK to initialize those
>>>> drivers, and begin using CPU cycles on them.
>>>
>>> So what?  That is still not a good answer.
>>
>> Why?
>>
>> I believe Tim's proposal was to take a category of existing device
>> probing, one already done on a background thread, and wait to start it
>> until userspace says "go". That's about as nonintrusive a change as you get.
> 
> You might still be able to do better.

We have a mechanism available in one context. Would you rather make that
mechanism available in another context, or design a whole new mechanism
from scratch?

> If you really want to be non intrusive, you could e.g. make those 
> background threads into SIGSTOP and let user space SIGCONT them as it 
> sees fit.  No new special interfaces needed.

We have an existing module namespace, and existing mechanisms that use
it to control this sort of thing. Are you suggesting a lookup mechanism
that says "here's the threat that would be initializing this module if
we hadn't started the thread SIGSTOP"? (With each one in its own thread
so you have the same level of granularity the existing mechanism provides?)

>> You're talking about requiring weird arbitrary things to have side effects.
> 
> Like if stalling arbitrary initcalls wouldn't have side effects?

You're arguing that modules, as the exist today, couldn't possibly work.

Modules exist today. Somehow the system survives having them loaded long
after boot time. (The system even lets you load a whole separate kernel
through kexec and then _not_ immediately reboot into it, for disaster
recovery purposes and crash dumps and such.)

> What I'm suggesting is to let the system do its thing the most efficient 
> way while giving a strong bias to running user space first.  How 
> arbitrarily weird can that be?

I'm suggesting "we have all this module infrastructure, it's not
currently hooked up to work with static linking which is a thing people
legitimately want to do, it doesn't sound like much work to _make_ it
work there, so why would you invent a whole new thing?"

Honestly, the biggest change discussed so far is adding a fourth letter
to menuconfig's "tristate" entries to say "static linking, but wait to
start it running until userspace pokes something under /sys/modules".

The kernel guys previously leveraged all this infrastructure, even in
the static linked case, to make suspend work. There's precedent for this
sort of thing.

>> If you're running in initramfs we haven't necessarily done _any_ driver
>> probing yet. That's what initramfs is for. You can put device firmware
>> in there so static drivers can make hotplug firmware loading requests to
>> userspce during their device programming. (It's one of those usermode
>> helper callback things.)
> 
> True if you need firmware, or if you want to actually load modules to 
> get to the root fs device.  Otherwise all built-in driver init functions 
> have been called and waited for at that point.

The difference between "built-in driver" and "loaded module" is kind of
arbitrary in this context. I could write a driver with a stub init
function that just adds a sysfs file, and then have the exact same
startup code called when you cat a file in sysfs. (The kernel devs would
freak if you did that on a per-module basis, modifying numerous existing
modules to do that would be frowned on, and without the kconfig changes
you'd be hardwiring configuration choices into the source code which is
just wrong. But it's not actually a big change in terms of amount of
code to make it _work_, unless I'm missing something really obvious.)

>>>> Note that this solution should work on UP systems, were there is
>>>> essentially a zero-sum game on using CPU cycles at boot.
>>>
>>> The scheduler knows how to prioritize things on UP as well.  The top 
>>> priority thread will always go to sleep at some point allowing other 
>>> threads to run. But I'm sure you know all that.
>>
>> The top priority threads will get preempted.
>>
>> (Did you follow any of the work Con Kolivas and company were doing a few
>> years ago?)
> 
> Yeah... and I also notice it is still maintained, still out of mainline.

The fact the dysfunctional kernel development process burned out yet
another developer doesn't say much about the problem that developer was
trying to solve:

http://apcmag.com/why_i_quit_kernel_developer_con_kolivas.htm

Here's the story of squashfs taking seven years to get into mainline,
including its author taking a year off from work (living off savings) to
finally get it into Linus's tree _after_ it was already in every major
distro:

https://lwn.net/Articles/563578/

That says way more about the kernel development process being
dysfunctional than it does about squashfs. (Or Con's scheduling work.)

Squashfs is our idea of a _success_ story. Val Henson (now Aurora)
quitting to cofound the Ada Initiative (and thus union mounts falling by
the wayside) was not because of the union mounts problem space or
implementation quality. Alan Cox didn't stop maintaining his tree,
switch his blog to welsh, and bugger off for a year to get an MBA
because there was something wrong with his tree, it was a result of his
interactions with Linus. (I was tangentially involved behind the scenes
on that due to that "patch penguin" thing, got some non-public info
that's now old news.)

I myself spent over five years getting the perl removal patches accepted
into mainline, and the gap between my first "why can't initramfs use
tmpfs so going cat /dev/zero > /bigfile isn't guaranteed to bring down
the system?" and me actually getting the patches merged was close to a
decade. In neither case did the gap have anything to do with the actual
merits of any code or design idea in question.

The kernel clique circling the wagons is actually fairly old news:

http://www.zdnet.com/graying-linux-developers-look-for-new-blood-7000020026/

Such social reasons are part of why "make existing module mechanism
available in new context" seems (to me) more likely to work than
"reinvent devfs". But ymmv...

> As you know already, you can do anything you want on your own.  That's 
> granted by the GPL.

I'm pretty sure I could have done anything I wanted on my own with
System 6 unix in the 1970's (modulo being 7 years old), since the BSD
guys _did_ and their stuff is still around (and is powering obscure
things like the iPhone). And I learned C in 1989 to apply "mod" files to
the WWIV bulletin board system (an open source development community
that didn't even have the "patch" program).

But by all means, credit the GPL for the existence of open source.
Apache would never have become the dominant webserver without the GPL,
nobody would use or develop openssh or dropbear under non-GPL licenses,
our userspace successes like firefox and chrome are clearly because of
the GPL, x.org could fork away from xfree86 because of the GPL...

Did you notice that there's no such thing as "the GPL" anymore? Linux
and Samba implement two ends of the same protocol, each one is GPL, and
they can't share code. Poor QEMU wants to suck GPL processor definitions
out of binutils/gdb to emulate processors and GPL driver code out of
Linux to emulate devices, and there _is_ no license that allows it to
combine code from both sources. (Making qemu "GPLv2 or later" means it
couldn't accept code from _either_ source.)

> Nicolas

I'm going to recuse myself from the rest of this thread because I'm
clearly getting annoyed with us talking past each other. Somebody's got
an actual patch (which they still haven't linked to). I'll shut up and
let them show you the code.

Rob
