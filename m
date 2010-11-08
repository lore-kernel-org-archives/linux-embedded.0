From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 08/16 v2] pramfs: headers
Date: Mon, 8 Nov 2010 08:49:54 +0100
Message-ID: <AANLkTinJJG0K=BPS0CPzDWcgpRn_yPxZ819N408SwD6d@mail.gmail.com>
References: <4CD518C5.6000509@gmail.com>
	<4CD7076D.80507@bluewatersys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=36juIa9iZlOQAngXws8EZI/0VbDGEXxwsJUdkXg2TLQ=;
        b=tF3hzpvB/VxUXvc80OjBwdsdEa62vT+9PTO9ClHJ4BeCZXIpu8gpZrlT+b7qpL3PQk
         PYH1AGGAA5BjpSsaw+nupKHzSnyzJffDjRR18nGEKwN5G2k6XIul6GSknTu85MDlv8Y7
         SNyDwoe+giVtaTQqI9GzIihDDw3IwQBB2O+Hg=
In-Reply-To: <4CD7076D.80507@bluewatersys.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ryan Mallon <ryan@bluewatersys.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

2010/11/7 Ryan Mallon <ryan@bluewatersys.com>:
> On 11/06/2010 09:58 PM, Marco Stornelli wrote:
>> From: Marco Stornelli <marco.stornelli@gmail.com>
>>
>> Definitions for the PRAMFS filesystem.
>>
>> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
>> ---
>> diff -Nurp linux-2.6.36-orig/fs/pramfs/pram.h linux-2.6.36/fs/pramfs=
/pram.h
>> --- linux-2.6.36-orig/fs/pramfs/pram.h =A0 =A0 =A0 =A01970-01-01 01:=
00:00.000000000 +0100
>> +++ linux-2.6.36/fs/pramfs/pram.h =A0 =A0 2010-10-30 12:02:45.000000=
000 +0200
>> @@ -0,0 +1,317 @@
>
>> +/*
>> + * Structure of the super block in PRAMFS
>> + */
>> +struct pram_super_block {
>> + =A0 =A0 __be16 =A0s_sum; =A0 =A0 =A0 =A0 =A0/* checksum of this sb=
, including padding */
>> + =A0 =A0 __be64 =A0s_size; =A0 =A0 =A0 =A0 /* total size of fs in b=
ytes */
>> + =A0 =A0 __be32 =A0s_blocksize; =A0 =A0/* blocksize in bytes */
>> + =A0 =A0 __be32 =A0s_inodes_count; /* total inodes count (used or f=
ree) */
>> + =A0 =A0 __be32 =A0s_free_inodes_count;/* free inodes count */
>> + =A0 =A0 __be32 =A0s_free_inode_hint; =A0/* start hint for locating=
 free inodes */
>> + =A0 =A0 __be32 =A0s_blocks_count; /* total data blocks count (used=
 or free) */
>> + =A0 =A0 __be32 =A0s_free_blocks_count;/* free data blocks count */
>> + =A0 =A0 __be32 =A0s_free_blocknr_hint;/* free data blocks count */
>> + =A0 =A0 __be64 =A0s_bitmap_start; /* data block in-use bitmap loca=
tion */
>> + =A0 =A0 __be32 =A0s_bitmap_blocks;/* size of bitmap in number of b=
locks */
>> + =A0 =A0 __be32 =A0s_mtime; =A0 =A0 =A0 =A0/* Mount time */
>> + =A0 =A0 __be32 =A0s_wtime; =A0 =A0 =A0 =A0/* Write time */
>> + =A0 =A0 __be16 =A0s_magic; =A0 =A0 =A0 =A0/* Magic signature */
>> + =A0 =A0 char =A0 =A0s_volume_name[16]; /* volume name */
>> +};
>
> Is there a particular reason to use big endian types for the data
> structures? On a little endian machine you will end up converting val=
ues
> everywhere. I assume that you don't expect the machine to change
> endianess between reboots :-). If this is for generating/reading
> filesystems from userspace, wouldn't it be better to have the userspa=
ce
> tools specify the target endianess and do the conversions there?
>
> ~Ryan

Yes, there is a reason. In the first review a comment was: the fs must
have a fix endianess layout. This fs is designed for the embedded
world mainly. Since most of cpus used in this case are big-endian, it
means that for typical use case, there is no cost for endianess
conversion.

Marco
