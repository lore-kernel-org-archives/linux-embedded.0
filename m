From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: [PATCH] devtmpfs: support !CONFIG_TMPFS
Date: Fri, 12 Mar 2010 14:02:57 +0100
Message-ID: <ac3eb2511003120502y2953ff0au81ee5c4d76261a87@mail.gmail.com>
References: <1268389504-22179-1-git-send-email-jacmet@sunsite.dk> 
	<4B9A2548.7050401@msgid.tls.msk.ru> <87aaud22jj.fsf@macbook.be.48ers.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87aaud22jj.fsf@macbook.be.48ers.dk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Michael Tokarev <mjt@tls.msk.ru>, gregkh@suse.de, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Fri, Mar 12, 2010 at 12:38, Peter Korsgaard <jacmet@sunsite.dk> wrot=
e:
>>>>>> "Michael" =3D=3D Michael Tokarev <mjt@tls.msk.ru> writes:
> =C2=A0>> +#ifdef CONFIG_TMPFS
> =C2=A0>> return get_sb_single(fs_type, flags, data, shmem_fill_super,=
 mnt);
> =C2=A0>> +#else
> =C2=A0>> + =C2=A0 return get_sb_single(fs_type, flags, data, ramfs_fi=
ll_super, mnt);
> =C2=A0>> +#endif
> =C2=A0>> }
>
> =C2=A0Michael> May be completely not to the point or even wrong, but =
I were
> =C2=A0Michael> starring at this change for quite some time trying to =
understand
> =C2=A0Michael> what's the difference. =C2=A0Can we do it like this:
>
> =C2=A0Michael> #ifdef CONFIG_TMPFS
> =C2=A0Michael> # define devtmpfs_fill_super shmem_fill_super
> =C2=A0Michael> #else
> =C2=A0Michael> # define devtmpfs_fill_super ramfs_fill_super
> =C2=A0Michael> #endif
> =C2=A0Michael> =C2=A0 =C2=A0 =C2=A0 return get_sb_single(fs_type, fla=
gs, data, devtmpfs_fill_super, mnt);

> Sure, if people find that cleaner - Kay?

=46or the style:
  I would prefer your original version.

=46or the patch:
  Acked-by: Kay Sievers <kay.sievers@vrfy.org>

Thanks,
Kay
