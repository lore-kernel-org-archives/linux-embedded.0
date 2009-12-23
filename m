From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,
	lightweight bootloader
Date: Wed, 23 Dec 2009 09:56:07 +0100
Message-ID: <20091223085607.GE22533@pengutronix.de>
References: <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com> <20091221213829.1A8B93F6EF@gemini.denx.de> <4B2FF8E7.505@warmcat.com> <20091221231922.GO22533@pengutronix.de> <4B3081C3.3000909@warmcat.com> <20091222111250.GW22533@pengutronix.de> <4B3146E9.3010101@warmcat.com> <20091222232804.GB22533@pengutronix.de> <4B31D6F0.2040009@warmcat.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B31D6F0.2040009@warmcat.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Green <andy@warmcat.com>
Cc: Wolfgang Denk <wd@denx.de>, celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

On Wed, Dec 23, 2009 at 08:38:08AM +0000, Andy Green wrote:
> I don't know or care when I get the binary packages from a repo where
> they're already built. The whole point of a distro solution is someone
> did all the work for you. You're only thinking about mass rebuild
> yourself because it's the buildroot mindset, that whole task
> disappears  with a distro basis.

If you don't step into for example toolchain problems or other crazy
things...

> You can emulate "issue 6 monthly rootfs tarball updates" by just
> updating the stable package repo at long intervals with well-tested
> packagesets. At the same time you can offer other repos with newer
> features earlier, get changed packages tested easier, confirm
> patchlevel on test systems, etc.

Yes, that's a valuable option.

> I take your point but actually there's no reason the *bootloader*
> needs that when the bootloader is focussed solely on booting Linux.
> *Linux* might want an equipment list from the board, but then
> typically you would build all the drivers and they can simply probe
> and fail if its not there on the board.

The oftree is currently provided by the bootloader, and much of what it
contains is unprobable peripherals, i.e. the IP cores in the SoC cpus.
For example for i.MX (which we happen to maintain in the mainline),
there is a strong aim for having one kernel that runs on as many devices
as possible. If you want to do this and if you can't probe significant
parts of the hardware, you need an instance outside of the kernel who
tells you what's actually there.

> I'm not sure I managed to give the flavour of a bunch of hardware guys
> half a world away rotating in and out on Military service. Even
> patches internally aren't happening, Mainline isn't an answer.

Well, there are many projects out there which are not so secret that one
cannot expose the kernel drivers. And even if they are, it is possible
to establish a peer-review culture inside of a corporation. But you
won't get the full power of community review. That's the trade off one
has to accept for having secrets :-) But quality is generally a big
issue.

> > > bus driver back into the bootloader. But actually, normal
> > > customers don't care about 200ms on boot either way. They can get
> > > the thing to market quicker and so cheaper and more reliably
> > > without that stuff in the bootloader.
> >
> > That's a matter of the definition of "normal customers" :-)
>
> What I mean by it is for geeks like us, it's interesting to see how
> fast it will go. The actual customer cannot tell 200ms by eye he will
> accept it if it's not passing his threshold of being "too slow". But
> he will like getting it shipping earlier because the bootloader is
> almost invisible in dev effort and in management of production.

We have customers who care about "splash in 0.5 s" vs. "shell runs after
3 s, then qt starts". People may be used to that kind of noticable boot
time in the phone business, but in the industry (where embedded Linux
boxes are even more "devices" than computers) they often are not.

Do you remember the times when we had analog TV? We could zap through 5
channels in under 3 seconds. *That's* performance :-) My sattelite
receiver needs about 10 seconds to boot. Sometimes it feels like
innovation goes backwards.

Cheers,
rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
