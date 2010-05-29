From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] detour TTY driver
Date: Sat, 29 May 2010 23:59:08 +0100
Message-ID: <20100529225908.GQ31073@ZenIV.linux.org.uk>
References: <1273918658.2341.17.camel@itpsd6lap>
 <1275171436.2122.29.camel@itpsd6lap>
 <20100529235402.296406d9@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100529235402.296406d9@lxorguk.ukuu.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Samo Pogacnik <samo_pogacnik@t-2.net>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@xenotime.net>

On Sat, May 29, 2010 at 11:54:02PM +0100, Alan Cox wrote:
> > +	/* re-register our fops write function */
> > +	detour_fops.write = detour_write;
> > +
> > +	detour_file.f_dentry = &detour_dentry;
> > +	detour_file.f_dentry->d_inode = &detour_inode;
> > +	detour_file.f_op = &detour_fops;
> > +	detour_file.f_mode |= FMODE_WRITE;
> > +	security_file_alloc(&detour_file);
> > +	INIT_LIST_HEAD(&detour_file.f_u.fu_list);
> > +
> > +	detour_inode.i_rdev = MKDEV(TTYAUX_MAJOR, 3);
> > +	security_inode_alloc(&detour_inode);
> > +	INIT_LIST_HEAD(&detour_inode.inotify_watches);
> > +
> > +	ret = detour_fops.open(&detour_inode, &detour_file);
> > +	printk(KERN_INFO "detour_fops.open() returned %ld\n", ret);
> > +	ret = detour_fops.unlocked_ioctl(&detour_file, TIOCCONS, 0);
> > +	printk(KERN_INFO "detour_fops.ioctl() returned %ld\n", ret);

That alone is enough for a NAK.  Do Not Do That.  Fake struct file/dentry/inode
and their uses are not acceptable.  Neither is modifying file_operations,
while we are at it.
