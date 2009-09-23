From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: GPIO driver for MPC8313.
Date: Wed, 23 Sep 2009 13:04:32 +0200
Message-ID: <87r5txrkfz.fsf@macbook.be.48ers.dk>
References: <cb9ecdfa0909222055x1d691698sb516b5b8f5f81d@mail.gmail.com>
	<87y6o6rvvc.fsf@macbook.be.48ers.dk>
	<cb9ecdfa0909230352w77a37f59h3c7f1e146121f9f6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:to:cc:subject
         :references:from:date:in-reply-to:message-id:user-agent:mime-version
         :content-type;
        bh=8iQJHEL7Rpz7uO2tAAN+6M4nBf3/ywNilX9wm3dYs4U=;
        b=DHv9wfbhMgsx4KwWvDBbLMTz9jGHOEi3BPC3R9qh5v7ZQEwjKCwJqqstflBjc7C/D8
         DEdR/lTrgknqExfOf6lEaZXQW/Lw39qO4d0AQSprnAEvNk4Gm4Mq9yqWE8vNFvMRjLAM
         RHfeNMrPhtlOPTeFqfE+WCoaKBd9d5YCn0T68=
In-Reply-To: <cb9ecdfa0909230352w77a37f59h3c7f1e146121f9f6@mail.gmail.com> (Johnny Hung's message of "Wed\, 23 Sep 2009 18\:52\:24 +0800")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org

>>>>> "Johnny" == Johnny Hung <johnny.hacking@gmail.com> writes:

 Johnny> Thanks, got it. BTW, how to trigger GPIO level in user space
 Johnny> application? I also found
 Johnny> arch/powerpc/platforms/52xx/mpc52xx_gpio.c is a good
 Johnny> example. Any reply is appreciate.

Through sysfs. See 'Sysfs Interface for Userspace' section of
Documentation/gpio.txt

-- 
Bye, Peter Korsgaard
