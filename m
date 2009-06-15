From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 15 Jun 2009 10:15:46 -0700
Message-ID: <4A3681C2.5010508@am.sony.com>
References: <4A33A7A2.1050608@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4A33A7A2.1050608@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Daniel Walker <dwalker@soe.ucsc.edu>

Marco wrote:
> This is a second attempt at mainlining Pramfs. The first attempt was
> back in early 2004 by MontaVista. Since then the kernel code has almost
> been completely rewritten. So my first item on the list was porting the
> code on a recent kernel version. After that I added the XIP support.

It's very nice to see this technology revived.

Is the information at:
http://pramfs.sourceforge.net/
and
http://pramfs.sourceforge.net/pramfs-spec.html
still valid - particularly the latter?

It would be very nice to see this get mainlined.  I believe that
one of the main uses for this is to store crash information
over a reboot so the next kernel (not in crashing state) can have
a better chance of dealing with it.  As such, I think
it's important to keep the code paths for Pramfs short, synchronous,
and unentangled with other kernel systems (block IO, page cache, etc.).

Thanks,
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

