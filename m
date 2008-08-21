From: Carsten Otte <cotte@de.ibm.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 12:25:50 +0200
Message-ID: <48AD42AE.4030107@de.ibm.com>
References: <48AD00C4.6060302@gmail.com>
Reply-To: carsteno@de.ibm.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD00C4.6060302@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, nickpiggin@yahoo.com.au

Jared Hulbert wrote:
> I'd like to get a first round of review on my AXFS filesystem.
I like the general approach of it. It's much more flexible than the 
ext2 extension I've done, and the possibility to select XIP vs. 
compression per page is really really neat. I can imagine that people 
will prefer this over the ext2 implementation on s390. It is unclear 
to me how the "secondary block device" thing is supposed to work. 
Could you elaborate a bit on that?
