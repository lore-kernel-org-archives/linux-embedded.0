From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH 15/16 v2] pramfs: test module
Date: Sat, 6 Nov 2010 08:49:40 -0700
Message-ID: <20101106084940.d3672f06.randy.dunlap@oracle.com>
References: <4CD51958.6040308@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4CD51958.6040308@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

On Sat, 06 Nov 2010 10:01:12 +0100 Marco Stornelli wrote:

> From: Marco Stornelli <marco.stornelli@gmail.com>
> 
> Test module.
> 
> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
> ---
> diff -Nurp linux-2.6.36-orig/fs/pramfs/pramfs_test.c linux-2.6.36/fs/pramfs/pramfs_test.c
> --- linux-2.6.36-orig/fs/pramfs/pramfs_test.c	1970-01-01 01:00:00.000000000 +0100
> +++ linux-2.6.36/fs/pramfs/pramfs_test.c	2010-09-14 18:49:52.000000000 +0200
> @@ -0,0 +1,49 @@
> +/*
> + * FILE NAME fs/pramfs/namei.c
> + *
> + * BRIEF DESCRIPTION
> + *
> + * Pramfs test module.


Wrong FILE NAME.  Better to just omit it completely.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
