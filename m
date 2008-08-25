From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Mon, 25 Aug 2008 16:35:07 +1000
Message-ID: <48B2529B.8030906@snapgear.com>
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>	 <6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>	 <48AE0476.80109@snapgear.com> <6934efce0808211948kd12ba76k1ee847a0e08010e0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755132AbYHYGfl@vger.kernel.org>
In-Reply-To: <6934efce0808211948kd12ba76k1ee847a0e08010e0@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Jamie Lokier <jamie@shareable.org>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au


Hi Jared,

Jared Hulbert wrote:
>> That would be enough I think. If you could manually select
>> which files are contiguous-and-uncompressed that would be
>> useful for some too here.
> 
> So.... If you don't have an MMU when do you call ->fault?  Does the
> noMMU code just loop through ->fault()ing all the pages in an mmap()?

Sort of. It actually just uses a single ->read to bring in
the entire file contents. There is a few limitations on the use
of mmap() for non-mmu. Documentation/nommu-mmap.txt gives
more details. With no MMU it does rely on being able to kmalloc()
a single RAM region big enough to hold the entire file.


>> One thing for sure is that many people who do non-MMU setups
>> are interested in XIP to get the space savings. These are very
>> often small devices with very constrained RAM and flash. (For
>> whatever it is worth single NOR flash only boards are common in
>> these smaller form factors :-)
> 
> True.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear -- a Secure Computing Company      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
