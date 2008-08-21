From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 07:12:00 -0700
Message-ID: <6934efce0808210712u36144c78mb7f1998414a549cf@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com> <48AD42AE.4030107@de.ibm.com>
	 <200808212043.51209.nickpiggin@yahoo.com.au>
	 <200808211453.26233.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=XG2OQ9juyIYjU7M4Ljgf5xrTMn82gjVtl1+xJxnOYlY=;
        b=gCX7xnFamWEJn9SzSDuAYWS3Pqti2IbkBT38LO0+/q31DBh24DEc/s47hT01vZzFgj
         xIiqa67BQcCf3TUkXmptFF8dMTYI/GuQ/Dmi1mUbexF81kozt+9XJoMtlkHP14GbZkB2
         fUO5PI9Nnu+bhLG+RFtAaTTOcJK+mUBjJZJN0=
In-Reply-To: <200808211453.26233.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Piggin <nickpiggin@yahoo.com.au>, carsteno@de.ibm.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com

> One thing that would be really nice is if you could add fake-write
> support in the way that I proposed for cramfs a few months ago.
> This would make axfs much more interesting for another set of
> users, and keep cramfs a really simple example file system.

Did that get merged?
