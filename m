From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 04/14] Pramfs: Mounting as root filesystem
Date: Sun, 14 Jun 2009 10:21:17 +0200
Message-ID: <4A34B2FD.20701@gmail.com>
References: <4A33A7D7.3040008@gmail.com> <200906140104.43463.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754635AbZFNIaw@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=vB0/TCHLoDhUPkz5lqY/DWystyfysiDCOL1JTxU11wQ=;
        b=NeXcCjuo8d8GnRVHAmjq3LTIBIDWAUqesBLs0U/A4V6FUsHkpRdKYBeAZCz7FYAHX5
         J83pQUdatAFRaSrgMW6ool5SUFstNr/WNus478L0X4YeN5C36kzPf0enxW13m5C2VuqH
         L2bPPkg//rSRdFntisOM1Ur789Gli33gPbUAc=
In-Reply-To: <200906140104.43463.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Arnd Bergmann wrote:
> On Saturday 13 June 2009, Marco wrote:
>>  void __init mount_root(void)
>>  {
>> +#ifdef CONFIG_ROOT_PRAMFS
>> +       if (MAJOR(ROOT_DEV) == MEM_MAJOR) {
>> +               if (mount_pramfs_root())
>> +                       return;
>> +
>> +               printk(KERN_ERR "VFS: Unable to mount root fs via PRAMFS, trying floppy.\n");
>> +               ROOT_DEV = Root_FD0;
>> +       }
>> +#endif
> 
> AFAICT, this will prevent booting from /dev/ram0 with a regular file system,
> because that also uses MAJOR(ROOT_DEV) == 1.
> 
> 	Arnd <><
> 

Mmm...MEM_MAJOR and RAMDISK_MAJOR have the same value and pramfs works
in memory. We could simply use /dev/null (there was an error in the
submitted kconfig description, my intention was to use /dev/mem). In
that case I can use UNNAMED_MAJOR. PRAMFS root option is not enabled if
it's already enabled the NFS one. What do you think?

Marco
