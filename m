From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 16/16] pramfs Makefile and Kconfig
Date: Mon, 11 Oct 2010 09:09:10 +0200
Message-ID: <AANLkTinrRMDshtMQ_iBvRNYeEDQdihtu9ggu++masczR@mail.gmail.com>
References: <4CB1EC2F.7070807@gmail.com>
	<20101010100211.3c747512.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=97C6oswQsQ4OZ2UgYvTai4MOmHPsFFeCWPIx0prmLd8=;
        b=foVLExGOJJzozklAuRK64E9n9VFg8kRuZTNz9wcqCAi/Xcr1cfIs9NvJznKjWzZDyE
         +v4Ijrfb6393XxumZtqzrbyxZ09OUtyA2xQBtUG1ycCn3dMjF6V9G5Y44KJAXm+xc+sf
         g7wlg5+i58CufBNY8l4psSzq1UfSwaNtT1dZ0=
In-Reply-To: <20101010100211.3c747512.rdunlap@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

2010/10/10 Randy Dunlap <rdunlap@xenotime.net>:
> On Sun, 10 Oct 2010 18:39:11 +0200 Marco Stornelli wrote:
>
>> From: Marco Stornelli <marco.stornelli@gmail.com>
>>
>> Makefile and Kconfig.
>>
>> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
>> ---
>> =A0diff -Nurp linux-2.6.36-orig/fs/pramfs/Kconfig linux-2.6.36/fs/pr=
amfs/Kconfig
>> --- linux-2.6.36-orig/fs/pramfs/Kconfig =A0 =A0 =A0 1970-01-01 01:00=
:00.000000000 +0100
>> +++ linux-2.6.36/fs/pramfs/Kconfig =A0 =A02010-09-14 18:49:52.000000=
000 +0200
>> @@ -0,0 +1,72 @@
>> +config PRAMFS
>> + =A0 =A0 tristate "Persistent and Protected RAM file system support=
"
>> + =A0 =A0 depends on HAS_IOMEM && EXPERIMENTAL
>> + =A0 =A0 select CRC16
>> + =A0 =A0 help
>> + =A0 =A0 =A0 =A0If your system has a block of fast (comparable in a=
ccess speed to
>> + =A0 =A0 =A0 =A0system memory) and non-volatile RAM and you wish to=
 mount a
>> + =A0 =A0 =A0 =A0light-weight, full-featured, and space-efficient fi=
lesystem over it,
>> + =A0 =A0 =A0 =A0say Y here, and read <file:Documentation/filesystem=
s/pramfs.txt>.
>> +
>> + =A0 =A0 =A0 =A0To compile this as a module, =A0choose M here: the =
module will be
>> + =A0 =A0 =A0 =A0called pramfs.ko.
>
> =A0 =A0 =A0 =A0 =A0called pramfs.
>
> (we don't add the .ko suffix; well, we try not to do that)

Ok.

>
>> +
>> +config PRAMFS_XIP
>> + =A0 =A0 bool "Enable Execute-in-place in PRAMFS"
>> + =A0 =A0 depends on PRAMFS && !PRAMFS_WRITE_PROTECT
>> + =A0 =A0 help
>> + =A0 =A0 =A0 =A0Say Y here to enable xip feature of PRAMFS.
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0XIP

Ok.

>
>> +
>> +config PRAMFS_WRITE_PROTECT
>> + =A0 =A0 bool "Enable PRAMFS write protection"
>> + =A0 =A0 depends on PRAMFS && MMU
>> + =A0 =A0 default y
>> + =A0 =A0 help
>> + =A0 =A0 =A0 =A0Say Y here to enable the write protect feature of P=
RAMFS.
>> +
>> +config PRAMFS_XATTR
>> + =A0 =A0 bool "PRAMFS extended attributes"
>> + =A0 =A0 depends on PRAMFS
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Extended attributes are name:value pairs associated wi=
th inodes by
>> + =A0 =A0 =A0 the kernel or by users (see the attr(5) manual page, o=
r visit
>> + =A0 =A0 =A0 <http://acl.bestbits.at/> for details).
>> +
>> + =A0 =A0 =A0 If unsure, say N.
>> +
>> +config PRAMFS_POSIX_ACL
>> + =A0 =A0 bool "PRAMFS POSIX Access Control Lists"
>> + =A0 =A0 depends on PRAMFS_XATTR
>> + =A0 =A0 select FS_POSIX_ACL
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Posix Access Control Lists (ACLs) support permissions =
for users and
>> + =A0 =A0 =A0 groups beyond the owner/group/world scheme.
>> +
>> + =A0 =A0 =A0 To learn more about Access Control Lists, visit the Po=
six ACLs for
>> + =A0 =A0 =A0 Linux website <http://acl.bestbits.at/>.
>> +
>> + =A0 =A0 =A0 If you don't know what Access Control Lists are, say N
>
> end sentence with period ('.').

Ok.
