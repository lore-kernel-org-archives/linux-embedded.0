From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Fri, 22 Aug 2008 10:43:52 -0700
Message-ID: <6934efce0808221043i3d463ac2gb54b7dd4cfde4b81@mail.gmail.com>
References: <48AD0101.4020505@gmail.com> <48AE19AD.1020209@lougher.demon.co.uk>
	 <6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com>
	 <200808221852.38950.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=XQsKcwtOlmtHZxt8NA0Ry4j4w96Hy7n/6JUTDYo5g6I=;
        b=sCn1QMXRHywVFYWibMuo/UHT0E4KXgMkyovOgID9mIjSw+uycmlrCld51XvlExp1A/
         s+HgwV1FSn7d0nnMlodYdIP2sTgMDg3tLYwpiyuUtnKrZhUJEvtajfr6me1DnXc3VCY/
         mhjIegka/jRL9EaapmV8H2t5rpbmEuKihbTys=
In-Reply-To: <200808221852.38950.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> It certainly sounds like something for your medium-term TODO list,
> although I wouldn't think of it as a show-stopper.

Maybe.  It more of a feature rather than a bug.  It makes stat() and
such fast.  The trade off is RAM...
