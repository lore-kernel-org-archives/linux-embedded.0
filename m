From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Fri, 22 Aug 2008 11:04:08 -0700
Message-ID: <6934efce0808221104w1609bea8mbbff54019c261d80@mail.gmail.com>
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de>
	 <48AE22F5.3000309@lougher.demon.co.uk>
	 <200808221200.26052.arnd@arndb.de>
	 <48AEF2A3.7020905@lougher.demon.co.uk>
	 <20080822171959.GA30977@logfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756615AbYHVSEb@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=YlSc/Q6C/JKO05b5TZ5qL02yQiRe8TgaYht5IEYKg14=;
        b=WKFCVJN0634sepbnavA12bTZ7DIq/HkFaV6Ta3+P05bUCGuG898T8ibjzezzmNeYbW
         3kV1KQhw/NvB2zL1Zim/DQJQfnqz5CtjEicmoUeY/Q10dNPYWYwn+OLyjjs4FyXo1kSF
         kzAypO3kMv5K+KceCMXwx6TmPQDphJMOwTPrc=
In-Reply-To: <20080822171959.GA30977@logfs.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, Arnd Bergmann <arnd@arndb.de>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> Elsewhere in this maze of threads Arnd claimed to have tested the
> benefits of metadata compression - and it making little impact.
>
> My guess is that it would make a large impact if metadata would be a
> significant part of the filesystem image.  Usually metadata is close
> enough to 0% to be mistaken for statistical noise.  So compressing it
> makes a significant impact on an insignificant amount of data.

Like I said early it depends on the value you assign to significant.
For a fs sizes I started designing to 16MB-64MB if you have to track a
whole bunch of 8Byte numbers for every symlink, dev node, inode, and
page.  It adds up quickly to a couple of MB, that can translate to
lots of money.  Even at only an extra $0.25 a system * 12Million units
= $3Million.
