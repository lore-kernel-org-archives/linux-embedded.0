From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Mon, 22 Jun 2009 20:33:20 +0200
Message-ID: <200906222033.20883.arnd@arndb.de>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de> <4A3FC7F1.5050108@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4A3FC7F1.5050108@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Marco <marco.stornelli@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Monday 22 June 2009, Marco wrote:
> 
> Sorry, I meant it's not currently possible. At the moment the only way
> to use it as rootfs it's to copy all the data in an already mounted
> (empty) ram partition and reboot. However it's not my first item on my
> todo list because I think that it's possible to use it as rootfs but it
> isn't the standard use for this fs.

Well, it doesn't have to work right away. What I'm asking to
define the data structures in a way that keeps the layout stable
across kernel updates. Since a future version of the file system
might support cross-endian image creation, it would be good to
define the data structures in a fixed endian mode already, so
you don't have to change it in the future.

	Arnd <><
