From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Thu, 12 Jun 2008 08:55:52 +0100
Message-ID: <20080612075551.GA17891@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806111941.51221.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

Rob Landley wrote:
> Most packages don't cross compile at all.  Debian has somewhere north of 
> 30,000 packages.  Every project that does large scale cross compiling 
> (buildroot, gentoo embedded, timesys making fedora cross compile, etc) tends 
> to have about 200 packages that cross compile more or less easily, another 
> 400 or so that can be made to cross compile with _lot_ of effort and a large 
> enough rock, and then the project stalls at about that size.

+1.

I spent several months fixing up cross-compile issues on Gentoo
Embedded a few years ago, for a specific application - only a small
subset of packages needed.  The majority of packages I needed failed
to compile out of the box, one way or another - Glibc dependencies,
arch dependencies, scripts which depend on the host environment, or
invoke the host compiler, or the host Perl (and then depend on it's
byte order). etc.

More recently, I've been compiling a build which is _intended_ for
cross-compilation - it's an old uClinux kit, patched by a third party.
Even that fails to build on newer GNU/Linuxes, as the syntax of GNU
Make has changed, and Bash has changed.  Also GCC 2.old doesn't
compile on current GNU/Linux with GCC 4.new.

Fortunately the latter were a few small, easy to fix issues.  But I
understand now why some find it important to have a replicatable build
environment when you need to get an old distribution out of the closet
to update firmware for some 5 year old device.

Virtual machines ought to be great for that.  They are.  But even
those are surprisingly changable - images that worked on a VM a few
years ago no longer work on the current version of the VM host.

-- Jamie
