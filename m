From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH V2 10/16] Squashfs: cache operations
Date: Mon, 3 Nov 2008 17:11:02 +0300
Message-ID: <20081103141102.GA27263@ioremap.net>
References: <E1Kv0C4-0006HO-BC@dylan>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1Kv0C4-0006HO-BC@dylan>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

Hi.

Couple comments below.

On Wed, Oct 29, 2008 at 01:49:56AM +0000, Phillip Lougher (phillip@lougher.demon.co.uk) wrote:
> +struct squashfs_cache_entry *squashfs_cache_get(struct super_block *sb,
> +	struct squashfs_cache *cache, long long block, int length)
> +{
> +	int i, n;
> +	struct squashfs_cache_entry *entry;
> +
> +	spin_lock(&cache->lock);
> +
> +	while (1) {
> +		for (i = 0; i < cache->entries; i++)
> +			if (cache->entry[i].block == block)
> +				break;
> +
> +		if (i == cache->entries) {
> +			/*
> +			 * Block not in cache, if all cache entries are locked
> +			 * go to sleep waiting for one to become available.
> +			 */
> +			if (cache->unused == 0) {
> +				cache->waiting++;
> +				spin_unlock(&cache->lock);
> +				wait_event(cache->wait_queue, cache->unused);
> +				spin_lock(&cache->lock);
> +				cache->waiting--;
> +				continue;
> +			}
> +
> +			/*
> +			 * At least one unlocked cache entry.  A simple
> +			 * round-robin strategy is used to choose the entry to
> +			 * be evicted from the cache.
> +			 */
> +			i = cache->next_blk;
> +			for (n = 0; n < cache->entries; n++) {
> +				if (cache->entry[i].locked == 0)
> +					break;
> +				i = (i + 1) % cache->entries;
> +			}
> +
> +			cache->next_blk = (i + 1) % cache->entries;
> +			entry = &cache->entry[i];

This is invoked for every read when cache is filled, if I understood
correctly, and having a modulo in this path is an additional overhead.
This may be hidden on behalf of compression overhead, but stil.

Also what happens when there are no unlocked entries? I.e. you will try
to work with existing one, while it is already locked and processed by
another thread?


-- 
	Evgeniy Polyakov
