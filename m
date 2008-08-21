From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 07:30:03 -0700
Message-ID: <6934efce0808210730y77db925cg263c957abb056fea@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com> <48AD42AE.4030107@de.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=3pZKfAuDL9IsRRzYorzvPBSBUBZMghN21EAVSvgR+j0=;
        b=bdgf4lmwdBlv08mXJWuxK2vbzMFFtvckVqUfcZIMwuQ3zlqX8w+IxzC517hhl9rYN5
         ePe3DDTzHuMwqbmhLfRiWoK28KYtFXLUbQOe2q/Nx3LMYNKdoDl2dRcLCM0kVZajFxzq
         Dj0Tp2IDm74tNAw9EOPY5WxNITEMpo1kJzS3I=
In-Reply-To: <48AD42AE.4030107@de.ibm.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: carsteno@de.ibm.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, nickpiggin@yahoo.com.au

> I like the general approach of it. It's much more flexible than the ext2
> extension I've done, and the possibility to select XIP vs. compression per
> page is really really neat. I can imagine that people will prefer this over
> the ext2 implementation on s390. It is unclear to me how the "secondary
> block device" thing is supposed to work. Could you elaborate a bit on that?

First off we don't yet support direct_access(), but I am planning on that soon.

Sure.  For a system that has say a NOR Flash and a NAND or a embedded
MMC, one can split a filesystem image such that only the XIP parts of
the image are on the NOR while the compressed bits are on the NAND /
eMMC.  The NOR part is accessed as directly addressable memory, while
the NAND would use mtd->read() and the eMMC would use block device
access API's.  In this case I would call this NAND or eMMC the
"secondary device" because the primary device is the NOR.

Assuming my NOR was at /dev//mtd2 and my NAND at /dev/mtd5.  I would
call the following to mount such a system:

mount -t axfs -o second_dev=/dev/mtd5 /dev/mtd2 /mnt/axfs
