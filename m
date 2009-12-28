From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Mon, 28 Dec 2009 10:27:04 +0000
Message-ID: <4B3887F8.5020509@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <200912270117.18130.rob@landley.net> <4B372EEB.2000902@warmcat.com> <200912271715.54249.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=ZpTVEl51rhsj9taXm6fcXYO3oM7RnGgVW5fL33tGZkE=;
        b=bmnGJm2HY1PUIVkTkUK0Cza6+vRcS38rgtFym6OCTsfnZ2Q1tXdpS7LQ2F63G49bt7
         +J7H5MLAssaLHC39PFstQ7E8o3I9kMgfDNV4XxutED8C77ZdXI7CsauO7kLDO4Nbfycc
         aUK/CV35VSrKTW4iNgduLtlbgXNUYJH9Osuyk=
In-Reply-To: <200912271715.54249.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: celinux-dev@tree.celinuxforum.org, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On 12/27/09 23:15, Somebody in the thread at some point said:

Hi Rob -

> I've also spent the last few years developing a project that produces native
> built environments for various QEMU targets and documents how to bootstrap
> various distros under them:
>
>    http://impactlinux.com/fwl
>
> So I do have some firsthand experience here.

I wasn't suggesting you don't have firsthand experience all over the 
place, eg, busybox, I know it.  What I do suggest in the principles I 
have been bothering your Christmas with here can really pay off and are 
in the opposite direction to Qemu, bloated bootloaders, and buildroot 
style distro production.

>>>> Fedora provides a whole solution there, with the restriction it's
>>>> designed for native build, not cross.
>>>
>>> QEMU: it's not just for breakfast anymore.
>>
>> That's right Qemu often requires lunch, teatime and supper too to build
>> anything :-)
>
> Which is why you hook it up to distcc so it can call out to the cross
> compiler, which speeds up the build and lets you take advantage of SMP.
> (Pages 217-226 of the above PDF.)

Or you just do it native and you don't care about extreme rebuild case 
because you're using a distro that built it already.

There's a critical advantage to build in specifically the execution 
environment you do cover in three words on slide 14 of your PDF I expand 
on at the end of the mail.

> That's also why my FWL project uses a statically linked version of busybox,
> because the static linking avoids the extra page retranslations on each exec
> and thus sped up the ./configure stage by 20%.  (Pages 235-236 of PDF.)
>
> There's more things you can do to speed it up if you want to go down that
> rabbit hole (which the presentation does), and there's more work being done in
> qemu.  (TCG was originally a performance hit but has improved since, although
> it varies widely by platform and is its own rabbit hole.  Also switching to
> gigabit NIC emulation with jumbo frames helped distcc a lot.)

Just saying people don't do distribution rebuilds for their desktop or 
server boxes unless they're Gentoo believers.  So the need to consider 
this heavy duty stuff only exists at the distro.  In Fedora case, guys 
at Marvell are running it and have access to lots of fast physical 
hardware they hooked up to Koji (you touch on this in your PDF).  I 
don't think it's like they were waiting to hear about Qemu now they're 
gonna drop that and move to emulation.  They're in the business of 
making fast ARM chips and they're going to outpace Qemu.

> But in general, Moore's Law says that qemu on current PC hardware is about the
> speed of current PC hardware seven years ago.  (And obviously nobody ever
> built anything before 2003. :)

The speed surely depends on the architecture being emulated.  I did try 
Qemu on ARM on a nice desktop box here and it seemed unworkable to me. 
I am perfectly happy to trust Fedora to take care of disribution 
rebuilds for me.

>> Newer ARM platforms like Cortex8+ and the Marvell Sheevaplug will
>> outstrip emulated performance on a normal PC.  There are 2GHz multi-core
>> ARMs coming as well apparently.  So I took the view I should ignore Qemu
>> and get an early start on the true native build that will be the future
>> of "native build" as opposed to cross due to that.
>
> Pages 24-34 of the above PDF go over this.  The first two pages are on the
> advantages of native compiling on real hardware, the next eight pages are on
> the disadvantages.  It can certainly be made to work, especially in a large
> corporation willing to spend a lot of money on hardware as a _prerequisite_ to
> choosing a deployment platform.

This is what I have been calling "buildroot thinking" again.  What do 
you think you will be rebuilding exactly out of Fedora when you put it 
on an ARM11+ system?  Typically, it's going to be zero packages, nothing 
at all.  What you will need to build typically is this:

  - bootloader (using Fedora's cross compiler package)
  - kernel (using Fedora's cross compiler package)
  - your own apps and libs (native build on device against libs there)

In addition you will need to take evasive action around the boot flow, 
but to get started that's just init=/bin/my-init.sh

> For hobbyists, small businesses, and open source developers in general, there
> are significant advantages to emulation.  (Page 208 comes to mind.)  And if you
> _are_ going to throw money at hardware, x86-64 continues to have better
> price/performance ratio, which was always its thing.

The point is you will definitely be throwing lots of money at hardware 
in this game, your ARM device platform.  Since all products start with 
zero users, and we get to be the first, we had best spend all our time 
gaining experience with the hardware we plan to ship.

If there are problems with upstream unless it's something really in the 
plumbing like cache behaviour which is a kernel issue, it can normally 
be shown in the code easy enough.

> Pages 68-71.  If your definition of embedded development is using off the shelf
> hardware and installing prebuilt binary packages into it, life becomes a lot
> easier, sure.

Well that's exactly my point, except the shelf the hardware came off is 
the one with your own prototype ARM devices.  No Qemu, no mass rebuilds, 
no funky "it's embedded so we have to whip ourselves with nettles".

If life's a lot easier blowing away buildroot style and the 
infrastructure for that, why is anyone considering doing it the hard way 
on devices that can handle the faster, more reliable and well understood 
packaged distro rootfs basis?  It really does become like working on a 
desktop Linux box with Fedora.

>> For a lot of cases that's a few small
>> app packages that are mainly linking against stuff from the distro and
>> they're not too bad to do natively.
>
> Pages 78-84
...

I have been actually living these principles the past couple of years, 
consider this a report from a specific frontline rather than a review of 
possibilities.

> Package control or source control?  (Different page ranges...)

Package control is also source control, that is a whole other advantage 
of using a packaged distro, license compliance becomes real easy.  A 
Source RPM is generated with the binary ones, you just need to get the 
SRPMs of the packageset you are shipping (which you can get a list of 
with rpm -qa) and publish it for GPL compliance.  You can also grep the 
packages for licence and automate other tasks that way (such as 
excluding source).


Anyway here's the reason promised earlier that building out of the 
execution environment will bite you, you need to keep the "-devel" stuff 
in sync: includes and libraries.  You can easily install a new version 
of something with a -devel on your actual device and still be building 
against the old version of it on this Qemu or Cross build environment.

Building on the device you are running on, and using packaged builds for 
your own apps removes this issue completely.


This thread was meant to be about merits of Qi, it's kinda gone off into 
embedded with distro rootfs because the philosophy is related.  In both 
cases burden on the developer is intended to be removed and effort 
simplified to get the job done more reliably and quicker.

My experience has been this kind of talk makes people feel jumpy when 
they're invested in the other philosophies.  I hope what has been 
discussed has left people at least wondering if there might be value in 
disallowing the bootloader from doing anything but get you quickly into 
Linux, so the development and support effort can focus just in Linux and 
the bootloader was just something you spent a day tuning months ago and 
never touched again (especially not in the factory).

-Andy
