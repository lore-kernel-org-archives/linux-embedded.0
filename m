From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 04/16 v4] pramfs: file operations
Date: Wed, 24 Nov 2010 09:11:13 +0100
Message-ID: <AANLkTinF2NX9e7deTvDa8zQ0PA4u0ch0xrNWk0FaqvGV@mail.gmail.com>
References: <4CE79BD0.3030200@gmail.com>
	<20101124075818.GB2212@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=nPiDRDKuqmm50XyRVHoTkMMzFrMswwuCr6NJaoCySZ0=;
        b=rnnS7UWsEtwYmcPfPvoJeqbl874XnQ/uJD+kJVaqQ0Hl52Zt89/Vgia3gL9ynT/TFi
         1BtLxkXAsVf8velu8bMzZZ/tCWBlfFkNcDT4nhQDBt3PIfLAM+A2eFPzx7EHbFCWtyvN
         mNQ1LFppIq2V6xQCGLpT1qkeMSkHwngHkdatk=
In-Reply-To: <20101124075818.GB2212@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Paul Mundt <lethal@linux-sh.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Tim Bird <tim.bird@am.sony.com>, Greg Kroah-Hartman <gregkh@suse.de>

2010/11/24 Paul Mundt <lethal@linux-sh.org>:
> On Sat, Nov 20, 2010 at 10:58:40AM +0100, Marco Stornelli wrote:
>> diff -Nurp linux-2.6.36-orig/fs/pramfs/file.c linux-2.6.36/fs/pramfs=
/file.c
>> --- linux-2.6.36-orig/fs/pramfs/file.c =A0 =A0 =A0 =A01970-01-01 01:=
00:00.000000000 +0100
>> +++ linux-2.6.36/fs/pramfs/file.c =A0 =A0 2010-09-24 18:34:03.000000=
000 +0200
>> @@ -0,0 +1,166 @@
>> +/*
>> + * FILE NAME fs/pramfs/file.c
>> + *
>> + * BRIEF DESCRIPTION
>> + *
>> + * File operations for files.
>> + *
> This FILE NAME / BRIEF DESCRIPTION thing should probably die, it's al=
so
> not used consistently throughout the series.

Maybe yes, it's more a problem then a advantage :)

>
>> +static int pram_open_file(struct inode *inode, struct file *filp)
>> +{
>> +#ifndef CONFIG_PRAMFS_XIP
>> + =A0 =A0 /* Without XIP we force to use Direct IO */
>> + =A0 =A0 filp->f_flags |=3D O_DIRECT;
>> +#endif
>> + =A0 =A0 return generic_file_open(inode, filp);
>> +}
>> +
> Relying on a config option for this is in violently poor taste. Rely =
on
> the config option to enable/disable XIP support as you like, but whet=
her
> it's actually mounted XIP or not should really depend be determined b=
y a
> mount option. Presently you have no way of dealing with the file syst=
em
> being mounted multiple times with mixed XIP and non-XIP, which doesn'=
t
> seem like a particularly exotic configuration. As you seem to have co=
pied

Maybe on embedded, it could be.

> most of this from ext2, I'm curious why you opted to hardcode this
> instead of maintaining the flexibility that ext2 XIP has over this.
>

=46irst of all because it was simpler :) In addition there was some
design problem to use it in combination with the memory protection.
The difference with ext2 is that we aren't talking about a general
purpose fs used (mainly) on normal desktop/server systems, but a
specific fs for embedded world, so I think some little constraints are
ok.

Marco
