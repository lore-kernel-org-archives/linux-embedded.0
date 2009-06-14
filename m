From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Sun, 14 Jun 2009 09:15:32 +0200
Message-ID: <4A34A394.5040509@gmail.com>
References: <4A33A7A2.1050608@gmail.com> <20090613155957.GA16220@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=lK9uhPClnP9lUzO5WfTXW4fyWpCw3+m0SXwxIMjZ/1Q=;
        b=fv0go3bIE9clYwW7pNjL+lhdOQEeobwQuOczPH+3IrDqvz3Gop4eunhTUDbw8k+lut
         JlABTvqzSppo+YAhQn2htk2xQf2daAm2ulDFwZBqbN3goJej2K0NVvoOcDqgf7bb/2qm
         kiiimMgTCvNCGQ4/3LW40eHXs3jtUerOwCqXY=
In-Reply-To: <20090613155957.GA16220@shareable.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>


Jamie Lokier wrote:
> Marco wrote:
>> Linux traditionally had no support for a persistent, non-volatile
>> RAM-based filesystem, persistent meaning the filesystem survives a
>> system reboot or power cycle intact. The RAM-based filesystems such as
>> tmpfs and ramfs have no actual backing store but exist entirely in the
>> page and buffer caches, hence the filesystem disappears after a system
>> reboot or power cycle.
> 
> Why is a ramdisk not sufficient for this?
> 

Simply because the ramdisk was not designed to work in a persistent
environment. In addition this kind of filesystem has been designed to
work not only with classic ram. You can think at the situation where you
have got an external SRAM with a battery for example. With it you can
"remap" in an easy way the SRAM. Moreover there's the issue of memory
protection that this filesystem takes care.

> Why is an entire filesystem needed, instead of simply a block driver
> if the ramdisk driver cannot be used?
> 

From documentation:

"A relatively straight-forward solution is to write a simple block
driver for the non-volatile RAM, and mount over it any disk-based
filesystem such as ext2/ext3, reiserfs, etc.

But the disk-based fs over non-volatile RAM block driver approach has
some drawbacks:

1. Disk-based filesystems such as ext2/ext3 were designed for optimum
   performance on spinning disk media, so they implement features such
   as block groups, which attempts to group inode data into a contiguous
   set of data blocks to minimize disk seeking when accessing files. For
   RAM there is no such concern; a file's data blocks can be scattered
   throughout the media with no access speed penalty at all. So block
   groups in a filesystem mounted over RAM just adds unnecessary
   complexity. A better approach is to use a filesystem specifically
   tailored to RAM media which does away with these disk-based features.
   This increases the efficient use of space on the media, i.e. more
   space is dedicated to actual file data storage and less to meta-data
   needed to maintain that file data.

2. If the backing-store RAM is comparable in access speed to system memory,
   there's really no point in caching the file I/O data in the page
   cache. Better to move file data directly between the user buffers
   and the backing store RAM, i.e. use direct I/O. This prevents the
   unnecessary populating of the page cache with dirty pages. However
   direct I/O has to be enabled at every file open. To enable direct
   I/O at all times for all regular files requires either that
   applications be modified to include the O_DIRECT flag on all file
   opens, or that a new filesystem be used that always performs direct
   I/O by default."

On this point I'd like to hear other embedded guys.

> It just struck me as a lot of code which might be completely
> unnecessary for the desired functionality.
> 
> -- Jamie
> 




