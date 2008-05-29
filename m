From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: Some embedded topics
Date: Thu, 29 May 2008 14:20:03 -0400
Message-ID: <8bd0f97a0805291120t1a646928g92fb644d8eaf6428@mail.gmail.com>
References: <483C83DE.3040604@cisco.com> <200805282201.48746.rob@landley.net>
	 <8bd0f97a0805282121j10a99bb7ve92efc6a8dc8bbb1@mail.gmail.com>
	 <200805291231.11529.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=cw71DlCJHfz/lhW0Y9Eyd39wfbM2ilh2jaMsigyQQU8=;
        b=J5KdW9EinMrUIlS2zJKXQxBCPcRfOH03z4oKnnDTSTqxd+ALY/FLKb4AtJymC2F6loQbkmqTzfw13q1QioBgVZc8Fmbzs6o1NLDJiCneF1irRyABCP+K3Vt5625UI7Gw/VdItqp9SuRZlawhGZ8ZgQYG5LSGYZYISUaW6I26OOY=
In-Reply-To: <200805291231.11529.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: T Ziomek <ctz001@email.mot.com>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org

On Thu, May 29, 2008 at 1:31 PM, Rob Landley wrote:
> On Wednesday 28 May 2008 23:21:52 Mike Frysinger wrote:
>> On Wed, May 28, 2008 at 11:01 PM, Rob Landley wrote:
>> > On Tuesday 27 May 2008 17:31:42 T Ziomek wrote:
>> >> If I understand correctly David is talking about logging some trace-like
>> >> info (so it exists before a HW watchdog expires), and having it
>> >> somewhere "safe" from being disturbed by a HW reset.
>> >
>> > The standard way of doing this is to use the mem= kernel command line
>> > parameter to tell the system it has less memory than it does, and using
>> > what's left as a ramdisk.  Years ago I saw some userspace thing running
>> > as root mmap() /dev/mem (or whatever they're calling it these days) and
>> > log to it.  In theory you could even set the dmesg buffer up at the end
>> > of physical memory with a smallish kernel patch, make it big, and set the
>> > kernel to doing verbose printks.
>> >
>> > The trick is A) knowing the absolute physical address at which your debug
>> > buffer lives so you can find it after the reboot, B) convincing the
>> > system to do something useful with it on reboot rather than just
>> > overwriting it with fresh log data.
>>
>> how about the fact that when the core resets, the memory controller is
>> often reset as well ?  that external memory is going to degrade.  or
>> do we just bite our thumb and weather the few random bit errors ?
>> -mike
>
> Mostly it isn't a problem because DRAM lasts longer than you think it does:
>  http://www.securityfocus.com/brief/686

ive read that article before and i'm aware of real degradation times.
it also points out that "the colder the better" which certainly doesnt
line up with many realistic cases of machines sitting in hot rooms or
in closests.  working off of "well it should be fine most of the time"
isnt nearly as good as "this always works", and all it takes is 1 or 2
bits to be corrupt to significantly change the meaning of a cpu state
dump ...

but as long as things are prefaced this way and people are aware ...
it's better than nothing

> Your memory controller init has to go out of its way to screw it up with a
> memory test or some such.  (That said, some of 'em do...)

as soon as the memory controller stops refreshing, it's a problem.

> This of course assumes you have spare ram for a while second kernel to sit
> around and do nothing until you pass control to it to fetch your diagnostics.
> Most embedded systems don't.

if you communicate the kernel log buffer pointer to u-boot, then you
can just read that directly.
-mike
