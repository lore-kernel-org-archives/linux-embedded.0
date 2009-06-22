From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Tue, 23 Jun 2009 00:38:55 +0200
Message-ID: <20090622223855.GA25996@elf.ucw.cz>
References: <4A3E6F28.4090404@gmail.com> <20090621205245.GC3254@elf.ucw.cz> <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com> <20090622172003.GB21149@elf.ucw.cz> <4A3FBFF0.40006@am.sony.com> <20090622173704.GC21299@elf.ucw.cz> <4A3FC84A.6060608@gmail.com> <20090622204031.GA24236@elf.ucw.cz> <4A3FFC89.4070006@am.sony.com> <20090622215753.GA25434@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090622215753.GA25434@elf.ucw.cz>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Marco <marco.stornelli@gmail.com>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Mon 2009-06-22 23:57:53, Pavel Machek wrote:
> On Mon 2009-06-22 14:50:01, Tim Bird wrote:
> > Pavel Machek wrote:
> > >> block of fast non-volatile RAM that need to access data on it using a
> > >> standard filesytem interface."
> > > 
> > > Turns a block of fast RAM into 13MB/sec disk. Hmm. I believe you are
> > > better with ext2.
> > 
> > Not if you want the RAM-based filesystem to persist over a kernel
> > invocation.
> 
> Yes, you'll need to code Persistent, RAM-based _block_device_. 

More politely said: "I believe you would be better off modifying
ramdisk to include the functionality for persistence."  New filesystem
should not really be neccessary. ext2 for performance, ext3 if you
need robustness from journalling, maybe something else makes sense,
too.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
