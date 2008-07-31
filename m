From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Thu, 31 Jul 2008 16:53:19 +0300
Message-ID: <20080731135319.GA20212@cs181140183.pp.htv.fi>
References: <20080731092703.661994657@free-electrons.com> <20080731093220.969460336@free-electrons.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080731093220.969460336@free-electrons.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, matthew@wil.cx, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org

On Thu, Jul 31, 2008 at 11:27:05AM +0200, Thomas Petazzoni wrote:
> This patch adds the CONFIG_FILE_LOCKING option which allows to remove
> support for advisory locks. With this patch enabled, the flock()
> system call, the F_GETLK, F_SETLK and F_SETLKW operations of fcntl()
> and NFS support are disabled. These features are not necessarly needed
> on embedded systems. It allows to save ~11 Kb of kernel code and data:
> 
>    text	   data	    bss	    dec	    hex	filename
> 1125436	 118764	 212992	1457192	 163c28	vmlinux.old
> 1114299	 118564	 212992	1445855	 160fdf	vmlinux
>  -11137    -200       0  -11337   -2C49 +/-
> 
> This patch has originally been written by Matt Mackall
> <mpm@selenic.com>, and is part of the Linux Tiny project.
>...

As I've already said in the past I'm personally not a huge fan of these 
patches, but if it brings advantages in real-life situations it's hard
to argue against it.

In which use cases can users safely disable this option, and on what 
devices have you verified that CONFIG_FILE_LOCKING=n kernels actually 
work in practice?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

