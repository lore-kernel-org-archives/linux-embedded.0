From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 22 Jun 2009 22:40:32 +0200
Message-ID: <20090622204031.GA24236@elf.ucw.cz>
References: <20090613155957.GA16220@shareable.org> <4A34A394.5040509@gmail.com> <20090621064040.GC1656@ucw.cz> <4A3E6F28.4090404@gmail.com> <20090621205245.GC3254@elf.ucw.cz> <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com> <20090622172003.GB21149@elf.ucw.cz> <4A3FBFF0.40006@am.sony.com> <20090622173704.GC21299@elf.ucw.cz> <4A3FC84A.6060608@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A3FC84A.6060608@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco <marco.stornelli@gmail.com>
Cc: Tim Bird <tim.bird@am.sony.com>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Mon 2009-06-22 20:07:06, Marco wrote:
> Pavel Machek wrote:
> > On Mon 2009-06-22 10:31:28, Tim Bird wrote:
> >> Pavel Machek wrote:
> >>>>> How do you handle hard-links, then?
> >>>> Indeed hard-links are not supported :) Due to the design of this fs
> >>>> there are some limitations explained in the documentation as not
> >>>> hard-link, only private memory mapping and so on. However this
> >>>> limitations don't limit the fs itself because you must consider the
> >>>> special goal of this fs.
> >>> I did not see that in the changelog. If it is not general purpose
> >>> filesystem, it is lot less interesting.
> >> PRAMFS is not a general purpose filesystem. Please read
> >> the introductory post to this thread, or look at
> >> http://pramfs.sourceforge.net/ for more information.
> > 
> > Yeah, I seen that. It directly contradicts what you say.
> > 
> 
> I don't think, I think it's very clear:
> 
> "In summary, PRAMFS is a light-weight, full-featured, and
> space-efficient special filesystem that is ideal for systems with a

Except that it is not full-featured. No hardlinks. (What about ACLs, etc?)

> block of fast non-volatile RAM that need to access data on it using a
> standard filesytem interface."

Turns a block of fast RAM into 13MB/sec disk. Hmm. I believe you are
better with ext2.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
