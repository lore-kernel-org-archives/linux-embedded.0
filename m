From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Thu, 21 Aug 2008 08:17:21 -0700
Message-ID: <6934efce0808210817h489bbeafyaf27217ca68bd31e@mail.gmail.com>
References: <48AD00F8.1030004@gmail.com> <200808211339.37187.arnd@arndb.de>
	 <6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com>
	 <200808211706.37761.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=bCFyOQICpeirCaCUNGrWCcvzYTn1BbDNWTBVKdO9V+0=;
        b=XTSV/RrBWE3tKpXwKBkzZsPo2TRb0GfvUotZHvQYTP2aBRNO9Xj8HewafK2lshcbtS
         OuBI8750kKhp+DLp4tuZHAF4P1ZKO9WxeZFOphMNzrx/E4ztnr0a3YCcRvE6EEbWa2Hz
         7q9Kmsw45PrMUjOzvZXA49AkxCD8gmcOUpbUk=
In-Reply-To: <200808211706.37761.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>, carsteno@de.ibm.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>

> /proc has the same ABI restrictions as sysfs. We more or less stopped
> allowing new files in /proc some 5 years ago for this reason. I didn't
> even read beyond the word /proc to know that what you do here is wrong.
> debugfs is normally easier to use than procfs as well, you just
> define some file_operations with read/write callbacks and call
> debugfs_create_file with the path name below /sys/kernel/debug.

no /proc.
thanks for the explanation.

So /sys/kernel/debug/axfs/volume0 would work?

> 4) no profiling at all
> The profiling code has certainly been useful to you during development,
> and you should keep that code around for your own work on it,
> but maybe you should not push that upstream, because regular users
> are not going to need it.

Nope.  Profiling is absolutely fundamental to how AXFS works.  Read
the [PATCH 00/10] thread again.
