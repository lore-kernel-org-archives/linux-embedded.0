From: Kieran Bingham <kieranbingham@gmail.com>
Subject: Re: [PATCH 11/16] pramfs: ACL management
Date: Mon, 11 Oct 2010 13:26:14 +0100
Message-ID: <4CB30266.1010706@gmail.com>
References: <4CB1EAD8.2030206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=nNg/N4P6vX2LcQO/4hzhuggzAQMkpdF+84IYCeOhtbk=;
        b=b0AK7yz08I2i/JdNDEoavD2HulfmDxJrjAKeywW4DXSJFLBBd6ov8pUFWEXF4b2Eg1
         c7S2W5OaJ3HP0iZvXmVW9zXM6AsXG6ONQoBfRJhhYpD3hkIT9DTbIvsTnZJ+CJMHXIo8
         sQAx1c68kJDSNCJ5IOHQra3JmA4IjeabsIuRg=
In-Reply-To: <4CB1EAD8.2030206@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

  On 10/10/2010 17:33, Marco Stornelli wrote:
> From: Marco Stornelli<marco.stornelli@gmail.com>
>
> ACL operations.
>
> Signed-off-by: Marco Stornelli<marco.stornelli@gmail.com>
> ---
> diff -Nurp linux-2.6.36-orig/fs/pramfs/acl.c linux-2.6.36/fs/pramfs/acl.c
> --- linux-2.6.36-orig/fs/pramfs/acl.c	1970-01-01 01:00:00.000000000 +0100
> +++ linux-2.6.36/fs/pramfs/acl.c	2010-09-14 18:49:52.000000000 +0200
> @@ -0,0 +1,418 @@
> +/*
> + * FILE NAME fs/pramfs/acl.h
Found another one :)
FILE NAME != acl.h ...
--
KB
