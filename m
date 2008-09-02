From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Tue, 2 Sep 2008 09:44:19 -0700
Message-ID: <6934efce0809020944s36dd7f82wec77c4189ef1b114@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com>
	 <Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
	 <6934efce0808220951i5a2cd6f9t70f9c522eae6f1d6@mail.gmail.com>
	 <Pine.LNX.4.64.0808281737150.28552@vixen.sonytel.be>
	 <Pine.LNX.4.64.0809021725480.3986@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=c7HlGbIxp48VDVbL5M//t82mAu1xXw+zb02cZt5z2jg=;
        b=fFoakevOL1KDIU8JYM4J9vIctv8QjJX604eXW0ZCzcCrp1EJ3M2qGpix6KA9D/lUiw
         RDPDlWFV/jNN7wLCilHR/mndYL12U3v0ukj1Ykx24Sj0p6xAb86ozHdkPNfpXc2JfGwa
         YxCLMDpRBuLUt/0rwwPSmSKTnZooCNObzZmDc=
In-Reply-To: <Pine.LNX.4.64.0809021725480.3986@vixen.sonytel.be>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> I found what's wrong.
>
> The size of an AxFS image created by mkfs.axfs is always n*4096+4 bytes large.
> So when it wants to check the magic value in the last 4 bytes, the block layer
> tries to read a whole 512-byte sector, which fails for loop-mounted images.
>
> If you test on real FLASH, additional bytes after the end of the AxFS image can
> be read, hence it works.
>
> By padding the image with 508 zero bytes, I can mount it, on both PS3 (ppc64)
> and UML (ai32). I can even read images created on PS3.

Right.  We haven't tested loopback since we added the magic end value.

How is one expected to read those last 4 bytes of a loopbacked file?
Are they unreadable?  We can add the padding.   I am just wondering if
this is a bug or a known limitation in the loopback handling or if
there is a different safer way of reading block devs with truncated
last blocks.

> However, there still are weird things going on, like `find' not seeing all
> files and directories, or just aborting, and `ls -lR' showing actual file
> contents in its output.

Do you see this behavior for all builds for just the PS3?
