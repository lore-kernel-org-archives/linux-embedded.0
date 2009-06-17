From: Marco <marco.stornelli@gmail.com>
Subject: Re: Re: [PATCH 14/14] Pramfs: XIP Operations
Date: Wed, 17 Jun 2009 18:57:48 +0200
Message-ID: <4A39208C.3010801@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=hdrtSpKqGG6n+/Zm9FeiRb9v37rcASDPkgSmkgJTwvA=;
        b=HgAZ9HBHAx5AXPfl6wg8bjLWfv0inQ85D93vIStz6/k1HW1mOa4gotBtH2VruF+xJl
         6AK2dduZpHeouOZvBFxst6PKj3JFdQeJzpPsP7cd1/r78Gv7UFw8nu1IN3u9j7SerTji
         Q19HDowUMi41Rw/GDacGSaCJsjKbJMC6Ehz/8=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS Devel <linux-fsdevel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Jared Hulbert wrote:
> > I know. It wasn't my intention to introduce it but as I said in my
> > first patch I've done a porting of this code from 2.6.10 and to
> > remove it I need time to analyze well the code to avoid deadlock and
> > so on. If someone would like to help me I'd really appreciate it.
> > However I see the use of BKL even in other recent "mainlined" fs as
> > ext4, so I preferred to move the porting effort on other areas.
> > However it's the first item on my todo list.

> Why do you need the lock in pram_find_and_alloc_blocks() to begin
> with?  Why wouldn't a mutex work?

It's not impossible to use a mutex, but as I said it's inherited from
code written for 2.6.10. This function works as
pram_get_and_update_block works.

Marco
