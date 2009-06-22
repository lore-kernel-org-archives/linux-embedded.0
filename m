From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 22 Jun 2009 11:55:04 -0700
Message-ID: <4A3FD388.6040801@am.sony.com>
References: <4A33A7A2.1050608@gmail.com> <20090613155957.GA16220@shareable.org> <4A34A394.5040509@gmail.com> <20090621064040.GC1656@ucw.cz> <4A3E6F28.4090404@gmail.com> <20090621205245.GC3254@elf.ucw.cz> <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com> <20090622172003.GB21149@elf.ucw.cz> <4A3FBFF0.40006@am.sony.com> <20090622173704.GC21299@elf.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090622173704.GC21299@elf.ucw.cz>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Pavel Machek wrote:
> On Mon 2009-06-22 10:31:28, Tim Bird wrote:
>> Pavel Machek wrote:
>>> I did not see that in the changelog. If it is not general purpose
>>> filesystem, it is lot less interesting.
>> PRAMFS is not a general purpose filesystem. Please read
>> the introductory post to this thread, or look at
>> http://pramfs.sourceforge.net/ for more information.
> 
> Yeah, I seen that. It directly contradicts what you say.

Could you be more specific?  In what way does the
description on the website contradict what I said?

>> Since the purpose of PRAMFS is to provide a filesystem
>> that is persistent across kernel instantions, it is not
>> designed for high speed.  Robustness in the face of
>> kernel crashes or bugs is the highest priority, so
>> PRAMFS has significant overhead to make the window
>> of writability to the filesystem RAM as small as possible.
> 
> Really? So why don't you use well known, reliable fs like ext3?

Are you sure you read the web site?  It directly addresses this
question.  From the web site: "1. Disk-based filesystems such as
ext2/ext3 were designed for optimum performance on spinning disk
media, so they implement features such as block groups, which
attempts to group inode data into a contiguous set of data blocks
to minimize disk seeking when accessing files. For RAM there is
no such concern; a file's data blocks can be scattered throughout
the media with no access speed penalty at all. So block groups in a
filesystem mounted over RAM just adds unnecessary complexity. A
better approach is to use a filesystem specifically tailored to
RAM media which does away with these disk-based features. This
increases the efficient use of space on the media, i.e. more
space is dedicated to actual file data storage and less to
meta-data needed to maintain that file data."

>> This is not a file system one would do kernel compiles on.
>> This is where someone would keep a small amount of sensitive
>> data, or crash logs that one needed to preserve over kernel
>> invocations.
> 
> Really? Web page says:
> 
> #2. If the backing-store RAM is comparable in access speed to system
> #memory, there's really no point in caching the file I/O data in the
> #page cache. Better to move file data directly between the user buffers
> #and the backing store RAM, i.e. use direct I/O. This prevents the
> #unnecessary 
> 
> So you don't cache it "because its fast", and then it is 13MB/sec?

I'm not sure what you're quoting.  The paragraph you quoted doesn't
have the words "because its fast" [sic].  Speed is not a primary
consideration for this filesystem.  Due to the overhead of changing
the page flags, it's possible that using the page cache would
speed up overall access to this filesystem.  (This would depend on
the cost of changing the access flags, and the pattern of operations
on the filesystem.)  However, using the page cache would add
a level of indirection which would detract from the intended
robustness.

 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
