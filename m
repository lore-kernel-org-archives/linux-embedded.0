From: Jamie Lokier <jamie@shareable.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 11:49:18 +0100
Message-ID: <20080616104917.GA18857@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806131106.18487.neundorf@eit.uni-kl.de> <1213348320.26255.231.camel@pmac.infradead.org> <200806131132.55543.neundorf@eit.uni-kl.de> <20080613152854.GM11760@nibiru.local> <20080614003102.GB30652@shareable.org> <20080616042310.GH12962@nibiru.local>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080616042310.GH12962@nibiru.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enrico Weigelt <weigelt@metux.de>
Cc: linux-embedded@vger.kernel.org

Enrico Weigelt wrote:
> Most times I've seen those checks, they silently enable some 
> features, eg. if it looks for certain kernel devices. Definitively
> the wrong way!

Agreed.  Though, you do often have to check for headers etc.,
otherwise you won't have the definitions needed to work with those
devices.  (Think: inotify).

> It really should be in users/packagers control to
> explicitly enable features.

But then there's a problem with 100 or more --enable-foo command line
options.  The user's script will _calls_ ./configure will
bitrot... there's no way you'll be typing it on the command line.

A big package can easily depend on that many local features.

> Nevertheless, the existence of some file or device says nothing
> about whether it will be usable (or *should* be used) at
> runtime. I've seen packages silently enabling some feature and then
> failing at runtime since the previously detected device is missing
> later. What a nightamare for packagers.

I agree, assume they're all there is not sane.

> Another point are broken syscalls. Well, you *have* check at runtime 
> to be sure, or perhaps choose to ignore it and expect a sane system.

That said, to use rsync as an example.  It uses the utimes() system
call when available, and utime() otherwise, because the former is
better.

On current GNU/Linux it will use utimes().  Recently someone tried to
run it on an old kernel, and it failed.  If it tried utimes() first
then fell back to utime(), it was fine, and rsync has a patch to do
that now.

But here's the thing: do you really want every package have code
calling every different variation on a system call, at run time, until
it finds one that works?

-- Jamie
