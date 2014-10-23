From: Rob Landley <rob@landley.net>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Thu, 23 Oct 2014 17:37:56 -0500
Message-ID: <54498344.8080507@landley.net>
References: <5441F592.6090807@gmail.com> <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com> <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com> <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net> <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr> <5447C7BE.60506@landley.net> <alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net> <alpine.LFD.2.11.1410231334250.6969@knanqh.ubzr> <20141023181336.GC10477@piout.net> <alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E68C@seldmbx02.corpusers.net> <alpine.LFD.2.11.1410231616570.6969@knanqh.ubzr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.11.1410231616570.6969@knanqh.ubzr>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolas Pitre <nico@fluxnic.net>, "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>



On 10/23/14 15:50, Nicolas Pitre wrote:
> On Thu, 23 Oct 2014, Bird, Tim wrote:
> 
>> On Thursday, October 23, 2014 12:05 PM, Nicolas Pitre wrote:
>>>
>>> On Thu, 23 Oct 2014, Alexandre Belloni wrote:
>>>
>>>> On 23/10/2014 at 13:56:44 -0400, Nicolas Pitre wrote :
>>>>> On Thu, 23 Oct 2014, Bird, Tim wrote:
>>>>>
>>>>>> I'm not sure why this attention to reading the status.  The salient feature
>>>>>> here is that the initializations are deferred until user space tells the kernel
>>>>>> to proceed.  It's the initiation of the trigger from user-space that matters.
>>>>>> The whole purpose of this feature is to defer some driver initializations until
>>>>>> the product can get into a state where it is already ready to perform it's primary
>>>>>> function.  Only user space knows when that is.
>>>>>
>>>>> This is still a rather restrictive view of the problem IMHO.
>>>>>
>>>>> Let's step back a bit. Your concern is that some initcalls are taking
>>>>> too long and preventing user space from executing early, right?
>> Well,  not exactly.
>>
>> That is not the exact problem we're trying to solve, although it is close.
>> The problem is not that users-space doesn't start early enough, per se,
>> it's that there are a set of drivers statically linked to the kernel that are
>> not needed until after (possibly well after) user space starts.
>> Any cycles whatsoever being spent on those drivers (either in their
>> initialization routines, or in processing them or scheduling them)
>> impairs the primary function of the device.  On a very old presentation
>> I gave on this, the use case I gave was getting a picture of a baby's smile.
>> USB drivers are NOT needed for this, but they *are* needed for full
>> product operation.
> 
> As I suggested earlier, those cycles spent on those drivers may be 
> deferred to a moment when the CPU has nothing else to do anyway by 
> giving a lower priority to the threads handling them.

Unless you're using realtime priorities your kernel will spend about 5%
of its time servicing the lowest priority threads no matter what you do,
to avoid priority inversion lockups of the kind that cost us a mars
probe back in the 90's.

http://research.microsoft.com/en-us/um/people/mbj/Mars_Pathfinder/Authoritative_Account.html

Doing hardware probing at low priorities can cause really _fun_ latency
spikes in the system as something grabs a lock and then sleeps. (And
doing this at the realtime scheduling where it won't do that translates
those latency spikes into the aforementioned hard lockup, so not
actually a solution per se.)

Trying to fix this in the general case is the priority inheritance
problem, and last I heard was really hard. Maybe it's been fixed in the
past few years and I hadn't noticed. (The rise of SMP made it a less
pressing issue, but system bringup is its own little world.)

The reliable fix to priority inversion is to let low priority jobs still
get a decent crack at the CPU so clogs clear themselves naturally. And
this means that scheduling it down as far as it goes does _not_ simply
make low priority jobs go away.

>> In some cases, the system may want to defer initialization of some drivers
>> until explicit action through the user interface.  So the trigger may not be
>> called until well after boot is "completed".
> 
> In that case the "trigger" for initializing those drivers should be the 
> first time they're accessed from user space.

Which gets us back to one of the big reasons <strike>systemd</strike>
devfsd failed years ago: you have to probe the hardware in order to know
which /dev nodes to create, so you can't have accessing the /dev node
probe the hardware. (There's no /dev node for a usb controller...)

> That could be the very
> first time libusb or similar tries to enumerate available USB devices 
> for example.  No special interface needed.

So now you're requiring libusb enumerating usb devices, when before this
you could just reach out and open /dev/ttyUSB0 and it would be there.

This is an embedded solution?

>>>>> I'm suggesting that they no longer prevent user space from executing
>>>>> earlier.  Why would you then still want an explicit trigger from user
>>>>> space?
>> Because only the user space knows when it is now OK to initialize those
>> drivers, and begin using CPU cycles on them.
> 
> So what?  That is still not a good answer.

Why?

I believe Tim's proposal was to take a category of existing device
probing, one already done on a background thread, and wait to start it
until userspace says "go". That's about as nonintrusive a change as you get.

You're talking about requiring weird arbitrary things to have side effects.

> User space shouldn't have to care as long as it has all the CPU cycles 
> it wants in priority.

That's not how scheduling works. The realtime people have been trying to
make scheduling work that wasy for _years_ and it's still a flaming pain
to use their stuff without hard lockups and weird inexplicable dropouts.

> But as soon as user space relinquishes the CPU 
> then there is no reason why driver initialization couldn't take over 
> until user space is made runnable again.

There is an entire academic literature on this. Google "priority inversion".

> [...]
>>> My point is simply not to defer any initialization at all.  This way you
>>> don't have to select which module or initcall to send a trigger for
>>> later on.
>>
>> If you are going to avoid having a sub-set of modules consume
>> CPU cycles in early boot, you're going to have to identify them somehow.
>> How do you propose to enumerate the modules to defer (or
>> de-prioritize, as the case may be)?
> 
> Anything that is not involved with making the root fs available.

If you're running in initramfs we haven't necessarily done _any_ driver
probing yet. That's what initramfs is for. You can put device firmware
in there so static drivers can make hotplug firmware loading requests to
userspce during their device programming. (It's one of those usermode
helper callback things.)

>> Note that this solution should work on UP systems, were there is
>> essentially a zero-sum game on using CPU cycles at boot.
> 
> The scheduler knows how to prioritize things on UP as well.  The top 
> priority thread will always go to sleep at some point allowing other 
> threads to run. But I'm sure you know all that.

The top priority threads will get preempted.

(Did you follow any of the work Con Kolivas and company were doing a few
years ago?)

Rob
