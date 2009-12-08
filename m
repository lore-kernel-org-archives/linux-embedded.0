From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 1/9] Squashfs: move zlib decompression wrapper code into
 a separate file
Date: Tue, 08 Dec 2009 22:20:18 +0000
Message-ID: <4B1ED122.3040309@lougher.demon.co.uk>
References: <E1NHTHg-0001sM-NQ@dylan.lougher.demon.co.uk> <20091207145705.cd30cae8.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20091207145705.cd30cae8.akpm@linux-foundation.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com

Andrew Morton wrote:
> On Mon, 07 Dec 2009 02:25:08 +0000
> Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
> 
>> +
>> +int zlib_uncompress(struct squashfs_sb_info *msblk, void **buffer,
>> +	struct buffer_head **bh, int b, int offset, int length, int srclength,
>> +	int pages)
> 
> This isn't a very good function name.  zlib_uncompress() now becomes a
> kernel-wide identifier, but it's part of squashfs, not part of zlib.
> 
> Maybe that gets fixed in a later patch.  If so, thwap me.
> 

Yes, they get fixed up in [PATCH 3/9] Squashfs: add a decompressor framework.
That patch makes the functions static, and instead exports them via a
suitably named decompressor ops structure.

+const struct squashfs_decompressor squashfs_zlib_comp_ops = {
+	.init = zlib_init,
+	.free = zlib_free,
+	.decompress = zlib_uncompress,
+	.id = ZLIB_COMPRESSION,
+	.name = "zlib",
+	.supported = 1
+};

I split the patches up to make them easier to review.  The first two patches
move the zlib code out to a separate file (ready for adding the framework).
The third patch adds the framework.  At the time of the second patch, however,
to not break compilation, the functions have to be global.  In hindsight
I should have made named the functions squashfs_xxx, and removed the squashfs_
when they were made static in the third patch.

Thanks

Phillip
