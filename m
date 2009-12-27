From: Rob Landley <rob@landley.net>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Sun, 27 Dec 2009 01:27:34 -0600
Message-ID: <200912270127.35414.rob@landley.net>
References: <20091221193038.38CB63F6EF@gemini.denx.de> <20091223085607.GE22533@pengutronix.de> <4B31E2F2.4010206@warmcat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B31E2F2.4010206@warmcat.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: celinux-dev@tree.celinuxforum.org
Cc: Andy Green <andy@warmcat.com>, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On Wednesday 23 December 2009 03:29:22 Andy Green wrote:
> On 12/23/09 08:56, Somebody in the thread at some point said:
>
> Hi -
>
> >> yourself because it's the buildroot mindset, that whole task
> >> disappears  with a distro basis.
> >
> > If you don't step into for example toolchain problems or other crazy
> > things...
>
> Again this is buildroot thinking.  The distro provides both the native
> and cross toolchains for you.  You're going to want to use the same
> distro as you normally use on your box so the cross toolchain installs
> as a package there.

Because boards that use things like uClibc and busybox just aren't interesting 
to you?

Please don't confuse "development environment" with "build environment".  A 
development environment has xterms and IDEs and visual diff tools and a web 
browser and PDF viewer and so on.  A build environment just compiles stuff to 
produce executables.  (Even on x86, your fire breathing SMP build server in the 
back room isn't necessarily something you're going to VNC into and boot a 
desktop on.)

I agree it's nice to have a build environment compatible with your deployment 
environment, and distros certainly have their advantages, but you may not want 
to actually _deploy_ 48 megabytes of /var/lib/apt from Ubuntu in an embedded 
device.

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
