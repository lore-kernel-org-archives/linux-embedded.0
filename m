From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 06:57:15 +0200
Message-ID: <20080616045715.GC32139@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806122025.54791.rob@landley.net> <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com> <200806130830.52734.neundorf@eit.uni-kl.de> <20080613185157.GT13599@pengutronix.de> <20080613222523.GA28805@shareable.org>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613222523.GA28805@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

* Jamie Lokier <jamie@shareable.org> schrieb:

> A trouble with that is some packages have hundreds of user-selectable
> options - or even thousands.  It is unfeasible to use --enable-foo
> options for all of those when configuring then.

Well, not that much ;-o
But taking care of such feature switches is the job of an automated
distro builder tool, including things like dependency tracking.
Actually, I'm really too lazy for doing those stuff by hand ;-P

But you're right, some packages have too many optional features, 
which better should be their own packages, and there's sometimes
much code out there which should be reused ...

> Some other packages _should_ have more options, but don't because it's
> too unwieldy to make them highly configurable with Autoconf.  

Adding new feature switches w/ autoconf is almost trivial
(well, not completely ;-o)

> Imho, Kconfig would be good for more programs than it's currently used for,
> and could be made to work with those --enable/--with options: you'd be
> able to configure them entirely on the command line, or interactively
> with "./configure --menu" (runs menuconfig), or with a config file.

Yes, that would be fine. But for me the primary constraint is that
all switches/options can be specified by command line - otherwise
I'd need extra complexity for each package in my distbuilder tool.

> Perhaps it might even be possible to write a very small, portable,
> specialised alternative to Make which is small enough to ship with
> packages that use it?

No, I really wouldn't advise this. Make tools are, IMHO, part of 
the toolchain (in a wider sense). Once point is avoiding code 
duplication, but the really important one is: a central point of
adaption/configuration. That's eg. why I like pkg-config so much:
if I need some tweaking, I just pass my own command (or a wrapper).
If each package does it's library lookup completely by itself, I
also need to touch each single package in case I need some tweaks.
I had exactly that trouble w/ lots of packages, before I ported
them to pkg-config.


cu
-- 
---------------------------------------------------------------------
 Enrico Weigelt    ==   metux IT service - http://www.metux.de/
---------------------------------------------------------------------
 Please visit the OpenSource QM Taskforce:
 	http://wiki.metux.de/public/OpenSource_QM_Taskforce
 Patches / Fixes for a lot dozens of packages in dozens of versions:
	http://patches.metux.de/
---------------------------------------------------------------------
