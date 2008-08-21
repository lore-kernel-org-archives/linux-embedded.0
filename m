From: Dave Chinner <david@fromorbit.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 18:39:16 +1000
Message-ID: <20080821083916.GF5706@disturbed>
References: <48AD00C4.6060302@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48AD00C4.6060302@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Wed, Aug 20, 2008 at 10:44:36PM -0700, Jared Hulbert wrote:
> I'd like to get a first round of review on my AXFS filesystem.  This is a simple
> read only compressed filesystem like Squashfs and cramfs.  AXFS is special
> because it also allows for execute-in-place of your applications.  It is a major
> improvement over the cramfs XIP patches that have been floating around for ages.
> The biggest improvement is in the way AXFS allows for each page to be XIP or
> not.  First, a user collects information about which pages are accessed on a
> compressed image for each mmap()ed region from /proc/axfs/volume0.  That
> 'profile' is used as an input to the image builder.  The resulting image has
> only the relevant pages uncompressed and XIP.  The result is smaller memory
> sizes and faster launches.

FWIW, I'm not sure it's a good idea to name this new filesystem AXFS.
People are almost certainly going to confuse it with XFS despite
the filesystems being aimed at diammetrically opposed ends of the
storage spectrum. ;)

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
