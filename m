From: "David P. Quigley" <dpquigl@tycho.nsa.gov>
Subject: Re: Subject: [PATCH 00/16] Squashfs:
	compressed	read-only	filesystem
Date: Tue, 21 Oct 2008 19:36:59 -0400
Message-ID: <1224632219.31157.91.camel@moss-terrapins.epoch.ncsc.mil>
References: <E1KqrTW-0001x8-3h@dylan>
	 <1224268027.18940.78.camel@moss-terrapins.epoch.ncsc.mil>
	 <48FD2C74.2070608@lougher.demon.co.uk>
	 <1224605348.31157.67.camel@moss-terrapins.epoch.ncsc.mil>
	 <48FE68E9.2020401@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <48FE68E9.2020401@lougher.demon.co.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

On Wed, 2008-10-22 at 00:42 +0100, Phillip Lougher wrote:
> David P. Quigley wrote:
> 
> > 
> > Looking through the code I noticed that you give certain object types
> > the same inode number for all instances of it (devices, fifo/sockets).
> > How is this done internally? Do these types of objects occupy the same
> > position on the inode table? If so how do you differentiate between a
> > device and a socket?
> > 
> 
> No, devices and fifo/sockets get their own unique inode numbers:
> 
> root@slackware:/mnt# mount -t squashfs test.sqsh /mnt2 -o loop
> root@slackware:/mnt# ls -li /mnt2
> total 0
> 2 crw-r--r-- 1 root root 1, 1 2008-10-22 00:31 device
> 4 prw-r--r-- 1 root root    0 2008-10-22 00:31 fifo
> 3 srwxr-xr-x 1 root root    0 2008-10-17 16:25 socket
[Snip]
	My mistake I misread your statement in email 0. You said that squashfs
has real inode numbers and that cramfs didn't. Good luck with your
mainlining attempt. Once you get xattr support this would definitely
make life better for people who want to make SELinux enabled LiveCDs and
other small devices.

Dave

