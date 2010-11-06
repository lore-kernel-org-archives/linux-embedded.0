From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 02/16 v2] pramfs: super block operations
Date: Sat, 06 Nov 2010 15:59:34 +0100
Message-ID: <4CD56D56.20005@gmail.com>
References: <4CD51847.20306@gmail.com> <20101106131257.GB13522@gandalf.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=/Hgz9UwFUJrEiW7DjSUeoDBiJwMNp4QvQTlkxqFGemU=;
        b=UGO9tLrbLGqbv5G+LPFSfhZqo+g0Z6EfdbMKbL3CVagJtdhMyMFs2O2syzAdWKK0Fq
         z1WQalQQD+jaV8h2rdV8eAtnkA9k7i2KPVOwkFiC8i4Pmimy1j40CDtcx0P8ke236jYE
         1v2qZFVQ/q71ld5o0rXCn3nQ6igr1oRjpYrrc=
In-Reply-To: <20101106131257.GB13522@gandalf.local>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: James Hogan <james@albanarts.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Il 06/11/2010 14:12, James Hogan ha scritto:
> Hi,
>=20
> On Sat, Nov 06, 2010 at 09:56:39AM +0100, Marco Stornelli wrote:
>> From: Marco Stornelli <marco.stornelli@gmail.com>
>>
>> Super block operations.
>>
>> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
>> ---
>> diff -Nurp linux-2.6.36-orig/fs/pramfs/super.c linux-2.6.36/fs/pramf=
s/super.c
>> --- linux-2.6.36-orig/fs/pramfs/super.c	1970-01-01 01:00:00.00000000=
0 +0100
>> +++ linux-2.6.36/fs/pramfs/super.c	2010-09-25 14:09:47.000000000 +02=
00
> <snip>
>> +	pram_dbg("max name length %d\n", PRAM_NAME_LEN);
>=20
> I get a warning on this line that could be avoided:
>=20
> fs/pramfs/super.c: In function =91pram_init=92:
> fs/pramfs/super.c:308: warning: format =91%d=92 expects type =91int=92=
, but
> argument 2 has type =91long unsigned int=92
>=20
> Cheers
> James
>=20


Mmmm, very strange, I don't have that warning, maybe the compiler
version. I'll fix it with an int cast to avoid it.

Marco
