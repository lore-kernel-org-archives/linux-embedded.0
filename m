From: Nick Piggin <nickpiggin@yahoo.com.au>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 20:43:50 +1000
Message-ID: <200808212043.51209.nickpiggin@yahoo.com.au>
References: <48AD00C4.6060302@gmail.com> <48AD42AE.4030107@de.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD42AE.4030107@de.ibm.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: carsteno@de.ibm.com
Cc: jaredeh@gmail.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com

On Thursday 21 August 2008 20:25, Carsten Otte wrote:
> Jared Hulbert wrote:
> > I'd like to get a first round of review on my AXFS filesystem.
>
> I like the general approach of it. It's much more flexible than the
> ext2 extension I've done, and the possibility to select XIP vs.
> compression per page is really really neat. I can imagine that people
> will prefer this over the ext2 implementation on s390. It is unclear
> to me how the "secondary block device" thing is supposed to work.
> Could you elaborate a bit on that?

Agreed. I haven't had a good look through it yet, but at a glance it
looks pretty neat. The VM side of things looks pretty reasonable
(I fear XIP faulting might have another race or two, but that's a
core mm issue rather than filesystem specific).
