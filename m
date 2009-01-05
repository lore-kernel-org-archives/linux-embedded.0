From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH V3 00/17] Squashfs: compressed read-only filesystem
Date: Mon, 5 Jan 2009 16:27:25 +0300
Message-ID: <20090105132725.GC14147@ioremap.net>
References: <E1LJnJn-0002Kx-Dd@dylan.lougher.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1LJnJn-0002Kx-Dd@dylan.lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com, sfr@canb.auug.org.au

Hi Phillip.

On Mon, Jan 05, 2009 at 11:08:23AM +0000, Phillip Lougher (phillip@lougher.demon.co.uk) wrote:
> This a second respin of the Squashfs patches incorporating the review comments
> received.  Thanks to everyone who have sent comments.
> 
> Summary of changes in patch respin:
> 
> 1. Vmalloc removed, smaller PAGE_CACHE_SIZE buffers are now allocated
> 2. Renamed some global functions, prefixing with squashfs_
> 3. brelse changed to put_bh
> 4. cache->lock coverage extended in squashfs_put_cache() and
>    squashfs_cache_get()
> 5. New squashfs.txt file in Documentation/filesystems
> 6. Changed 'long long' usage to u64 for variables referring to 64-bit
>    filesystem locations
> 7. SQUASHFS_I() renamed to squashfs_i()
> 8. Renamed locked variable to refcount to clarify usage
> 9. Renamed waiting variable to num_waiters, making it clear it is a count
>    rather than a boolean
> 10. Made pending and error fields int rather than char


Looks good.
You can also update the year in the copyright string in the files :)

-- 
	Evgeniy Polyakov
