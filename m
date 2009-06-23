From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Tue, 23 Jun 2009 23:55:32 +0200
Message-ID: <200906232355.34134.arnd@arndb.de>
References: <4A33A7EC.6070008@gmail.com> <20090623192648.GB23119@logfs.org> <1245791743.25547.3517.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757696AbZFWV4M@vger.kernel.org>
In-Reply-To: <1245791743.25547.3517.camel@macbook.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: =?utf-8?q?J=C3=B6rn_Engel?= <joern@lazybastard.org>, Marco <marco.stornelli@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Tim Bird <tim.bird@am.sony.com>, Chris Simmonds <chris@2net.co.uk>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Tuesday 23 June 2009, David Woodhouse wrote:
> And dd on /dev/mem would work, surely?

Actually, reading from /dev/mem is only valid on real RAM. If the nvram
is part of an IO memory mapping, you have to do mmap()+memcpy() rather
than read(). So dd won't do it, but it's still easy to read from user
space.

> I'd definitely recommend making it fixed-endian. Not doing so for JFFS2
> was a mistake I frequently regretted.

Right.

	Arnd <><
