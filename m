From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 11/16] pramfs: ACL management
Date: Mon, 11 Oct 2010 18:50:43 +0200
Message-ID: <4CB34063.70803@gmail.com>
References: <4CB1EAD8.2030206@gmail.com> <4CB30266.1010706@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=lXy9yz5dPsOp7TaPxt6l8jkz2gT9dZ+/FAfIyHoY8K0=;
        b=jdDQzrruaMvGcV074/RvqzjUKRe0jtDcgnrCJOO730vHJS2eTpn+EEkcnhzRMXGs4+
         ug5seEWdJBz0oflq4zm1geg5IVCGJDRJQl2o0sxVXDQYm2jkYY77e6tdj7iRNrkNez35
         CNVBI04y66PMbdUI5FEksvWzkCKfgieGbWrkY=
In-Reply-To: <4CB30266.1010706@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kieran Bingham <kieranbingham@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

Il 11/10/2010 14:26, Kieran Bingham ha scritto:
>  On 10/10/2010 17:33, Marco Stornelli wrote:
>> From: Marco Stornelli<marco.stornelli@gmail.com>
>>
>> ACL operations.
>>
>> Signed-off-by: Marco Stornelli<marco.stornelli@gmail.com>
>> ---
>> diff -Nurp linux-2.6.36-orig/fs/pramfs/acl.c linux-2.6.36/fs/pramfs/acl.c
>> --- linux-2.6.36-orig/fs/pramfs/acl.c    1970-01-01 01:00:00.000000000
>> +0100
>> +++ linux-2.6.36/fs/pramfs/acl.c    2010-09-14 18:49:52.000000000 +0200
>> @@ -0,0 +1,418 @@
>> +/*
>> + * FILE NAME fs/pramfs/acl.h
> Found another one :)
> FILE NAME != acl.h ...
> -- 
> KB
> 

Oops, damn copy&paste ;) I'll fix it asap.

Thanks.

Marco
