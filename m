From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Fri, 22 Aug 2008 10:42:47 -0700
Message-ID: <6934efce0808221042u6d0c21eft6f8cdf67f0217a85@mail.gmail.com>
References: <48AD0101.4020505@gmail.com> <48AE19AD.1020209@lougher.demon.co.uk>
	 <6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com>
	 <200808221852.38950.arnd@arndb.de>
	 <48AEF976.1010705@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=+VmvOqnH9R1nVMisbFtTbII+1mhOEGhfXh/7wIIiYEs=;
        b=IAi1XWnfCDA7KQmYnUx+FVkPiI+5MLCMat4lvW53LVEHGyulEwsipq/Po3J0q5y9l0
         SKH9HMIR9NpTJyPqBfdOmfyp5Xd7GjF01dykIuybAV1Pz/PEx5nVV3Vf2defJOY4ZbC+
         nJm1JFvDP49laU5kJ4HRjAXbNL2AaQwx6o2NI=
In-Reply-To: <48AEF976.1010705@lougher.demon.co.uk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> Squashfs and AXFS should be seen as complementary filesystems, and there
> should be room in the Linux kernel for both.

Exactly.  We had different design assumptions.  One is not _better_
than the other, they are just different.
