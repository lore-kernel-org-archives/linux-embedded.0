From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 08/16 v2] pramfs: headers
Date: Tue, 9 Nov 2010 09:19:32 +0100
Message-ID: <AANLkTim8rAQnVYpZdykd2VuL1N9CvkGj88Kf5qpSuJsC@mail.gmail.com>
References: <4CD518C5.6000509@gmail.com>
	<4CD7076D.80507@bluewatersys.com>
	<AANLkTinJJG0K=BPS0CPzDWcgpRn_yPxZ819N408SwD6d@mail.gmail.com>
	<4CD85489.8000503@bluewatersys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Cn3pjRhaup3J1QvfHtxTtcF3JijOT+ifgYFhcy3fBVU=;
        b=V2a7AtyLOEcd63SqiNlGpv3aRM6ST9oW9hS9lktwE9XL3jQzkelAgGpM4Rt2Ttu9D4
         1V0q8Zb1Hl0ILi6nj++9Qf3u57TDzw6YQMuLp9IofmHUkxC72rAPIFNO2CYMFAiu3h6B
         TaqX6bTocmRmbLiDQzOimHaTGQ3Zl568kzEIY=
In-Reply-To: <4CD85489.8000503@bluewatersys.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ryan Mallon <ryan@bluewatersys.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

2010/11/8 Ryan Mallon <ryan@bluewatersys.com>:
> On 11/08/2010 08:49 PM, Marco Stornelli wrote:
>> 2010/11/7 Ryan Mallon <ryan@bluewatersys.com>:
>>> On 11/06/2010 09:58 PM, Marco Stornelli wrote:
>>>> From: Marco Stornelli <marco.stornelli@gmail.com>
>>>>
>>>> Definitions for the PRAMFS filesystem.
>>>>
>>>> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
>>>> ---
>>>> diff -Nurp linux-2.6.36-orig/fs/pramfs/pram.h linux-2.6.36/fs/pram=
fs/pram.h
>>>> --- linux-2.6.36-orig/fs/pramfs/pram.h =A0 =A0 =A0 =A01970-01-01 0=
1:00:00.000000000 +0100
>>>> +++ linux-2.6.36/fs/pramfs/pram.h =A0 =A0 2010-10-30 12:02:45.0000=
00000 +0200
>>>> @@ -0,0 +1,317 @@
>>>
>>>> +/*
>>>> + * Structure of the super block in PRAMFS
>>>> + */
>>>> +struct pram_super_block {
>>>> + =A0 =A0 __be16 =A0s_sum; =A0 =A0 =A0 =A0 =A0/* checksum of this =
sb, including padding */
>>>> + =A0 =A0 __be64 =A0s_size; =A0 =A0 =A0 =A0 /* total size of fs in=
 bytes */
>>>> + =A0 =A0 __be32 =A0s_blocksize; =A0 =A0/* blocksize in bytes */
>>>> + =A0 =A0 __be32 =A0s_inodes_count; /* total inodes count (used or=
 free) */
>>>> + =A0 =A0 __be32 =A0s_free_inodes_count;/* free inodes count */
>>>> + =A0 =A0 __be32 =A0s_free_inode_hint; =A0/* start hint for locati=
ng free inodes */
>>>> + =A0 =A0 __be32 =A0s_blocks_count; /* total data blocks count (us=
ed or free) */
>>>> + =A0 =A0 __be32 =A0s_free_blocks_count;/* free data blocks count =
*/
>>>> + =A0 =A0 __be32 =A0s_free_blocknr_hint;/* free data blocks count =
*/
>>>> + =A0 =A0 __be64 =A0s_bitmap_start; /* data block in-use bitmap lo=
cation */
>>>> + =A0 =A0 __be32 =A0s_bitmap_blocks;/* size of bitmap in number of=
 blocks */
>>>> + =A0 =A0 __be32 =A0s_mtime; =A0 =A0 =A0 =A0/* Mount time */
>>>> + =A0 =A0 __be32 =A0s_wtime; =A0 =A0 =A0 =A0/* Write time */
>>>> + =A0 =A0 __be16 =A0s_magic; =A0 =A0 =A0 =A0/* Magic signature */
>>>> + =A0 =A0 char =A0 =A0s_volume_name[16]; /* volume name */
>>>> +};
>>>
>>> Is there a particular reason to use big endian types for the data
>>> structures? On a little endian machine you will end up converting v=
alues
>>> everywhere. I assume that you don't expect the machine to change
>>> endianess between reboots :-). If this is for generating/reading
>>> filesystems from userspace, wouldn't it be better to have the users=
pace
>>> tools specify the target endianess and do the conversions there?
>>>
>>> ~Ryan
>>
>> Yes, there is a reason. In the first review a comment was: the fs mu=
st
>> have a fix endianess layout. This fs is designed for the embedded
>> world mainly. Since most of cpus used in this case are big-endian, i=
t
>> means that for typical use case, there is no cost for endianess
>> conversion.
>
> ARM, which is a large portion of the embedded space, is typically lit=
tle
> endian.

Not always. Indeed, I didn't say *all* cpu used are big-endian.

>
> Why does a filesystem need to have a specific endianess layout?
> Especially for a highly specialised filesystem like this.
>

I didn't agree with it, but in the first review there was more than
one developer that said this thing. The main reason was to read the
format (for example with JTAG) or to create an image with a fix
format. I remember that someone said that there was a similar problem
with jffs2 and the experience tell to us that a fix endianess is
important. At that point I decided to use big-endian. You can see all
the discussion in lkml. The review has been done at June 2009.

Regards,

Marco
