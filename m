From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
Date: Thu, 21 Aug 2008 13:05:59 -0700
Message-ID: <6934efce0808211305j349dc0fbo1cb122c0c5159ac0@mail.gmail.com>
References: <48AD00E6.2070505@gmail.com> <200808211331.36346.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Gb25uNBh0+At78OXtH0Y3Deav+jnbV8HC0oJD+fh65g=;
        b=nJzn6Sh6S9ivbRXFxkH11C4TdyOPm6rfs52Iy6DcDgycr077iRJgsBTgXyODvSNqId
         EmI9ALh4XXGBGNmcT27Ha7qZ3hfe7NZeeOUi9ECBpR4x59lEnaBHfaYeNAjSPecdqJ4h
         YqA+Beux7tys5SqXildjbYMbe8cX2sX5xhAVA=
In-Reply-To: <200808211331.36346.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

>> +#define AXFS_PAGE_SIZE 4096
>
> What happens on systems where AXFS_PAGE_SIZE != PAGE_SIZE?

Right now, bad things I imagine.  I meant to revisit this, there was
some reason during development for this, I don't remember.  No reason
for AXFS_PAGE_SIZE I think.
