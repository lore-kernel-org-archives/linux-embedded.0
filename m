From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Wed, 24 Jun 2009 18:41:40 +0100
Message-ID: <20090624174140.GH14121@shareable.org>
References: <4A33A7A2.1050608@gmail.com> <20090613155957.GA16220@shareable.org> <4A34A394.5040509@gmail.com> <20090614114613.GC9514@shareable.org> <4A351FA9.1090808@gmail.com> <20090616150750.GF29040@shareable.org> <4A37EF4A.1080006@gmail.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A37EF4A.1080006@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco <marco.stornelli@gmail.com>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Marco wrote:
> > Second question: what happens if the system crashing _during_ a write
> > to a file.  Does it mean that file will fail it's checksum when it's
> > read at the next boot?
> > 
> > Maybe files aren't so important.  What about when you write a file,
> > and then rename it over an existing file to replace it.  (E.g. a
> > config file), and the system crashes _during_ the rename?  At the next
> > boot, is it guaranteed to see either the old or the new file, or can
> > the directory be corrupt / fail it's checksum?
> 
> First of all I have to explain better the current policy: the checksum
> works at inode and superblock level and currently there isn't a recovery
> function as the journaling. About the superblock it's easy to use a
> redundant policy to be more robust.

To be honest, superblock robustness is less of a concern.  The real
concern is losing file or directory contents, so it can't be used to
store persistent configuration data, only debugging logs.

> About the inode, at the moment when the checksum doesn't match the
> inode it's marked as bad calling the function make_bad_inode().

Let's see if I understand right.

If it lose power when writing to a file, after boot the file is likely
to be marked bad and so return -EIO instead of any file contents?

If it loses power when doing atomic rename (to replace config files,
for example), it's likely that the whole /pramfs/configs/ directory
will be corrupt, because the rename is writing to the directory inode,
so you lose access to all names in that directory?

That sounds like it can't be used for persistent configuration data.

If a directory is marked as bad, or a file-inode in it is marked bad,
can you even rmdir it to clean up and start again?

Thanks,
-- Jamie
