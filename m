From: Rob Landley <rob@landley.net>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Thu, 23 Oct 2014 13:37:31 -0500
Message-ID: <54494AEB.1000303@landley.net>
References: <5441F592.6090807@gmail.com> <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com> <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com> <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net> <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr> <5447C7BE.60506@landley.net>,<alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Bird, Tim" <Tim.Bird@sonymobile.com>, Nicolas Pitre <nico@fluxnic.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "challinan@gmail.com" <challinan@gmail.com>



On 10/23/14 12:21, Bird, Tim wrote:
> On Wednesday, October 22, 2014 8:49 AM, Nicolas Pitre [nico@fluxnic.net] wrote:
>> On Wed, 22 Oct 2014, Rob Landley wrote:
>> Otherwise the standard hotplug notification mechanism is already
>> available.
> 
> I'm not sure why this attention to reading the status.  The salient feature
> here is that the initializations are deferred until user space tells the kernel
> to proceed.  It's the initiation of the trigger from user-space that matters.
> The whole purpose of this feature is to defer some driver initializations until
> the product can get into a state where it is already ready to perform it's primary
> function.  Only user space knows when that is.
> 
> There seems to be a desire to have an automatic mechanism for triggering
> the deferred initializations.  I'm OK with this, as long as there's some reasonable
> use case for it.  There are lots of possible trigger mechanisms, including just
> a simple timer, but I think it's important that the primary use case of 
> 'trigger-when-user-space-says-to' is still supported.

The patches were reference but not (re-?)posted. People were talking
about waiting for the "real root filesystem" to show up, which strike me
as the wrong approach. Glad to hear the patch series is taking a better one.

> This code is really intended for a very specialized kernel configuration, where all
> the modules are statically linked, and indeed module loading itself is turned off. 
> I think that's a minority of Linux deployments out there.

Yeah, but not as rare as you're implying. That's how I build most of my
systems, for example.

Modules mean you need bits of the kernel to live in the root filesystem
image (and to match it exactly due to stable-api-nonsense.txt), which
complicates both build and upgrade. Unloading modules has never really
been properly supported, so there's no actual size or complexity
advantage to modules: you need it once and the resource is consumed
until next reboot. And of course there's security fun (spraying it down
with cryptography makes it "awkward" more than "safe", and doesn't
change that you now have a multimode kernel that sometimes does one
thing and sometimes does another).

Not Going There with modules is a valid response for embedded systems if
I want to know what I'm deploying.

> This configuration
> implies some other attributes, like configuration for very small size and/or very
> fast boot, where KALLSYMS may not be present, and other kernel features may
> not be available as well.

A new feature can have requirements. Not every existing deployment can
take advantage of any given new feature anyway. (Your _biggest_ blocker
will be that they're using a ${VENDOR:-broadcom} BSP that's stuck on
2.6.32 in 2014 and upgrading to a kernel version less than 5 years old
will never happen as long as you source hardware from vendors that fork
software rather than getting support upstream.)

> Indeed, in the smallest systems /proc or /sys may not
> be there, so an alternative (maybe a sysctl or even a new syscall) might be
> appropriate. 

A) Those don't interest me. As far as I'm concerned, they're not Linux.

B) If you propose a new syscall for this, it will never be merged. The
mechanism they implemented for this sort of thing is sysfs and hotplug.

> Quite frankly, the hacky way this is often done is to make stuff like this a
> one-time side effect of a rarely called syscall (like sync).  Please note I'm not
> recommending this for mainline, just pointing out there are interesting ways
> that embedded developers just make the existing code work for their weird
> cases.
> 
> Maybe there are some use cases for doing deferred initializations, particularly
> automatically, for systems that do have modules turned on (i.e. for modules
> that are, in that case, still statically linked to the kernel for whatever reason).
> I would welcome some discussion of these, to select an appropriate trigger
> mechanism for those cases.  But we should not let the primary purpose of this
> feature get lost in that discussion.

I thought it was common to defer at least some device probing until the
/dev node got opened. Which is a chicken and egg problem with regards to
the dev node showing up so you _can_ open them, which screwed up devfs
to the point of unworkability, and the answer to that was sysfs. So
having sysfs trigger deferred init from userspace makes perfect sense,
doing it that way means history is on your side and the kernel guys are
more likely to approve because it smells like what they've already done.

>   -- Tim

Rob
