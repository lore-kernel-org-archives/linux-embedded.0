From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,	lightweight
 bootloader
Date: Wed, 23 Dec 2009 08:38:08 +0000
Message-ID: <4B31D6F0.2040009@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com> <20091221213829.1A8B93F6EF@gemini.denx.de> <4B2FF8E7.505@warmcat.com> <20091221231922.GO22533@pengutronix.de> <4B3081C3.3000909@warmcat.com> <20091222111250.GW22533@pengutronix.de> <4B3146E9.3010101@warmcat.com> <20091222232804.GB22533@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=TpMVApf2MVCIBSjtBf/kK2dOWOo2G6dB41oNCiEIu6E=;
        b=rls0P66aTFlfCAxiEqNIr/BoApLJY6fheB0evLs7/8S1Vg3DVrzr1KYVuonPZmZjRh
         htekAzjuiu4/g2RfwpkKXhGlWCCO/WEhGbankFSnXzYrO7dfJ6PhkrFQ6Ig5qAjUy65L
         QFwqa3+2xEOi4pbcWL5ffi4zfaY0+deYVCCLM=
In-Reply-To: <20091222232804.GB22533@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Wolfgang Denk <wd@denx.de>, celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

On 12/22/09 23:28, Somebody in the thread at some point said:

Hi -

>> Fedora provides a whole solution there, with the restriction it's
>> designed for native build, not cross.
>
> That's probably also a matter of taste. I still find it a feature to be

The two ways have different advantages and disadvantages.  Cross gives 
you speed of rebuild, but 99% of packages on an ARM11+ type system you 
actually have no interest in rebuilding since you just use the stock 
versions.  Cross can be extremely painful with projects that are not set 
up for it, eg, perl.  Native build gives you compatibility of build with 
the whole package universe.  The slow build action doesn't hurt so much 
because -->

> able to cross compile the systems - we can still recompile whole systems
> consistently in just a few (ten) minutes, i.e. in order to change a
> central switch (like softfloat vs. hardfloat, use another toolchain
> etc). Out of interest, how long does it take to recompile Fedora on for
> example MX31?

I don't know or care when I get the binary packages from a repo where 
they're already built.  The whole point of a distro solution is someone 
did all the work for you.  You're only thinking about mass rebuild 
yourself because it's the buildroot mindset, that whole task disappears 
with a distro basis.

>> Packages only help any QA effort. You don't have to release every
>> package build to your stable repo, a staged development / testing /
>> stable repo scheme is simple.
>
> For let's say a telematics box it's almost impossible to test packet
> combinations. All you can do is decide for "update application" and
> "update platform". If you got your software updates via SMS, it
> shouldn't go wrong because of an untested packet combination :-)

You missed my point I think.  You can emulate "issue 6 monthly rootfs 
tarball updates" by just updating the stable package repo at long 
intervals with well-tested packagesets.  At the same time you can offer 
other repos with newer features earlier, get changed packages tested 
easier, confirm patchlevel on test systems, etc.

>> Right. Fedora is different though, there are no cross-built packages
>> (although they do provide cross compilers, I use them for kernel and
>> Qi builds) and if storage is sufficient, there's no need to strip
>> anything out. Just nobble init.
>
> Hmm, I'm still not convinced. But as I don't have any data, I'll keep
> quiet :-)

You can get data easily enough, use the Fedora tarball and run with 
init=/bin/bash as a starting point.  Then write a script that does the 
minimal jobs like bringup lo, remount rw, config ethernet and service 
sshd start and time that as init.

The point is you're definitively bypassing the *whole* of Fedora bringup 
that way while still getting the advantages of the Fedora rootfs basis 
and most of sysv service management.

> I think a central question is if you want to optimize things like
>
> * early boot splash
> * footprint

Early boot splash is a kernel matter, it has facilities for it already. 
  For footprint, you can't play this game if you don't have say 200MB 
spare as already told it's the cost of entry.

But if you can play the distro game (combined with leaving the 
bootloader alone to only boot Linux) the software engineering and 
maintainence load for a really capable rootfs dwindles to about the same 
level of job as maintaining a Linux server box, and quality goes up.

>> Well for my uses of it I have been able to specify that we should have
>> versioning GPIOs on the boards. It's a good idea anyway.
>
> Hardware description is still one of the unsolved problems out there. It
...
> need the schematics in machine readable form... When oftree comes into
> the ARM world, we need a maximum-style bootloader which can provide
> oftrees.

I take your point but actually there's no reason the *bootloader* needs 
that when the bootloader is focussed solely on booting Linux.  *Linux* 
might want an equipment list from the board, but then typically you 
would build all the drivers and they can simply probe and fail if its 
not there on the board.

>> It's nothing to do with mainline, just intra-company communication and
>> management failure.
>
> My experience is that mainline exposure of that perverted bit-twiddling
> code and ideas helps finding sane solutions, because someone will
> allways ask the right questions :-)

I'm not sure I managed to give the flavour of a bunch of hardware guys 
half a world away rotating in and out on Military service.  Even patches 
internally aren't happening, Mainline isn't an answer.

>>> Unfortunately, often people want to boot as fast as possible, which
>>> requires optimization in that area as well. We recently had a board
>>> which refused to boot without the PMIC having switched on some
>>> voltages which are default-off.
>>
>> If your device is able to run from USB power, there's the issue that
>> you are limited to 100mA before enumeration takes place. So without a
>> USB stack, you have to trade speed for power anyway.
>
> My argument is that there are all these different requirements out
> there: your use cases, mine, others. What we want to do with barebox is

Sure, Qi targets ARM9+ with steppingstone.  If you have something else 
you will have to use something else or port it.

If it's not understood what the advantages are of Qi's strict rejection 
of its list of evil things, then they will likely go with U-Boot I guess 
since it has the mindshare.

>> bus driver back into the bootloader. But actually, normal customers
>> don't care about 200ms on boot either way. They can get the thing to
>> market quicker and so cheaper and more reliably without that stuff in
>> the bootloader.
>
> That's a matter of the definition of "normal customers" :-)

What I mean by it is for geeks like us, it's interesting to see how fast 
it will go.  The actual customer cannot tell 200ms by eye he will accept 
it if it's not passing his threshold of being "too slow".  But he will 
like getting it shipping earlier because the bootloader is almost 
invisible in dev effort and in management of production.

> distributions, where people can just 'apt-get install kde'. All our
> recent experiments seem to suggest that mainstream distros are not able
> to do what we need today, but times may change.

Well it sounds like you didn't try Fedora which should be high on the 
list.  But if "what you need" doesn't match I guess you won't have a 
good time there no matter how great it is.

> However, I found the discussion pretty interesting! Thanks a lot, it
> gave me some interesting insights.

You're welcome, we even mentioned Qi occasionally :-)

-Andy
