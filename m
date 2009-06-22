From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 22 Jun 2009 19:20:04 +0200
Message-ID: <20090622172003.GB21149@elf.ucw.cz>
References: <4A33A7A2.1050608@gmail.com> <20090613155957.GA16220@shareable.org> <4A34A394.5040509@gmail.com> <20090621064040.GC1656@ucw.cz> <4A3E6F28.4090404@gmail.com> <20090621205245.GC3254@elf.ucw.cz> <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

> > How do you handle hard-links, then?
> 
> Indeed hard-links are not supported :) Due to the design of this fs
> there are some limitations explained in the documentation as not
> hard-link, only private memory mapping and so on. However this
> limitations don't limit the fs itself because you must consider the
> special goal of this fs.

I did not see that in the changelog. If it is not general purpose
filesystem, it is lot less interesting.

> >> >From performance point of view:
> >>
> >> Sometimes ago I uploaded here (http://elinux.org/Pram_Fs) some benchmark
> >> results to compare the performance with and without XIP in a real
> >> embedded environment with bonnie++. You could use it as reference point.
> >
> > Well, so XIP helps. ext2 can do XIP too, IIRC. Is your performance
> > better than ext2?
> >
> > Wait... those numbers you pointed me... claim to be as slow as
> > 13MB/sec. That's very very bad. My harddrive is faster than that.
> 
> As I said I did the test in a real embedded environment so to have
> comparable result you should use the same environmente with the same
> tools, with the same workload and so on.

Even on real embedded hardware you should get better than 13MB/sec
writing to _RAM_. I guess something is seriously wrong with pramfs.

								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
