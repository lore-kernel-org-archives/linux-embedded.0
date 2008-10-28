From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: Subject: [PATCH 02/16] Squashfs: directory lookup operations
Date: Tue, 28 Oct 2008 21:14:05 +0300
Message-ID: <4907566D.9040003@msgid.tls.msk.ru>
References: <E1KqrTW-0001xG-Cl@dylan> <Pine.LNX.4.64.0810281835150.23080@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0810281835150.23080@vixen.sonytel.be>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

Geert Uytterhoeven wrote:
> On Fri, 17 Oct 2008, Phillip Lougher wrote:
>> --- /dev/null
>> +++ b/fs/squashfs/namei.c
> 
>> +static int get_dir_index_using_name(struct super_block *s,
>> +			long long *next_block, unsigned int *next_offset,
>> +			long long index_start, unsigned int index_offset,
>> +			int i_count, const char *name, int len)
>> +{
>> +	struct squashfs_sb_info *msblk = s->s_fs_info;
>> +	int i, size, length = 0;
>> +	struct squashfs_dir_index *index;
>> +	char *str;
>> +
>> +	TRACE("Entered get_dir_index_using_name, i_count %d\n", i_count);
>> +
>> +	str = kmalloc(sizeof(*index) + (SQUASHFS_NAME_LEN + 1) * 2, GFP_KERNEL);
>> +	if (str == NULL) {
>> +		ERROR("Failed to allocate squashfs_dir_index\n");
>> +		goto out;
>> +	}
>> +
>> +	index = (struct squashfs_dir_index *) (str + SQUASHFS_NAME_LEN + 1);
> 
> As str has been returned by kmalloc(), and SQUASHFS_NAME_LEN is equal to 256,
> `str + SQUASHFS_NAME_LEN + 1` is an odd address.
> 
[..]
>> +		size = le32_to_cpu(index->size) + 1;
>                                    ^^^^^^^^^^^
[.]
> Hence accessing multi-byte fields in struct squashfs_dir_index causes unaligned
> accesses, which are emulated on some architectures (e.g. on MIPS).
> 
> Use get_unaligned_le32() for unaligned accesses.

How about aligning it properly in the first place instead?
Three ways:

   1) reordering index and str here, so that index comes first,
      str next.

   2) using another constant instead of +1

   3) using separate allocations for separate objects.

/mjt
