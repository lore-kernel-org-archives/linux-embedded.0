From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Thu, 21 Aug 2008 13:39:36 +0200
Message-ID: <200808211339.37187.arnd@arndb.de>
References: <48AD00F8.1030004@gmail.com> <48AD2AFF.5060609@de.ibm.com> <1219308560.2988.247.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1219308560.2988.247.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: carsteno@de.ibm.com, jaredeh@gmail.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-15?q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, nickpiggin@yahoo.com.au

On Thursday 21 August 2008, David Woodhouse wrote:
> On Thu, 2008-08-21 at 10:44 +0200, Carsten Otte wrote:
> >
> > Exporting profiling data for a file system in another file system 
> > (/proc) seems not very straigtforward to me. I think it is worth 
> > considering to export this information via the same mount point.
> 
> I would have said sysfs, rather than 'the same mount point'.
> 

Let me throw in debugfs as my preferred option. sysfs is for stable
interfaces, while profiling generally fits into the debugging category.

	Arnd <><
