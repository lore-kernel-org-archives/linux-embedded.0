From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 12:07:50 +0100
Message-ID: <20080821110749.GA1926@shareable.org>
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

Jared Hulbert wrote:
> The biggest improvement is in the way AXFS allows for each page to be XIP or
> not.  First, a user collects information about which pages are accessed on a
> compressed image for each mmap()ed region from /proc/axfs/volume0.  That
> 'profile' is used as an input to the image builder.  The resulting image has
> only the relevant pages uncompressed and XIP.  The result is smaller memory
> sizes and faster launches.

Sounds great, really nice idea.

How does it fare with no MMU?  Can the profiler and image builder lay
out the XIP pages in such a way that no-MMU mmaps can map those regions?

No complaint if not, it would be a nice bonus though.

-- Jamie
