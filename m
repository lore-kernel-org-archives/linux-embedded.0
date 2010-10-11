From: Kieran Bingham <kieranbingham@gmail.com>
Subject: Re: [PATCH 15/16] pramfs: test module
Date: Mon, 11 Oct 2010 13:24:04 +0100
Message-ID: <4CB301E4.40405@gmail.com>
References: <4CB1EBDD.8050509@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=bvChmNwQjhkUZ+7wyM1ALuQQDMtCL5rFAxVfcQpJeNw=;
        b=jSDSJo0/mnK4Z95ut3kMHZm9S55V5O3N8znVhlIo8Tup87DFTC9Ph5Eh3Qj6mHnVHr
         UkCNKJF8Z5iHeK0XOJDf/zjX71xHDHzhihWnSUWs9n2CuIEdrd6PPAHg3iFVs0BXcxUy
         Ieaan6YixZmcLkxH4UJWoHopBvzmhvZF+IL5k=
In-Reply-To: <4CB1EBDD.8050509@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

  On 10/10/2010 17:37, Marco Stornelli wrote:
> From: Marco Stornelli<marco.stornelli@gmail.com>
>
> Test module.
>
> Signed-off-by: Marco Stornelli<marco.stornelli@gmail.com>
> ---
> diff -Nurp linux-2.6.36-orig/fs/pramfs/pramfs_test.c linux-2.6.36/fs/pramfs/pramfs_test.c
> --- linux-2.6.36-orig/fs/pramfs/pramfs_test.c	1970-01-01 01:00:00.000000000 +0100
> +++ linux-2.6.36/fs/pramfs/pramfs_test.c	2010-09-14 18:49:52.000000000 +0200
> @@ -0,0 +1,49 @@
> +/*
> + * FILE NAME fs/pramfs/namei.c
FILE NAME != namei.c
