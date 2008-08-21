From: Sven Wegener <sven.wegener@stealer.net>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Thu, 21 Aug 2008 16:54:44 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0808211653501.12259@titan.stealer.net>
References: <48AD0101.4020505@gmail.com> <alpine.LNX.1.10.0808211325530.12259@titan.stealer.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760224AbYHUO4i@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808211325530.12259@titan.stealer.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Thu, 21 Aug 2008, Sven Wegener wrote:

> On Wed, 20 Aug 2008, Jared Hulbert wrote:
> 
> > The many different devices AXFS can mount to and the various
> > dual device mounting schemes are supported here.
> > 
> > Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> > ---
> > +static int __init init_axfs_fs(void)
> > +{
> > +	axfs_uncompress_init();
> 
> one more thing, axfs_uncompress_init() can fail
> 
> > +	return register_filesystem(&axfs_fs_type);

And if this fails you leak the memory allocated in axfs_uncompress_init()

> > +}
> > +
> > +static void __exit exit_axfs_fs(void)
> > +{
> > +	axfs_uncompress_exit();
> > +	unregister_filesystem(&axfs_fs_type);
> > +}
> > +
> > +module_init(init_axfs_fs);
> > +module_exit(exit_axfs_fs);
> > +MODULE_LICENSE("GPL");
