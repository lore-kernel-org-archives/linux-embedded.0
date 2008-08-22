From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Thu, 21 Aug 2008 20:05:48 -0700
Message-ID: <6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com>
References: <48AD0101.4020505@gmail.com> <48AE19AD.1020209@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=lnrnXAqYF67jhNjJJFfLxQr4AAiilu3/VnJ1f+0EeKs=;
        b=QrupmFtawZQ+t5fXSXaBQ0iTZGehpnvxHyUNlSxe/CdVn8kABBt731wIppX5nwg6WL
         Y7c2/1T2qU/5f7TgWS/wRPFhYPdxhrZ7bI7k0upVO3D/PkvbiK4cjZKqOHE/3ZKVesVq
         YMjsSnm6Ymm/m5UDP+H/wfDY6EBqZtduit1QU=
In-Reply-To: <48AE19AD.1020209@lougher.demon.co.uk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> From this it would appear that if the region data can't be mapped XIP (i.e.
> it is compressed or on a block device), it is cached in its entirety in RAM?

That is correct.

> This implies for block devices that the entire filesystem metadata has to be
> cached in RAM.  This severely limits the size of AXFS filesystems when using
> block devices, or the else memory usage will be excessive.

This is where 64bit squashfs could be a better fit.
