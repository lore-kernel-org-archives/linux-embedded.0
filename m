From: Sven Wegener <sven.wegener@stealer.net>
Subject: Re: [PATCH 10/10] AXFS: axfs_uncompress.c
Date: Thu, 21 Aug 2008 16:53:04 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0808211647500.12259@titan.stealer.net>
References: <48AD0126.1050609@gmail.com>  <alpine.LNX.1.10.0808211028150.12259@titan.stealer.net> <6934efce0808210737w16b5f8dcr1657ea46099e4901@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808210737w16b5f8dcr1657ea46099e4901@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Thu, 21 Aug 2008, Jared Hulbert wrote:

> > Use DEFINE_MUTEX and drop the mutex_init() down in the init function.
> 
> okay.  by drop you mean delete?

Yes.

> > axfs_uncompress_init() and axfs_uncompress_exit() are only called during
> > init and exit of the module, no need for the initialized variable and the
> > functions can be annotated with __init and __exit.
> 
> can be annotated or should be?

Should be. We only need them once during init and cleanup. If you want to 
call axfs_uncompress_exit() from init_axfs_fs() to clean up in case of 
register_filesystem failing, you can't annotate axfs_uncompress_exit() 
with __exit.

Sven
