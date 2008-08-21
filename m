From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Thu, 21 Aug 2008 09:49:19 +0100
Message-ID: <1219308560.2988.247.camel@pmac.infradead.org>
References: <48AD00F8.1030004@gmail.com>  <48AD2AFF.5060609@de.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD2AFF.5060609@de.ibm.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: carsteno@de.ibm.com
Cc: jaredeh@gmail.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, tim.bird@AM.SONY.COM, nickpiggin@yahoo.com.au

On Thu, 2008-08-21 at 10:44 +0200, Carsten Otte wrote:
> Jared Hulbert wrote:
> > Profiling is a fault instrumentation and /proc formating system.
> > This is used to get an accurate picture of what the pages are actually used.
> > Using this info the image can be optimized for XIP

> Exporting profiling data for a file system in another file system 
> (/proc) seems not very straigtforward to me. I think it is worth 
> considering to export this information via the same mount point.

I would have said sysfs, rather than 'the same mount point'.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation


