From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Mon, 22 Jun 2009 13:17:03 +0200
Message-ID: <200906221317.04166.arnd@arndb.de>
References: <4A33A7EC.6070008@gmail.com> <200906212222.25434.arnd@arndb.de> <2ea1731b0906212323h6ed8621dg22e1bc8638c26e2c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <2ea1731b0906212323h6ed8621dg22e1bc8638c26e2c@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Monday 22 June 2009, Marco Stornelli wrote:
> > It's still a problem. You might be creating a file system image
> > for an embedded board with a different endianess.
> 
> It's not possible to create an "image" with pramfs, it's like tmpfs.

But the data is persistant, you even support using it as a root file
system, so the data has to have a way to get there. Even if you
don't do it right now, I don't see any fundamental limitation that
prevents you from creating an image on one machine and dumping it
into the nvram of another machine as part of manufacturing or testing.

> > Or even on the same machine, you could be looking at the file system contents
> > with a 32 bit process running on a 64 bit kernel.
> 
> Yes, indeed the most important thing is to be sure that a 64bit kernel
> works well. I'll try to test it in this environment. If there are
> "64bit guys" to help me to test it, it'd be great.

This particular problem (__kernel_off_t on 64-bit machines) can be avoided
by just switching to __kernel_loff_t, which is 64 bit long on all machines,
while __kernel_off_t is always the register length (32 or 64 bits).

	Arnd <><
