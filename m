From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 10/16 v2] pramfs: XIP operations
Date: Sat, 06 Nov 2010 16:00:09 +0100
Message-ID: <4CD56D79.5080701@gmail.com>
References: <4CD518EF.3030306@gmail.com> <20101106133330.GC13522@gandalf.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=GfiwpQ1vj4XV2zRCFy1xhDDDuCWwNICcXv2WirVAprw=;
        b=tMayx6ER5cHIu14uAq1XZ27h2oxvm2+ocWhFG/9izCc5lci8KtjRisb5LXOTHt+rfP
         00K31w//cR8/WDb7C8t266BLEROohSx0AbI/hCsU5mfln01e0xhE8WxWJo+ITXmVu3YR
         VDKSMSDsLcdWAERzQtewG/tX0OfebNaIipajI=
In-Reply-To: <20101106133330.GC13522@gandalf.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: James Hogan <james@albanarts.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Il 06/11/2010 14:33, James Hogan ha scritto:
> Hi,
>=20
> On Sat, Nov 06, 2010 at 09:59:27AM +0100, Marco Stornelli wrote:
>> diff -Nurp linux-2.6.36-orig/fs/pramfs/xip.c linux-2.6.36/fs/pramfs/=
xip.c
>> --- linux-2.6.36-orig/fs/pramfs/xip.c	1970-01-01 01:00:00.000000000 =
+0100
>> +++ linux-2.6.36/fs/pramfs/xip.c	2010-09-14 18:49:52.000000000 +0200
> <snip>
>> +static int pram_find_and_alloc_blocks(struct inode *inode, sector_t=
 iblock,
>> +				     sector_t *data_block, int create)
>> +{
>> +	int err =3D -EIO;
>> +	u64 block;
>> +
>> +	mutex_lock(&PRAM_I(inode)->truncate_lock);
>=20
> fs/pramfs/xip.c: In function =91pram_find_and_alloc_blocks=92:
> fs/pramfs/xip.c:27: error: =91struct pram_inode_vfs=92 has no member =
named
> =91truncate_lock=92
> fs/pramfs/xip.c:52: error: =91struct pram_inode_vfs=92 has no member =
named
> =91truncate_lock=92
>=20
> i guess that should be truncate_mutex.
>=20

Oops, my fault, yes it's truncate_mutex. I'll fix it asap.

Marco
