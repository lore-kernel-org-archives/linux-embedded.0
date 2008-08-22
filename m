From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Fri, 22 Aug 2008 04:29:50 +0100
Message-ID: <48AE32AE.9010901@lougher.demon.co.uk>
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de>	 <48AE22F5.3000309@lougher.demon.co.uk> <6934efce0808212023x758babf0w500da6801bd66f45@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808212023x758babf0w500da6801bd66f45@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

Jared Hulbert wrote:

> 
> The memcpy in question copies a c_node to the page.  The len is either
> the max length of a c_node and size of the buffer I'm copying to
> (PAGE_CACHE_SIZE) or it is the difference between the beginning of the
> c_node in the c_block and the end of the c_block, whichever is
> smaller.  The confusion is probably because of the fact that this
> copies extra crap to the page for tails.


Ah yes, that's where I got confused :)  Glad to see AXFS uses tail packing.


Phillip
