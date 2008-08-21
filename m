From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Thu, 21 Aug 2008 08:06:50 -0700
Message-ID: <6934efce0808210806r701f2e3bo677d2bd2da78faec@mail.gmail.com>
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760015AbYHUPHG@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Am1XcVjWpi5sVlvmldBb3oztVpGoQXNT94nme/jHODc=;
        b=F7eE3J3mHqWhSJMMtWTYiIT9tqIq5cadwIJHIO/odUkm9UM563zGc/ZuMWvRQfbHU5
         DKh1etCh4XOY8U3BkGSp3o5iZreqMWzk1DdT8fwLX7AdrAH+64PYQD3CuD/pYDh0dEZH
         H2eALffhJz0EolyBpYhByyCHLOds7E5c8MoOg=
In-Reply-To: <200808211417.14425.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> Have you seen any benefit of the rwsem over a simple mutex? I would guess
> that you can never even get into the situation where you get concurrent
> readers since I haven't found a single down_read() in your code, only
> downgrade_write()

We implemented a rwsem here because you can get concurrent readers.
My understanding is that downgrade_write() puts the rewem into the
same state as down_read().  Am I mistaken?
