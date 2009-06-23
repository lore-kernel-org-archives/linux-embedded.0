From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Tue, 23 Jun 2009 08:40:25 +0200
Message-ID: <2ea1731b0906222340o13e9cf0fu7e15cddadf27bbbb@mail.gmail.com>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de>
	 <4A3FC7F1.5050108@gmail.com> <200906222033.20883.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=UwmOIkQDgSQGCBGXs8K7DtDOn7EQ9DWhd8qwnWSoTbg=;
        b=cMoBzAlVtTAYA+HobCBcVd2rcEe0VBk26jm8qKtYVkJN/504nz46IwA12PsQa1LUoU
         ts6nCvTFUk09G4aQMmKH0L8DXOz7ruKX9jejvquKWYrGiaoSCmX1WtMfiikneKmU8K/3
         PDQn5fmovfoKNzqUyr1wdHvXDUDQj0Zplcmb4=
In-Reply-To: <200906222033.20883.arnd@arndb.de>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

2009/6/22 Arnd Bergmann <arnd@arndb.de>:
> On Monday 22 June 2009, Marco wrote:
>>
>> Sorry, I meant it's not currently possible. At the moment the only w=
ay
>> to use it as rootfs it's to copy all the data in an already mounted
>> (empty) ram partition and reboot. However it's not my first item on =
my
>> todo list because I think that it's possible to use it as rootfs but=
 it
>> isn't the standard use for this fs.
>
> Well, it doesn't have to work right away. What I'm asking to
> define the data structures in a way that keeps the layout stable
> across kernel updates. Since a future version of the file system
> might support cross-endian image creation, it would be good to
> define the data structures in a fixed endian mode already, so
> you don't have to change it in the future.
>
> =A0 =A0 =A0 =A0Arnd <><
>

I was refering to create a tool "mkpramfs".

Marco
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
