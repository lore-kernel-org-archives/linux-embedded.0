From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 04/14] Pramfs: Mounting as root filesystem
Date: Sun, 14 Jun 2009 10:07:25 +0100
Message-ID: <1244970445.3468.2732.camel@macbook.infradead.org>
References: <4A33A7D7.3040008@gmail.com> <200906140104.43463.arnd@arndb.de>
	 <4A34B2FD.20701@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A34B2FD.20701@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco <marco.stornelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Sun, 2009-06-14 at 10:21 +0200, Marco wrote:
> 
> Mmm...MEM_MAJOR and RAMDISK_MAJOR have the same value and pramfs works
> in memory. We could simply use /dev/null (there was an error in the
> submitted kconfig description, my intention was to use /dev/mem). In
> that case I can use UNNAMED_MAJOR. PRAMFS root option is not enabled
> if it's already enabled the NFS one. What do you think?

Why use a major number at all? See how we handle mtd and ubi devices in
prepare_namespace() -- can't you do something similar?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
