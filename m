From: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 14/14] Pramfs: XIP operations
Date: Tue, 16 Jun 2009 19:15:03 -0700
Message-ID: <6934efce0906161915t280bf69ek450b3c6220a7d379@mail.gmail.com>
References: <4A33A841.6080902@gmail.com>
	 <20090613140647.GD30053@uranus.ravnborg.org>
	 <4A34A3C0.80103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=IeQiMeYAhD8oGBvzJ738KxqwqpVtz/onWhhVuETqZOw=;
        b=iVbHkrrI7wQ0SQqAP57EgquNPWyGgAIzdZLVOvul5XQTB+4zysJ5TJWsp7O7Hx97D7
         QsbjBBOnSUMQPNdEptTnwvwnACBdpiXwn7VeRh9AYfeTDQonFFxzEJncl9wqOjeNNiwD
         vs8vSfjuTUZZ32jlDkbk3vu/LhjgTtp+af6zk=
In-Reply-To: <4A34A3C0.80103@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco <marco.stornelli@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

> I know. It wasn't my intention to introduce it but as I said in my first
> patch I've done a porting of this code from 2.6.10 and to remove it I
> need time to analyze well the code to avoid deadlock and so on. If
> someone would like to help me I'd really appreciate it. However I see
> the use of BKL even in other recent "mainlined" fs as ext4, so I
> preferred to move the porting effort on other areas. However it's the
> first item on my todo list.


Why do you need the lock in pram_find_and_alloc_blocks() to begin
with?  Why wouldn't a mutex work?
