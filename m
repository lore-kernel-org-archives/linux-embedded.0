From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 08/14] Pramfs: Makefile and Kconfig
Date: Sun, 14 Jun 2009 09:15:59 +0200
Message-ID: <4A34A3AF.5060900@gmail.com>
References: <4A33A802.8040507@gmail.com> <20090613135604.GB30053@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=beuJdD5sRfWo7QSAEdBDh7hgWDgwpQUFPC7HS6M3SCA=;
        b=Ttz9J6A3gffmSbHWa6iVIPrFvQ2nUQO+p2UhE1XmKim/tT6T1rBkutQZGP64SykFTA
         aJp8Ha6ZVVcBw4efIuyOClvb5TlV5LXjn94yWxq7VMFSjLwwefWZ7tFT/JPQsB9krOdN
         /+Y6YdRs6iuIl3UbhTsPyB43Prjp7pm2PXCNA=
In-Reply-To: <20090613135604.GB30053@uranus.ravnborg.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Sam Ravnborg wrote:
>> +
>> +config PRAMFS_NOWP
>> +	bool "Disable PRAMFS write protection"
>> +	depends on PRAMFS
>> +	default n
>> +	help
>> +	   Say Y here to disable the write protect feature of PRAMFS.
> n is default so "default n" is not needed.
> If you reverse the logic (and add a default y) then..
> 
>> +ifneq ($(CONFIG_PRAMFS_NOWP),y)
>> +pramfs-objs += wprotect.o
>> +endif
> This is a trivial:
> pramfs-$(PRAMFS_WRITE_PROTECT) += wprotect.o
> 
> (I renamed the option to something more descriptive - please do so in the abvoe).
> 
> 
>> +++ linux-2.6.30/fs/pramfs/Makefile	2009-04-19 11:58:51.000000000 +0200
>> @@ -0,0 +1,13 @@
>> +#
>> +# Makefile for the linux pram-filesystem routines.
>> +#
>> +
>> +obj-$(CONFIG_PRAMFS) += pramfs.o
>> +obj-$(CONFIG_TEST_MODULE) += pramfs_test.o
>> +
>> +pramfs-objs := balloc.o dir.o file.o inode.o namei.o super.o symlink.o
> 
> Use:
> pramfs-y := balloc.o ...
> 
> This match usa later in this file.
> 
>> +
>> +ifneq ($(CONFIG_PRAMFS_NOWP),y)
>> +pramfs-objs += wprotect.o
>> +endif
>> +pramfs-$(CONFIG_PRAMFS_XIP) += xip.o
> 
> 
> 	Sam
> 

Ok, thanks.

Marco


