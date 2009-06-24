From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Wed, 24 Jun 2009 18:47:00 +0100
Message-ID: <20090624174700.GI14121@shareable.org>
References: <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com> <20090622172003.GB21149@elf.ucw.cz> <4A3FBFF0.40006@am.sony.com> <20090622173704.GC21299@elf.ucw.cz> <4A3FC84A.6060608@gmail.com> <20090622204031.GA24236@elf.ucw.cz> <4A3FFC89.4070006@am.sony.com> <20090622215753.GA25434@elf.ucw.cz> <4A4119DB.4030203@gmail.com> <20090623182941.GA2045@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090623182941.GA2045@elf.ucw.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Marco <marco.stornelli@gmail.com>, Tim Bird <tim.bird@am.sony.com>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Pavel Machek wrote:
> On Tue 2009-06-23 20:07:23, Marco wrote:
> > You are talked about journaling. This schema works well for a disk, but
> > what about a piece of ram? What about a crazy kernel that write in that
> > area for a bug? Do you remember for example the e1000e bug? It's not
> 
> I believe you need both journaling *and* write protection. How do you
> handle power fault while writing data?

I think this is basically right.

write protection for the crazy kernels, and journalling for
powerfail/crash during updates.

Journalling can be extremely simple.  It can be just one memory block
at a fixed location, double-buffering all writes.

Pramfs already has checksums, which makes that easier.  You just write
to the buffer area first, with checksum, then write to the final area.
Mount looks at the buffer area, and if the checksum is fine, copies
the contents to the destination block.

That's all it takes to be resistant against power failures and crashes
during writes.  Probably <100 lines of code.

-- Jamie
