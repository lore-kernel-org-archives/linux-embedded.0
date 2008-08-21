From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 22 Aug 2008 09:46:45 +1000
Message-ID: <48ADFE65.1050007@snapgear.com>
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080821110749.GA1926@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Jared Hulbert <jaredeh@gmail.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@de.ibm.com, nickpiggin@yahoo.com.au


Jamie Lokier wrote:
> Jared Hulbert wrote:
>> The biggest improvement is in the way AXFS allows for each page to be XIP or
>> not.  First, a user collects information about which pages are accessed on a
>> compressed image for each mmap()ed region from /proc/axfs/volume0.  That
>> 'profile' is used as an input to the image builder.  The resulting image has
>> only the relevant pages uncompressed and XIP.  The result is smaller memory
>> sizes and faster launches.
> 
> Sounds great, really nice idea.
> 
> How does it fare with no MMU?  Can the profiler and image builder lay
> out the XIP pages in such a way that no-MMU mmaps can map those regions?

The key for XIP on noMMU would be the ability to store a
file as one complete contiguous chunk. Can AXFS do this?

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
Secure Computing Corporation                PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
