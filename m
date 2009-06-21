From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Sun, 21 Jun 2009 22:22:24 +0200
Message-ID: <200906212222.25434.arnd@arndb.de>
References: <4A33A7EC.6070008@gmail.com> <200906140059.57362.arnd@arndb.de> <4A3E68CD.6080803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4A3E68CD.6080803@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Marco <marco.stornelli@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Sunday 21 June 2009, Marco wrote:
> I was thinking about your comment and I think I'll use __kernel_off_t
> for the exported headers. I know that it will differ between 32 and 64
> bit architectures, but for this kind of fs there isn't any compatibility
> problem at layout level. You cannot remove a chip of RAM from a board
> 32bit little endian and attach it to a board with a cpu 64bit big
> endian, the memory isn't a disk. Indeed, I see that tmpfs uses simply
> "unsigned long" in the exported header file without any problems to
> little or big endian.

It's still a problem. You might be creating a file system image
for an embedded board with a different endianess. Or even on the
same machine, you could be looking at the file system contents
with a 32 bit process running on a 64 bit kernel.

	Arnd <><
