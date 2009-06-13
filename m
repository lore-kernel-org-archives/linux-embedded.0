From: Daniel Walker <dwalker@fifo99.com>
Subject: Re: [PATCH 08/14] Pramfs: Makefile and Kconfig
Date: Sat, 13 Jun 2009 07:02:12 -0700
Message-ID: <1244901732.5982.221.camel@desktop>
References: <4A33A802.8040507@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A33A802.8040507@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Sat, 2009-06-13 at 15:22 +0200, Marco wrote:
> From: Marco Stornelli <marco.stornelli@gmail.com>
> 
> Makefile and Kconfig.
> 
> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
> ---
> 

You should move this patch to 11 of 14, as I think that is the point
when the filesystem can actually be enabled and function. If this series
is only applied up to this patch you can get build failures if you
enabled PRAMFS, XIP, or any of the other features. Also breaking out the
individual features menuconfig options like XIP, and write protect, etc,
into their respective patches would be nice.

Daniel
