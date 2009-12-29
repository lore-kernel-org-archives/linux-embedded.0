From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Tue, 29 Dec 2009 13:13:53 +0000
Message-ID: <20091229131353.GA5736@shareable.org>
References: <4B29EC68.1040109@0xlab.org> <200912202045.37159.rob@landley.net> <20091223022837.GE19806@shareable.org> <4B31D956.9020907@warmcat.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B31D956.9020907@warmcat.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Green <andy@warmcat.com>
Cc: Rob Landley <rob@landley.net>, celinux-dev@tree.celinuxforum.org, Matt Hsu <matt@0xlab.org>, linux-embedded@vger.kernel.org

Andy Green wrote:
> >No TCP/IP, no TFTP, not even BOOTP (but it's a nice bonus), no command
> >line interpreter (just a GPIO on board to boot into "unbrick me" mode
> >:-), and most strikingly _no_ flash driver for flash chip du jour.
> >
> >To flash it you send a kernel to boot from RAM which is capable of
> >flashing it.
> 
> Sorry I missed where this kernel appears from and the bootloader that 
> spawned it, since both could get trashed.

The kernel appeared from the network/serial/USB, as described.  It's
not on the device.  The point is you don't need a "spare" kernel for
unbrickability (and kernels are quite large); it's enough to be able
to send one in unbricking mode.

> That is actually a conundrum 
> on a lot of systems and some of the solutions (write-once backup 
> bootloader) in the long run lead to other issues.

I agree especially about the write-once backup bootloader.

> True SD Boot does truly deliver unbrickability if you are willing to 
> swap out or reformat the SD card.

With the disadvantage that you need the board space, connector cost
etc. for an SD card.  It's fine if you already have that.

I'd put it into a similar category to network/serial/USB: Using
whatever your board provides for bare-bones communication, bootstrap a
kernel for more advanced stuff involving fancier drivers.

> >>>http://wiki.openmoko.org/wiki/Qi
> >>
> >>Looking at the screen shot there, you've got code to parse ext2 
> >>filesystems.
> >>What is your definition of "minimal"?
> >
> >Ew, ext2 doesn't even satisfy powerfail-during-kernel-upgrade safety.
> 
> It's just misleading (but accurate).  ext2 is the "lowest common 
> denominator" read-only parsing that actually supports ext3 and ext4 if 
> you are careful about the formatting options.  So the actual filesystem 
> is ext3 or ext4 typically (ext3 in GTA02 case), it's not that the 
> bootloader is mandating specifically ext2.

If it reads an ext3/4 filesystem using an ext2 read-only parser, then
it will not be powerfail-safe.  Partially written files and directory
updates will look like corruption on boot.

It's essential that it parses the journal as well.  It does not have
to commit the journal (which would need device writing ability), but
in that case it must allow journal blocks to supercede blocks from
elsewhere in the filesystem.

> >It's possible to boot without parsing filesystems, but that is one
> >rather nice feature, and with the right filesystems it can make system
> >updates powerfail-safe.
> 
> Bootloader is tricky, but actually on this iMX31 device Fedora is used, 
> yum update keeps the last 3 kernels around and our kernel package 
> follows that.  So it's possible to have backup kernels automatically 
> integrated into the bootloader and packaging system.

It's useless to have 3 kernels around if the directory containing them
looks corrupted due to not parsing the journal. :-)  Then you won't see
any of the kernels at boot time.

-- Jamie
