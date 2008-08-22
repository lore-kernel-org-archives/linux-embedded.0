From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Fri, 22 Aug 2008 04:46:47 +0100
Message-ID: <48AE36A7.4060000@lougher.demon.co.uk>
References: <48AD00F0.5030403@gmail.com> <48AE0697.5040706@lougher.demon.co.uk> <6934efce0808212027q412c4cbbp6ea8673a7d3bc1b9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808212027q412c4cbbp6ea8673a7d3bc1b9@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

Jared Hulbert wrote:
>> I assume compressed blocks can be larger than PAGE_CACHE_SIZE?  This suffers
>> from the rather obvious inefficiency that you decompress a big block >
>> PAGE_CACHE_SIZE, but only copy one PAGE_CACHE_SIZE page out of it.  If
>> multiple files are being read simultaneously (a common occurrence), then
>> each is going to replace your one cached uncompressed block
>> (sbi->current_cnode_index), leading to decompressing the same blocks over
>> and over again on sequential file access.
>>
>> readpage file A, index 1 -> decompress block X
>> readpage file B, index 1 -> decompress block Y (replaces X)
>> readpage file A, index 2 -> repeated decompress of block X (replaces Y)
>> readpage file B, index 2 -> repeated decompress of block Y (replaces X)
>>
>> and so on.
> 
> Yep.  Been thinking about optimizing it.  So far it hasn't been an
> issue for my customers.  Most fs traffic being on the XIP pages.  Once
> I get a good automated performance test up we'll probably look into
> something to improve this.

It's relatively easy to solve.  Squashfs explicitly pushes the extra 
pages into the pagecache (so subsequent readpages find them there and 
don't call readpage on squashfs again).

Phillip

