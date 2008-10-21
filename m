From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: Subject: [PATCH 00/16] Squashfs: compressed	read-only	filesystem
Date: Wed, 22 Oct 2008 00:42:33 +0100
Message-ID: <48FE68E9.2020401@lougher.demon.co.uk>
References: <E1KqrTW-0001x8-3h@dylan>	 <1224268027.18940.78.camel@moss-terrapins.epoch.ncsc.mil>	 <48FD2C74.2070608@lougher.demon.co.uk> <1224605348.31157.67.camel@moss-terrapins.epoch.ncsc.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1224605348.31157.67.camel@moss-terrapins.epoch.ncsc.mil>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "David P. Quigley" <dpquigl@tycho.nsa.gov>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

David P. Quigley wrote:

> 
> Looking through the code I noticed that you give certain object types
> the same inode number for all instances of it (devices, fifo/sockets).
> How is this done internally? Do these types of objects occupy the same
> position on the inode table? If so how do you differentiate between a
> device and a socket?
> 

No, devices and fifo/sockets get their own unique inode numbers:

root@slackware:/mnt# mount -t squashfs test.sqsh /mnt2 -o loop
root@slackware:/mnt# ls -li /mnt2
total 0
2 crw-r--r-- 1 root root 1, 1 2008-10-22 00:31 device
4 prw-r--r-- 1 root root    0 2008-10-22 00:31 fifo
3 srwxr-xr-x 1 root root    0 2008-10-17 16:25 socket

struct squashfs_ipc_inode {
         __le16                  inode_type;
         __le16                  mode;
         __le16                  uid;
         __le16                  guid;
         __le32                  mtime;
         __le32                  inode_number;
         __le32                  nlink;
};

struct squashfs_dev_inode {
         __le16                  inode_type;
         __le16                  mode;
         __le16                  uid;
         __le16                  guid;
         __le32                  mtime;
         __le32                  inode_number;
         __le32                  nlink;
         __le32                  rdev;
};


> I use to work on Unionfs and we used CVS initially for our SCM. When we
> started working on mainlining Unionfs we moved over to a GIT based
> system and we found it worked a lot better. You might want to consider
> moving your patches to a GIT tree that you make publically available so
> people can just clone, compile, and test them. I don't see anything that
> stops Squashfs from being compiled and loaded as a module so it might
> not be necessary but it makes it easier for people who want to test the
> code or even contribute patches.


Yeah, Git is much better than CVS, however, I've got nowhere to host a 
public Git repository.  If someone were to offer hosting I'd be only too 
happy to move over to Git.

Phillip
