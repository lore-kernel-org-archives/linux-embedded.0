From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 22 Jun 2009 19:37:04 +0200
Message-ID: <20090622173704.GC21299@elf.ucw.cz>
References: <4A33A7A2.1050608@gmail.com> <20090613155957.GA16220@shareable.org> <4A34A394.5040509@gmail.com> <20090621064040.GC1656@ucw.cz> <4A3E6F28.4090404@gmail.com> <20090621205245.GC3254@elf.ucw.cz> <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com> <20090622172003.GB21149@elf.ucw.cz> <4A3FBFF0.40006@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A3FBFF0.40006@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Mon 2009-06-22 10:31:28, Tim Bird wrote:
> Pavel Machek wrote:
> >>> How do you handle hard-links, then?
> >> Indeed hard-links are not supported :) Due to the design of this fs
> >> there are some limitations explained in the documentation as not
> >> hard-link, only private memory mapping and so on. However this
> >> limitations don't limit the fs itself because you must consider the
> >> special goal of this fs.
> > 
> > I did not see that in the changelog. If it is not general purpose
> > filesystem, it is lot less interesting.
> 
> PRAMFS is not a general purpose filesystem. Please read
> the introductory post to this thread, or look at
> http://pramfs.sourceforge.net/ for more information.

Yeah, I seen that. It directly contradicts what you say.

> Since the purpose of PRAMFS is to provide a filesystem
> that is persistent across kernel instantions, it is not
> designed for high speed.  Robustness in the face of
> kernel crashes or bugs is the highest priority, so
> PRAMFS has significant overhead to make the window
> of writability to the filesystem RAM as small as possible.

Really? So why don't you use well known, reliable fs like ext3?

> This is not a file system one would do kernel compiles on.
> This is where someone would keep a small amount of sensitive
> data, or crash logs that one needed to preserve over kernel
> invocations.

Really? Web page says:

#2. If the backing-store RAM is comparable in access speed to system
#memory, there's really no point in caching the file I/O data in the
#page cache. Better to move file data directly between the user buffers
#and the backing store RAM, i.e. use direct I/O. This prevents the
#unnecessary 

So you don't cache it "because its fast", and then it is 13MB/sec?

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
