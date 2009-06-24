From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Wed, 24 Jun 2009 18:49:41 +0200
Message-ID: <4A425925.7000601@gmail.com>
References: <4A33A7EC.6070008@gmail.com> <200906232355.34134.arnd@arndb.de> <2ea1731b0906232332n2488d452p27419eac7edab7e4@mail.gmail.com> <200906241730.37151.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1761576AbZFXQx7@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=uUYRLwySLrfPqm8zVUdRnu0ybrrfAoORzQ9XBrIjNY8=;
        b=ckstbarMnoUInRJyCEmsQ0UXD3wMTSaY0QTVIN9wsh7I+ImSoXzJPrYuJUBUDVjg0G
         dMFoaAbmA5jeO3KQvM/KIEcb8Oa4Lp9beSM2I85adT42fhr++SgdJEe6mnMVyE/PPBpy
         g4vvRX3hAKVq7StGYQ+MlriwkvblJL+qbixJ4=
In-Reply-To: <200906241730.37151.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>, =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@lazybastard.org>, Sam Ravnborg <sam@ravnborg.org>, Tim Bird <tim.bird@am.sony.com>, Chris Simmonds <chris@2net.co.uk>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Arnd Bergmann wrote:
> On Wednesday 24 June 2009, Marco Stornelli wrote:
>>> Actually, reading from /dev/mem is only valid on real RAM. If the nvram
>>> is part of an IO memory mapping, you have to do mmap()+memcpy() rather
>>> than read(). So dd won't do it, but it's still easy to read from user
>>> space.
>> For "security" reasons pram reserve the region of memory with
>> reserve_mem_region_exclusive().....
> 
> That will only prevent other device drivers from stepping on it,
> /dev/mem does not care about mem_region reservations.
> 
> 	Arnd <><
> 

Userland may not map this resource, so /dev/mem and the sysfs MMIO
access will not be allowed. This restriction depends on STRICT_DEVMEM
option. It's true that currently is only implemented in the x86 world.

Marco
