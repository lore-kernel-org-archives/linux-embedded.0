From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH] Kconfig: XIP doesn't depend on block
Date: Mon, 7 Feb 2011 08:52:41 +0100
Message-ID: <AANLkTi=T3TGYcxm2=C6QtYss09H9R+m0Zk9KDQepMqiL@mail.gmail.com>
References: <4D4EBAF4.9070403@gmail.com>
	<20110206084440.a6c2df3b.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=CaMFObvC7uaDytQlMqZtg0CWRSSqhS1LQSAxp2IVa8o=;
        b=D86EoYJsKW2okMNdZzZDkoBaG73DCSVuNhL6IcLFsSKaxuiYpZRLXUVkMczNnQauwE
         jmZ946JiuySWatP5fOSFG5cIQX4gthpTOhGHNu7wbtGqnjP7J23BiISAL4hWaQo4H3UW
         KZVC7dYt9UgYBmu62sD2lMTkH6ETpXnO1y6zY=
In-Reply-To: <20110206084440.a6c2df3b.rdunlap@xenotime.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

2011/2/6 Randy Dunlap <rdunlap@xenotime.net>:
> On Sun, 06 Feb 2011 16:15:00 +0100 Marco Stornelli wrote:
>
>> From: Marco Stornelli <marco.stornelli@gmail.com>
>>
>> XIP doesn't depend on block symbol, then we can reorder the Kconfig.
>> For ext2 doesn't change the Kconfig behavior but if other fs will us=
e
>> FS_XIP it won't need to include block support if not needed.
>
> Hi Marco,
>
> Do you know of a filesystem where this matters?
>

Yes, for example mine (pramfs) :)

>> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
>> ---
>>
>> --- Kconfig.orig =A0 =A0 =A02011-01-19 00:14:02.000000000 +0100
>> +++ Kconfig =A0 2011-02-06 16:04:51.000000000 +0100
>
> This filename should include path, like
> --- fs/Kconfig.orig
> +++ fs/Kconfig
>
>> @@ -9,13 +9,6 @@ if BLOCK
>> =A0source "fs/ext2/Kconfig"
>> =A0source "fs/ext3/Kconfig"
>> =A0source "fs/ext4/Kconfig"
>> -
>
> The 3 filesystems above are immediately under:
>
> if BLOCK
>
> so ext[234] depend on BLOCK. =A0Why would it matter about FS_XIP?
>

I don't know but for example even POSIX ACL was under "if BLOCK",
maybe there is only an historical refuse.

Marco
