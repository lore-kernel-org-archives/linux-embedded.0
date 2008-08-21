From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 02/10] AXFS: Kconfig and Makefiles
Date: Thu, 21 Aug 2008 16:11:07 +0200
Message-ID: <20080821141107.GA20956@uranus.ravnborg.org>
References: <48AD00DF.9080207@gmail.com> <200808211324.22989.arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200808211324.22989.arnd@arndb.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: jaredeh@gmail.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Thu, Aug 21, 2008 at 01:24:22PM +0200, Arnd Bergmann wrote:
> On Thursday 21 August 2008, Jared Hulbert wrote:
> > The Kconfig edits and Makefiles required for AXFS.
> > 
> > Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> 
> If you split out this patch separate from the files, please make it the
> *last* patch so that you cannot get build errors during a later git-bisect
> through the middle of your series.

And please use axfs-y := foo.o bar.o
as the old axfs-objs := foo.o bar.o ... syntax is deprecated.

[Replying to this mail as I lost the original]

Thanks,

	Sam
