From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 12:32:13 -0700
Message-ID: <6934efce0808211232i21fcf347vb6baa6502246adb2@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com>
	 <ac9c93b10808202332n2654884eh877848df2da59f20@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=ROjE+7R/NRJVYvDjlKL143F5BHAMLslfFpRSyCdyf+k=;
        b=h3bqlxFGbMXzWJl8KB+xJVapNpPDncU/nws50P7E4H0cpxxHXKGRZw8EGKfYOYpMDv
         3rwLDK0XXsA2fo+7voFyipXH4BnxoJAxU/K67iPkk1m5c6OX00cizgPR+r23SmWl7zKt
         +8dw8cS9h865tENplLBNRaZ0NowJTP8WY9nx4=
In-Reply-To: <ac9c93b10808202332n2654884eh877848df2da59f20@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> Jared, nice work!

Thanks.

> A few questions:

I meant to address these before.  Sorry.

> - how does this benchmark compared to cramfs and squashfs in a NAND-only system
>  (or is it just not a good plan to use this with NAND-only (of course
> I won't get XIP with NAND, I understand that)

I don't know, I'm interested to find out.  I just benchmarked that.
Actually it should work very well as a NAND-only fs.  Also you do get
something like XIP with NAND.  If you boot an XIP AXFS image on NAND
or a blkdev it will copy that XIP region into RAM and "XIP" it from
there.  I think this will make it very good for LiveCD's.  Though we
just (minutes ago) realized our testing of that feature was flawed, so
no guarantees.

> - would axfs be suitable as a filesystem on a ram disk?

It could be.  I plan on implementing support for brd.  That might work nicely.
