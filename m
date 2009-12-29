From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Tue, 29 Dec 2009 11:11:22 +0000
Message-ID: <4B39E3DA.8070107@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <200912271715.54249.rob@landley.net> <4B3887F8.5020509@warmcat.com> <200912282225.03019.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=+50bAiDDT2oYW/UT+M3/pIux2EBO5i74RGGlmjpqpNc=;
        b=khQfbxQeLkA6QKdUCqCEHb8bp0y3ZoE2q1mKLdJFfk1asvnFdcOlHQZ6apVq1kXi6l
         pEH9Hr070iCFOF7lj59qyvGJHY9lIVSZw5BHlZ4yc2LFFStqbqDhzn66nf0ZTzjgat1N
         FMpvBUbu+N0CGsJQm/aChnSWeQLEoL83ijnAU=
In-Reply-To: <200912282225.03019.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: celinux-dev@tree.celinuxforum.org, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On 12/29/09 04:25, Somebody in the thread at some point said:

Hi -

(We're talking about ARM11+ case here, just to save a lot of qualifying)

>> I wasn't suggesting you don't have firsthand experience all over the
>> place, eg, busybox, I know it.  What I do suggest in the principles I
>> have been bothering your Christmas with here can really pay off and are
>> in the opposite direction to Qemu, bloated bootloaders, and buildroot
>> style distro production.
>
> In the PDF I spent a dozen pages pointing out that I think buildroot is silly
> and how it diverged from its original goals.  Why do you bring it up here?

Buildroot is the original "select a bunch of projects and I will sit 
building them for you all day and give you a rootfs tarball".  What I 
talked about is "buildroot style distro production", where you sat there 
building things being a bad way if it's possible to use a real distro 
with precooked binaries.

> Building natively is nice.  I think cross compiling extensive amounts of stuff
> is generally counterproductive, and you don't seem to disagree with that.

I completely agree with it.

> (However, if there weren't cases where cross compiling _does_ make sense I
> wouldn't bother building the second stage cross compilers in my project and
> packaging them up for other people to use.  "I don't recommend it" != "people
> who do this are stupid".)

Earlier I pointed out that I use cross for bootloader and kernel.

The problems with cross generally come from having to continually fight 
projects that don't want to build cross and maintaining and building the 
hundreds of projects that make up your rootfs as your own personal 
burden.  Over time it seems to me it will be on a loser when it comes up 
against established distro projects like Fedora that are inheriting the 
quality of native built stuff and delivering binaries for your CPU ready 
cooked.  (Of course this is only true at this ARM11+ point, below that 
cross like buildroot is the lifesaver).

So yes, I would tell people to avoid cross distros if they can find a 
native built one that is workable for them because they can expect less 
issues and more consistent quality.  And they're not gonna be expected 
to build anything themselves.

> You're conflating a bunch of issues.  You can boot a full distro under qemu or
> under real hardware, so "use a native distro" is orthogonal to "develop under
> emulation vs develop on target hardware".  And building a hand-rolled system
> or assembling prebuilt distro bits can both be done natively (under either
> kind of "native"), so that's orthogonal too.

See above.  Qemu itself is an unnecessary burden for the developer, that 
goes triple if the guy follows the way you suggested and makes a giant 
Qemu build farm so he can follow that buildroot style and rebuild his 
whole distro pointlessly with distributed make, instead of simply 
downloading distro-built binaries and getting on with his life.

> I'm really not understanding what argument you're making.  "The one specific
> configuration I've chosen to use is better than any other possible
> configuration"...  Possibly there's a "for your needs" attached somewhere that
> you're missing?   You seem to be confusing "that's not an interesting option
> for me" with "that's not an interesting option".  You're conflating a bunch of
> different issues into a One True Way, which is sad.

Yes, I am sorry if it makes you uncomfortable but some things are 
inherently the wrong direction.  Bootloader bloat is the case in point, 
if there's an OS like Linux on the box it's always preferable to do your 
business in that, not add faux bash to your bootloader.

Sometimes you might get forced into going in the wrong direction, Robert 
was making the case about needing to light up his display super quick at 
boot.  If that happens you may bend to it, but it doesn't change that it 
was the wrong direction and you want to try to avoid it next time.

>> Or you just do it native and you don't care about extreme rebuild case
>> because you're using a distro that built it already.
>
> I find reproducibility to be kind of nice.  (Remember when ubuntu dropped
> Powerpc support?  Or how Red hat Enterprise is finally dropping itanic?  Even
> today can you build a full distro natively on new hardware like microblaze or
> blackfin?)
>
> I also don't see any difference between your "let the distro handle everything"
> with "the vendor supplies a BSP, why would you need anything else?"  That's
> certainly a point of view, and for you it may be fine.  Anything can be
> outsourced.  But "I don't have to do it, therefore nobody does" is a
> questionable position.

Hm, you were telling me I was conflating things earlier.

With RPM in terms of process you can easily rebuild the packages if you 
have the SRPM.  So it's nothing like a BSP blob, rebuild is always 
easily possible package by package, and the packages explain their build 
dependencies so it can be automated.  So "reproducibility" is possible.

My point is that typically on desktop and server distro installs, you do 
not go around rebuilding packages, Gentoo excepted because that's their 
thing.  I've done it to a couple of packages over the years and that's 
it.  The reason for going the distro route is I can rely on and exploit 
the work they already did.  (And in Fedora's case, their quality demands 
are higher than mine so it's an automatic win).

So while reproducibility is possible, it's almost never needed by end 
users.  If they do need it, they're going to have to get some metal that 
allows them to do it, maybe the mass Qemu farm thing or whatever.  But 
not typical users.

>>> There's more things you can do to speed it up if you want to go down that
>>> rabbit hole (which the presentation does), and there's more work being
>>> done in qemu.  (TCG was originally a performance hit but has improved
>>> since, although it varies widely by platform and is its own rabbit hole.
>>> Also switching to gigabit NIC emulation with jumbo frames helped distcc a
>>> lot.)
>>
>> Just saying people don't do distribution rebuilds for their desktop or
>> server boxes unless they're Gentoo believers.
>
> Linux From Scratch does not exist?  My friend Mark (who inherited a "Slackware
> for PowerPC" cross-build system) is in reality unemployed?  Nobody ever
> actually works _on_ Fedora and needs to do a development build?
>
> It's interesting to see someone who can imply these things with a straight
> face on an embedded development list.

You are making straw men here.  Normally, people who are using a distro 
do not do whole distribution rebuilds for their desktop or server boxes, 
it is a stone cold fact.  It must be 99%+ of distro users never 
customized one package let alone dist-rebuild.  They use the binary 
packages coming from the distro, that is the point of having a distro.

Yeah other people have buildroot-style build policies and do other 
things, good luck to them.  I'm suggesting they should be avoided for 
use at this ARM11+ level.

>> So the need to consider
>> this heavy duty stuff only exists at the distro.  In Fedora case, guys
>> at Marvell are running it and have access to lots of fast physical
>> hardware they hooked up to Koji (you touch on this in your PDF).  I
>> don't think it's like they were waiting to hear about Qemu now they're
>> gonna drop that and move to emulation.
>
> You also seem to be unaware that QEMU was only started in 2003 (first commit to
...
> Therefore, they didn't "drop" support, QEMU wasn't ready for prime time back

Please read what I actually wrote above, which has nothing to do with 
Qemu dropping anything.  It seems you would call this kind of thing 
"conflating orthogonal issues".

> By the way:
>
>    http://fedoraproject.org/wiki/Architectures/ARM/HowToQemu
>
> You continue to conflate orthogonal issues.

Again I didn't say it's not possible to use Qemu, it's just slow.  And 
for the reasons of having unified dependencies in your build system, if 
it is possible to build on your execution device that is preferable.

>> They're in the business of
>> making fast ARM chips and they're going to outpace Qemu.
>
> They're not in the same business.  They don't compete.  You don't deploy on
> qemu, and when you go down to Fry's to get a laptop the x86-64 is likely to
> continue to be the main option for the forseeable future.

Developers have to make a decision whether to use the native metal or 
emulation.  Qemu is slow, so much so you suggest having a build farm of 
Qemus to work around that.  Native metal is getting faster.

So I would advise people to use their fast native box if they have one, 
because I think it's going to get faster quicker than Qemu basis over 
the next years.

>>> But in general, Moore's Law says that qemu on current PC hardware is
>>> about the speed of current PC hardware seven years ago.  (And obviously
>>> nobody ever built anything before 2003. :)
>>
>> The speed surely depends on the architecture being emulated.  I did try
>> Qemu on ARM on a nice desktop box here and it seemed unworkable to me.
>
> You couldn't make it work, therefore it can't be made to work?

Oh no: it worked.  It was "unworkable" as a basis for development 
because it was slower than my native hardware.  So I moved to that and 
removed the burden of Qemu and syncing two rootfses from my development 
thinking.

>> I am perfectly happy to trust Fedora to take care of disribution
>> rebuilds for me.
>
> Good for you.
>
> Did it ever occur to you that there are people out there who do the bits you
> don't personally do?  That all these packages don't emerge from zeus's
> forehead on a quarterly basis?  That someone, somewhere, is actually
> interested in how this stuff _does_ work?

Of course.  Do you know about Koji?  It's pretty cool.

http://arm.koji.fedoraproject.org/koji/

That level of infrastructure and investment is done by the distro, not 
the users who can get high quality, immediately usable binaries for 
free.  We shouldn't be advising devs that they need to get into 
reproducing the distro as the price of entry.  (They can get into that 
if they absolutely have to, they can even run their own koji which is 
packaged in Fedora.)

>> This is what I have been calling "buildroot thinking" again.  What do
>> you think you will be rebuilding exactly out of Fedora when you put it
>> on an ARM11+ system?  Typically, it's going to be zero packages, nothing
>> at all.  What you will need to build typically is this:
>
> "All the world's a Cortex A8, and always will be."
>
> Look, go have fun.  I'm sure what you've chosen to do is going to work just
> great for you, and you'll never need to care about anything else.  Personally,
> I no interest in speaking to you ever again about anything, and I have a spam
> filter for situations like this.
>
> I'll even make you happy: "You win!"  There you go.
>
> *plonk*

I see.

Well, unfortunate as it is I now have to address the back of your head 
with your hands clamped over your ears, I would like to thank you for an 
interesting thread.

-Andy
