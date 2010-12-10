From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 2/2] Squashfs: Add XZ compression configuration option
Date: Fri, 10 Dec 2010 06:23:44 +0000
Message-ID: <4D01C770.1080301@lougher.demon.co.uk>
References: <4D007315.1090704@lougher.demon.co.uk> <AANLkTimUYrb8EMomgmsW+v7ttbkUH0P57SBD5M4_AGmU@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimUYrb8EMomgmsW+v7ttbkUH0P57SBD5M4_AGmU@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, Linux Embedded Maillist <linux-embedded@vger.kernel.org>, Lasse Collin <lasse.collin@tukaani.org>, Andy Whitcroft <apw@canonical.com>

Geert Uytterhoeven wrote:
> On Thu, Dec 9, 2010 at 07:11, Phillip Lougher
> <phillip@lougher.demon.co.uk> wrote:
>> --- a/fs/squashfs/Kconfig
>> +++ b/fs/squashfs/Kconfig
>> @@ -53,6 +53,22 @@ config SQUASHFS_LZO
>>
>>          If unsure, say N.
>>
>> +config SQUASHFS_XZ
>> +       bool "Include support for XZ compressed file systems"
>> +       depends on SQUASHFS
>> +       default n
> 
> "default n" is the default, no reason to specify it.
> 

Yes, thanks for pointing that out.

It seems there's a lot of "default n"s in the mainline kernel

% find . -name "Kconfig"| xargs grep "default n" | wc
     485    1535   18753

including two in arch/m68k ;-)

Phillip

