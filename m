From: Phillip Lougher <phillip.lougher@gmail.com>
Subject: Re: RFC: direct MTD support for SquashFS
Date: Fri, 19 Mar 2010 07:30:47 +0000
Message-ID: <bffbecbb1003190030x4236abere54649131408cacc@mail.gmail.com>
References: <87vdcwv139.fsf@tac.ki.iif.hu> <87ljdsibqe.fsf@macbook.be.48ers.dk>
	 <87r5nhziss.fsf@tac.ki.iif.hu>
	 <bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
	 <87d3z1unm9.fsf@tac.ki.iif.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=8+wVCPKpjlPCEV9zlIv+KSc/byrfxNUklZEOTU6+4R4=;
        b=Vbu+d+xnDjG0cLjuUHYaRGTspKciLplPLQ695ZgHbMZo92/psPdMVBDl0QOigtRkMo
         G9i1nempVRjo5/l6o6LaU0ainhMBrri6R4/NiAvFE0cDfNWME2qUV/o1r365k4nlOtQF
         NCEpjHHi7Hd4Dm+ACEOTlg2+ZPLTBbHm7PIgo=
In-Reply-To: <87d3z1unm9.fsf@tac.ki.iif.hu>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ferenc Wagner <wferi@niif.hu>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Fri, Mar 19, 2010 at 1:05 AM, Ferenc Wagner <wferi@niif.hu> wrote:
> Ferenc Wagner <wferi@niif.hu> writes:
>
>> Phillip Lougher <phillip.lougher@gmail.com> writes:
>>
>>> On Thu, Mar 18, 2010 at 4:38 PM, Ferenc Wagner <wferi@niif.hu> wrot=
e:
>>>
>>> +static int fill_bdev_super(struct super_block *sb, void *data, int=
 silent)
>>> +{
>>> + =A0 =A0struct squashfs_sb_info *msblk;
>>> + =A0 =A0struct squashfs_bdev *bdev;
>>> + =A0 =A0int err =3D squashfs_fill_super2(sb, data, silent, &squash=
fs_bdev_ops);
>>> + =A0 =A0if (err)
>>> + =A0 =A0 =A0 =A0 =A0 =A0return err;
>>> +
>>> + =A0 =A0bdev =3D kzalloc(sizeof(*bdev), GFP_KERNEL);
>>> + =A0 =A0if (!bdev)
>>> + =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
>>> +
>>> + =A0 =A0bdev->devblksize =3D sb_min_blocksize(sb, BLOCK_SIZE);
>>> + =A0 =A0bdev->devblksize_log2 =3D ffz(~bdev->devblksize);
>>> +
>>> + =A0 =A0msblk =3D sb->s_fs_info;
>>> + =A0 =A0msblk->backend_data =3D bdev;
>>> + =A0 =A0return 0;
>>> +}
>>>
>>> This function looks rather 'back-to-front' to me. =A0I'm assuming t=
hat
>>> squashfs_fill_super2() will be the current fill superblock function=
?
>>
>> Yes, with the extra parameter added.
>>
>>> This function wants to read data off the filesystem through the
>>> backend, and yet the backend (bdev, mblk->backend_data) hasn't been
>>> initialised when it's called...
>>
>> It can't be, because msblk =3D sb->s_fs_info is allocated by
>> squashfs_fill_super(). =A0Now it will be passed the ops, so after
>> allocating msblk it can also fill out the ops. =A0After that it can =
read,
>> and squashfs_read_data() will call the init, read and free operation=
s of
>> the backend.
>
> And here we indeed have a rather fundamental problem. =A0This isn't
> specific to the discussed plugin system at all. =A0Even in the curren=
t
> code, to set msblk->block_size squashfs_fill_super() calls
> squashfs_read_table() to read the superblock, which in turn calls
> squashfs_read_data(), which uses msblk->block_size to allocate enough
> buffer heads, but msblk->block_size just can't be set at this point.
> msblk->bytes_used is preset with a dummy value to make the read
> possible, but msblk->block_size is not. =A0Fortunately, one buffer he=
ad is
> allocated each time nevertheless. =A0I wonder what a correct solution
> would look lke..

Block_size is known to be zero (the structure has been zeroed out at
alloc), and so it is known that the one block alloced in this case
will be correct.

Congratulations you've managed to really piss me off in your third or s=
o email.

Cheers

Phillip

> --
> Regards,
> Feri.
>
