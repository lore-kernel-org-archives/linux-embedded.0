From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Fri, 22 Aug 2008 21:38:25 +0200
Message-ID: <200808222138.26927.arnd@arndb.de>
References: <48AD00F8.1030004@gmail.com> <200808221840.39206.arnd@arndb.de> <6934efce0808221037u4548dd00q9ccd67545bfbcc8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808221037u4548dd00q9ccd67545bfbcc8@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, carsteno@de.ibm.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>

On Friday 22 August 2008, you wrote:
> You mean to take this off list?

No, i replied to your mail that was sent just to me.
Putting everyone back on now

> > In 3, you create files with sysfs_create_file, and are fairly limited
> > with how you can use it. A structured file like you have in procfs
> > would not be allowed. File names are fixed, directory names can
> > be used to identify the mounted file systems. You can create symlinks
> > between your directory and other things in sysfs.
> 
> What do you mean a structured file wouldn't be allowed?  What's in them then?

sysfs files are meant to have just a single value. Some have a list of
values of the same type, but a file that needs a nontrivial parser
(even sscanf) is not allowed in sysfs, by convention.
There is also the technical limitation of the size to a single page,
which makes it hard to write variable size data.

> > In 4, you write a whole file system like debugfs (it's not as hard
> > as it sounds) and are free to do anything in there, but you can't
> > easily symlink to sysfs.
> 
> Argh.  No it might not be too bad to do to do, but it sounds like a
> maintenance hassle.  Sounds like the best option though.
> 
> Why did we decide debugfs is a bad fit?

It's basically the same as debugfs -- actually I once started a patch
to make it a single function call to instantiate a debugfs-like
file system, but I never finished that patch.

debugfs is a bad idea here because it is not meant for stable interfaces
but rather ad-hoc stuff. In a distribution kernel, debugfs is supposed
to be empty.

> > So where does a page show up in the profile if you have two identical
> > files and both are mapped?
> 
> In which ever file was actually read.  The kernel driver doesn't
> really know pages are redundant.

ok.

> > Will the kernel map them to the same page
> > but count the files separately, or will it show the same count for both?
> 
> I count faults on pages in mmap() so I don't really care whether a
> page is mapped twice or just once.  I'll count it every time you fault
> it even if it's the same physical page.  It's the image builders job
> to figure out if there are redundant pages.

ok, makes sense.

I think there is still another option, which would be to generalize
the profiling interface so it can work with arbitrary file systems.
I'm sure that other people can benefit from that as well, e.g. for
optimizing boot times on disks. For such a general interface,
a per-file ioctl would fit best, and then file systems can implement
it if they want, or it can be moved into VFS.

	Arnd <><
