From: Rob Landley <rob@landley.net>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Sun, 27 Dec 2009 17:15:53 -0600
Message-ID: <200912271715.54249.rob@landley.net>
References: <4B29EC68.1040109@0xlab.org> <200912270117.18130.rob@landley.net> <4B372EEB.2000902@warmcat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B372EEB.2000902@warmcat.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andy Green <andy@warmcat.com>
Cc: celinux-dev@tree.celinuxforum.org, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On Sunday 27 December 2009 03:54:51 Andy Green wrote:
> On 12/27/09 07:17, Somebody in the thread at some point said:
>
> Hi Rob -

Before replying, I note that Mark Miller and I gave a presentation entitled 
"Developing for non-x86 targets using QEMU" Ohio LinuxFest in October.

  http://impactlinux.com/fwl/downloads/presentation.pdf
  http://impactlinux.com/fwl/presentation.html

There's even horribly mangled audio of our rushed 1 hour presentation.  (The 
slides are for a day-long course and we had 55 minutes to give a talk, so we 
skimmed like mad.  Unfortunately, the netbook they used for audio recording 
had the mother of all latency spikes whenever the cache flush did an actual 
flash erase and write, so there are regular audio dropouts the whole way 
through.)  Still, it's somewhere under:

  http://www.archive.org/details/OhioLinuxfest2009

I've also spent the last few years developing a project that produces native 
built environments for various QEMU targets and documents how to bootstrap 
various distros under them:

  http://impactlinux.com/fwl

So I do have some firsthand experience here.

> >> Fedora provides a whole solution there, with the restriction it's
> >> designed for native build, not cross.
> >
> > QEMU: it's not just for breakfast anymore.
>
> That's right Qemu often requires lunch, teatime and supper too to build
> anything :-)

Which is why you hook it up to distcc so it can call out to the cross 
compiler, which speeds up the build and lets you take advantage of SMP.  
(Pages 217-226 of the above PDF.)

That's also why my FWL project uses a statically linked version of busybox, 
because the static linking avoids the extra page retranslations on each exec 
and thus sped up the ./configure stage by 20%.  (Pages 235-236 of PDF.)

There's more things you can do to speed it up if you want to go down that 
rabbit hole (which the presentation does), and there's more work being done in 
qemu.  (TCG was originally a performance hit but has improved since, although 
it varies widely by platform and is its own rabbit hole.  Also switching to 
gigabit NIC emulation with jumbo frames helped distcc a lot.)

But in general, Moore's Law says that qemu on current PC hardware is about the 
speed of current PC hardware seven years ago.  (And obviously nobody ever 
built anything before 2003. :)

> Newer ARM platforms like Cortex8+ and the Marvell Sheevaplug will
> outstrip emulated performance on a normal PC.  There are 2GHz multi-core
> ARMs coming as well apparently.  So I took the view I should ignore Qemu
> and get an early start on the true native build that will be the future
> of "native build" as opposed to cross due to that.

Pages 24-34 of the above PDF go over this.  The first two pages are on the 
advantages of native compiling on real hardware, the next eight pages are on 
the disadvantages.  It can certainly be made to work, especially in a large 
corporation willing to spend a lot of money on hardware as a _prerequisite_ to 
choosing a deployment platform.

For hobbyists, small businesses, and open source developers in general, there 
are significant advantages to emulation.  (Page 208 comes to mind.)  And if you 
_are_ going to throw money at hardware, x86-64 continues to have better 
price/performance ratio, which was always its thing.

> The point of the distro is you just let them build the bulk of it, just
> installing binary packages.  You're only rebuilding the bits you are
> changing for your application.

Pages 68-71.  If your definition of embedded development is using off the shelf 
hardware and installing prebuilt binary packages into it, life becomes a lot 
easier, sure.

> For a lot of cases that's a few small
> app packages that are mainly linking against stuff from the distro and
> they're not too bad to do natively.

Pages 78-84

> (In addition my workflow is to edit
> on a host PC

Pages 178-180

> and use scripts to teleport a source tree tarball to the
> device where it's built as a package every time and installed together
> with its -devel,

Pages 181-202

> so everything is always under package control).

Package control or source control?  (Different page ranges...)

> -Andy

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
