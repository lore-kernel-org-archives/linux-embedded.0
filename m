From: Samo Pogacnik <samo_pogacnik@t-2.net>
Subject: Re: [PATCH] detour TTY driver
Date: Sun, 30 May 2010 01:33:03 +0200
Message-ID: <1275175983.2122.42.camel@itpsd6lap>
References: <1273918658.2341.17.camel@itpsd6lap>
	 <1275171436.2122.29.camel@itpsd6lap>
	 <20100529235402.296406d9@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100529235402.296406d9@lxorguk.ukuu.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@xenotime.net>, Al Viro <viro@ZenIV.linux.org.uk>

> > +static void initial_console_redirect(void)
> > +{
> > +	long ret;
> > +
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
> > +}
> 
> Bletch.. I'm really opposed to this kind of hackery. Fix your userspace a
> tiny bit.
> 
> So
> - Write only tty that uses printk: Looks good to me, implementation
>   quibbles only
> - Magic kernel hacks to shuffle things around in the initial console
>   logic - hideous. I still really think you need to fix your userspace
> 

Thank you for all comments. I'll try to follow them (might take some
time) and i'll remove the internal console redirection magic for sure. 

regards, Samo
