From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Wed, 24 Jun 2009 17:30:36 +0200
Message-ID: <200906241730.37151.arnd@arndb.de>
References: <4A33A7EC.6070008@gmail.com> <200906232355.34134.arnd@arndb.de> <2ea1731b0906232332n2488d452p27419eac7edab7e4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <2ea1731b0906232332n2488d452p27419eac7edab7e4@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, =?iso-8859-1?q?J=F6rn_Engel?= <joern@lazybastard.org>, Sam Ravnborg <sam@ravnborg.org>, Tim Bird <tim.bird@am.sony.com>, Chris Simmonds <chris@2net.co.uk>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Wednesday 24 June 2009, Marco Stornelli wrote:
> > Actually, reading from /dev/mem is only valid on real RAM. If the nvram
> > is part of an IO memory mapping, you have to do mmap()+memcpy() rather
> > than read(). So dd won't do it, but it's still easy to read from user
> > space.
> 
> For "security" reasons pram reserve the region of memory with
> reserve_mem_region_exclusive().....

That will only prevent other device drivers from stepping on it,
/dev/mem does not care about mem_region reservations.

	Arnd <><
