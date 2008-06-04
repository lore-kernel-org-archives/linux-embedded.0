From: Rob Landley <rob@landley.net>
Subject: Re: initramfs size limitation
Date: Wed, 4 Jun 2008 12:24:38 -0500
Message-ID: <200806041224.39008.rob@landley.net>
References: <4841481E.8090406@cox.net> <200806031559.55526.rob@landley.net> <8bd0f97a0806031454g6d8fe57ahca942b2a81b737aa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0806031454g6d8fe57ahca942b2a81b737aa@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: pwilshire@cox.net, linux-embedded@vger.kernel.org

On Tuesday 03 June 2008 16:54:38 Mike Frysinger wrote:
> > but they just ripped out the old code
> > generator in favor of a new one
> > (See http://lists.gnu.org/archive/html/qemu-devel/2008-02/msg00011.html )
> > so there's not much point in going there right now.  (Hopefully they'll
> > have a 1.0 release within our lifetimes.)
>
> i'm aware the tcg stuff exists, but that's about it.  only hope for
> new ports atm is to contract a qemu guy.  not that the qemu guys would
> mind.  thanks for the link.

I have once again allowed myself to get buried in dayjob, but this one only 
lasts until the end of the month and _then_ I plan to get 
http://landley.net/qemu caught up to the present.

I'm the meantime, I'm still trying to extend my FWL scripts to create a cross 
compiler and bootable filesystem for every target qemu supports.  Mips 
regressed in 2.6.25 because they yanked out the specific qemu target 
(http://www.kernel.org/hg/index.cgi/linux-2.6/rev/79936) so I'm migrating the 
sucker to use a malta kernel .config, and then I can do a 0.4.0 release with 
the distcc trick working out of the box.

(QEMU remains a _marvelous_ toy for doing embedded development, to the point 
it's now kind of hard for me to take seriously a platform that doesn't have a 
decent emulator I can run on my laptop.)

> -mike

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
