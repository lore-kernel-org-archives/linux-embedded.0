From: Rob Landley <rob@landley.net>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Mon, 28 Dec 2009 22:25:02 -0600
Message-ID: <200912282225.03019.rob@landley.net>
References: <4B29EC68.1040109@0xlab.org> <200912271715.54249.rob@landley.net> <4B3887F8.5020509@warmcat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B3887F8.5020509@warmcat.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andy Green <andy@warmcat.com>
Cc: celinux-dev@tree.celinuxforum.org, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On Monday 28 December 2009 04:27:04 Andy Green wrote:
> I wasn't suggesting you don't have firsthand experience all over the
> place, eg, busybox, I know it.  What I do suggest in the principles I
> have been bothering your Christmas with here can really pay off and are
> in the opposite direction to Qemu, bloated bootloaders, and buildroot
> style distro production.

In the PDF I spent a dozen pages pointing out that I think buildroot is silly 
and how it diverged from its original goals.  Why do you bring it up here?

Building natively is nice.  I think cross compiling extensive amounts of stuff 
is generally counterproductive, and you don't seem to disagree with that.  
(However, if there weren't cases where cross compiling _does_ make sense I 
wouldn't bother building the second stage cross compilers in my project and 
packaging them up for other people to use.  "I don't recommend it" != "people 
who do this are stupid".)

You're conflating a bunch of issues.  You can boot a full distro under qemu or 
under real hardware, so "use a native distro" is orthogonal to "develop under 
emulation vs develop on target hardware".  And building a hand-rolled system 
or assembling prebuilt distro bits can both be done natively (under either 
kind of "native"), so that's orthogonal too.

I'm really not understanding what argument you're making.  "The one specific 
configuration I've chosen to use is better than any other possible 
configuration"...  Possibly there's a "for your needs" attached somewhere that 
you're missing?   You seem to be confusing "that's not an interesting option 
for me" with "that's not an interesting option".  You're conflating a bunch of 
different issues into a One True Way, which is sad.

> >>>> Fedora provides a whole solution there, with the restriction it's
> >>>> designed for native build, not cross.
> >>>
> >>> QEMU: it's not just for breakfast anymore.
> >>
> >> That's right Qemu often requires lunch, teatime and supper too to build
> >> anything :-)
> >
> > Which is why you hook it up to distcc so it can call out to the cross
> > compiler, which speeds up the build and lets you take advantage of SMP.
> > (Pages 217-226 of the above PDF.)
>
> Or you just do it native and you don't care about extreme rebuild case
> because you're using a distro that built it already.

I find reproducibility to be kind of nice.  (Remember when ubuntu dropped 
Powerpc support?  Or how Red hat Enterprise is finally dropping itanic?  Even 
today can you build a full distro natively on new hardware like microblaze or 
blackfin?)

I also don't see any difference between your "let the distro handle everything" 
with "the vendor supplies a BSP, why would you need anything else?"  That's 
certainly a point of view, and for you it may be fine.  Anything can be 
outsourced.  But "I don't have to do it, therefore nobody does" is a 
questionable position.

> > There's more things you can do to speed it up if you want to go down that
> > rabbit hole (which the presentation does), and there's more work being
> > done in qemu.  (TCG was originally a performance hit but has improved
> > since, although it varies widely by platform and is its own rabbit hole. 
> > Also switching to gigabit NIC emulation with jumbo frames helped distcc a
> > lot.)
>
> Just saying people don't do distribution rebuilds for their desktop or
> server boxes unless they're Gentoo believers.

Linux From Scratch does not exist?  My friend Mark (who inherited a "Slackware 
for PowerPC" cross-build system) is in reality unemployed?  Nobody ever 
actually works _on_ Fedora and needs to do a development build?

It's interesting to see someone who can imply these things with a straight 
face on an embedded development list.

> So the need to consider
> this heavy duty stuff only exists at the distro.  In Fedora case, guys
> at Marvell are running it and have access to lots of fast physical
> hardware they hooked up to Koji (you touch on this in your PDF).  I
> don't think it's like they were waiting to hear about Qemu now they're
> gonna drop that and move to emulation.

You also seem to be unaware that QEMU was only started in 2003 (first commit to 
the repository, Feb 18, 2003), and didn't even work on x86 all that well until 
the end of 2005.  Decent arm support started showing up in 2006 but it was 
darn wonky, and the switch from dyngen to TCG didn't happen until Feb 1, 2008, 
before which you couldn't even build qemu with gcc 4.x:

  http://landley.net/qemu/2008-01-29.html#Feb_1,_2008_-_TCG

Therefore, they didn't "drop" support, QEMU wasn't ready for prime time back 
in 2006 when my then-boss (Manas Saksena) quit Timesys to go launch Fedora for 
Arm.  (The boss I had after that, David Mandala, is now in charge of Ubuntu 
Mobile.  Timesys had some darn impressive alumni, pity the company screwed up 
so badly none of us stayed around.  I myself stayed through four bosses, three 
CEOs, and outlasted 80% of my fellow engineers...)

By the way:

  http://fedoraproject.org/wiki/Architectures/ARM/HowToQemu

You continue to conflate orthogonal issues.

There is a REASON QEMU project hasn't shipped its 1.0 release yet.  Dismissing 
it as irrelevant to the future based on your experiences with it years ago is 
kind of hilarious, really.  (And dismissing emulation in general as of 
interest to nobody...  Sigh.)

> They're in the business of
> making fast ARM chips and they're going to outpace Qemu.

They're not in the same business.  They don't compete.  You don't deploy on 
qemu, and when you go down to Fry's to get a laptop the x86-64 is likely to 
continue to be the main option for the forseeable future.

> > But in general, Moore's Law says that qemu on current PC hardware is
> > about the speed of current PC hardware seven years ago.  (And obviously
> > nobody ever built anything before 2003. :)
>
> The speed surely depends on the architecture being emulated.  I did try
> Qemu on ARM on a nice desktop box here and it seemed unworkable to me.

You couldn't make it work, therefore it can't be made to work?

> I am perfectly happy to trust Fedora to take care of disribution
> rebuilds for me.

Good for you.

Did it ever occur to you that there are people out there who do the bits you 
don't personally do?  That all these packages don't emerge from zeus's 
forehead on a quarterly basis?  That someone, somewhere, is actually 
interested in how this stuff _does_ work?

> >> Newer ARM platforms like Cortex8+ and the Marvell Sheevaplug will
> >> outstrip emulated performance on a normal PC.  There are 2GHz multi-core
> >> ARMs coming as well apparently.  So I took the view I should ignore Qemu
> >> and get an early start on the true native build that will be the future
> >> of "native build" as opposed to cross due to that.
> >
> > Pages 24-34 of the above PDF go over this.  The first two pages are on
> > the advantages of native compiling on real hardware, the next eight pages
> > are on the disadvantages.  It can certainly be made to work, especially
> > in a large corporation willing to spend a lot of money on hardware as a
> > _prerequisite_ to choosing a deployment platform.
>
> This is what I have been calling "buildroot thinking" again.  What do
> you think you will be rebuilding exactly out of Fedora when you put it
> on an ARM11+ system?  Typically, it's going to be zero packages, nothing
> at all.  What you will need to build typically is this:

"All the world's a Cortex A8, and always will be."

Look, go have fun.  I'm sure what you've chosen to do is going to work just 
great for you, and you'll never need to care about anything else.  Personally, 
I no interest in speaking to you ever again about anything, and I have a spam 
filter for situations like this.

I'll even make you happy: "You win!"  There you go.

*plonk*

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
