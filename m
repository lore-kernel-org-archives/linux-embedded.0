From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 08/16 v2] pramfs: headers
Date: Tue, 9 Nov 2010 21:56:46 +0100
Message-ID: <AANLkTiky0LLnipJN3tCwcW6F2LEK-REEd=Ovo0ewMubR@mail.gmail.com>
References: <4CD518C5.6000509@gmail.com>
	<4CD7076D.80507@bluewatersys.com>
	<AANLkTinJJG0K=BPS0CPzDWcgpRn_yPxZ819N408SwD6d@mail.gmail.com>
	<4CD85489.8000503@bluewatersys.com>
	<AANLkTim8rAQnVYpZdykd2VuL1N9CvkGj88Kf5qpSuJsC@mail.gmail.com>
	<4CD9B09F.5090707@bluewatersys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=tJ0h9naXpwtjc0uvCWaM40y0hCsPJ8w5C61KrffG96I=;
        b=eRKeq5RNPV3gF11JNPIFqkBpTqrNkpX41lOlNBjRE/Ou0/1qWqtPgJbM8CQvdXZpEP
         Kbh9U9rgD7FX/nIbkhfHAt2LMa2QtvtyoPqrZ+KlvIrMInudyxzn+FSijLRlKRqCmXeC
         QKPvzx8xDDWmQSsAHGF/YZBBh2/sOIyur/9ds=
In-Reply-To: <4CD9B09F.5090707@bluewatersys.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ryan Mallon <ryan@bluewatersys.com>
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

On Tue, Nov 9, 2010 at 21:35, Ryan Mallon <ryan@bluewatersys.com> wrote=
:
> On 11/09/2010 09:19 PM, Marco Stornelli wrote:
>> 2010/11/8 Ryan Mallon <ryan@bluewatersys.com>:
>>> On 11/08/2010 08:49 PM, Marco Stornelli wrote:
>>>> 2010/11/7 Ryan Mallon <ryan@bluewatersys.com>:
>>>>> On 11/06/2010 09:58 PM, Marco Stornelli wrote:
>>>>>> From: Marco Stornelli <marco.stornelli@gmail.com>
>>>>>>
>>>>>> Definitions for the PRAMFS filesystem.
>>>>>>
>>>>>> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
>>>>>> ---
>>>>>> diff -Nurp linux-2.6.36-orig/fs/pramfs/pram.h linux-2.6.36/fs/pr=
amfs/pram.h
>>>>>> --- linux-2.6.36-orig/fs/pramfs/pram.h =C2=A0 =C2=A0 =C2=A0 =C2=A0=
1970-01-01 01:00:00.000000000 +0100
>>>>>> +++ linux-2.6.36/fs/pramfs/pram.h =C2=A0 =C2=A0 2010-10-30 12:02=
:45.000000000 +0200
>>>>>> @@ -0,0 +1,317 @@
>>>>>
>>>>>> +/*
>>>>>> + * Structure of the super block in PRAMFS
>>>>>> + */
>>>>>> +struct pram_super_block {
>>>>>> + =C2=A0 =C2=A0 __be16 =C2=A0s_sum; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* checksum of this sb, including padding */
>>>>>> + =C2=A0 =C2=A0 __be64 =C2=A0s_size; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* total size of fs in bytes */
>>>>>> + =C2=A0 =C2=A0 __be32 =C2=A0s_blocksize; =C2=A0 =C2=A0/* blocks=
ize in bytes */
>>>>>> + =C2=A0 =C2=A0 __be32 =C2=A0s_inodes_count; /* total inodes cou=
nt (used or free) */
>>>>>> + =C2=A0 =C2=A0 __be32 =C2=A0s_free_inodes_count;/* free inodes =
count */
>>>>>> + =C2=A0 =C2=A0 __be32 =C2=A0s_free_inode_hint; =C2=A0/* start h=
int for locating free inodes */
>>>>>> + =C2=A0 =C2=A0 __be32 =C2=A0s_blocks_count; /* total data block=
s count (used or free) */
>>>>>> + =C2=A0 =C2=A0 __be32 =C2=A0s_free_blocks_count;/* free data bl=
ocks count */
>>>>>> + =C2=A0 =C2=A0 __be32 =C2=A0s_free_blocknr_hint;/* free data bl=
ocks count */
>>>>>> + =C2=A0 =C2=A0 __be64 =C2=A0s_bitmap_start; /* data block in-us=
e bitmap location */
>>>>>> + =C2=A0 =C2=A0 __be32 =C2=A0s_bitmap_blocks;/* size of bitmap i=
n number of blocks */
>>>>>> + =C2=A0 =C2=A0 __be32 =C2=A0s_mtime; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* Mount time */
>>>>>> + =C2=A0 =C2=A0 __be32 =C2=A0s_wtime; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* Write time */
>>>>>> + =C2=A0 =C2=A0 __be16 =C2=A0s_magic; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* Magic signature */
>>>>>> + =C2=A0 =C2=A0 char =C2=A0 =C2=A0s_volume_name[16]; /* volume n=
ame */
>>>>>> +};
>>>>>
>>>>> Is there a particular reason to use big endian types for the data
>>>>> structures? On a little endian machine you will end up converting=
 values
>>>>> everywhere. I assume that you don't expect the machine to change
>>>>> endianess between reboots :-). If this is for generating/reading
>>>>> filesystems from userspace, wouldn't it be better to have the use=
rspace
>>>>> tools specify the target endianess and do the conversions there?
>>>>>
>>>>> ~Ryan
>>>>
>>>> Yes, there is a reason. In the first review a comment was: the fs =
must
>>>> have a fix endianess layout. This fs is designed for the embedded
>>>> world mainly. Since most of cpus used in this case are big-endian,=
 it
>>>> means that for typical use case, there is no cost for endianess
>>>> conversion.
>>>
>>> ARM, which is a large portion of the embedded space, is typically l=
ittle
>>> endian.
>>
>> Not always. Indeed, I didn't say *all* cpu used are big-endian.
>
> My point is that little endian embedded machines make up a large port=
ion
> of the devices that this filesystem will be useful on. On those devic=
es
> it will also have an (unnecessary) conversion overhead.
>
>>> Why does a filesystem need to have a specific endianess layout?
>>> Especially for a highly specialised filesystem like this.
>>
>> I didn't agree with it, but in the first review there was more than
>> one developer that said this thing. The main reason was to read the
>> format (for example with JTAG) or to create an image with a fix
>> format. I remember that someone said that there was a similar proble=
m
>> with jffs2 and the experience tell to us that a fix endianess is
>> important. At that point I decided to use big-endian. You can see al=
l
>> the discussion in lkml. The review has been done at June 2009.
>
> You can still do all of those things without having a fixed endianess=
=2E
> You just have to have one extra step of telling the external tools wh=
at
> the endianess is. IMHO, it is better to have the overhead of the endi=
an
> conversion in the tools since it is less costly there than an the
> embedded system.
>
> I'm just trying to understand why the fixed endianess rule cannot be
> bent for such a specialised filesystem.

When it was decided that filesystems should be fixed-endian and support=
 for
big-endian ext2 was dropped, the overhead of doing the fixed conversion=
s was
deetermined negligible due to compiler optimization.
That was ages ago, and current embedded systems run circles around the
machines of those days.

Note that this is about metadata only. Actual file contents are always =
just
byte streams.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
