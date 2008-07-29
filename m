From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Tue, 29 Jul 2008 12:17:51 -0600
Message-ID: <20080729181751.GA24924@parisc-linux.org>
References: <20080729154520.728594017@free-electrons.com>> <20080729154747.872888047@free-electrons.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080729154747.872888047@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, mpm@selenic.com, akpm@linux-foundation.org

On Tue, Jul 29, 2008 at 05:45:22PM +0200, Thomas Petazzoni wrote:
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
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

In principle, I think this is a great idea.

>  config NFS_FS
>  	tristate "NFS client support"
> -	depends on INET
> +	depends on INET && FILE_LOCKING
>  	select LOCKD
>  	select SUNRPC
>  	select NFS_ACL_SUPPORT if NFS_V3_ACL

I think this part is a little lazy.  It should be possible to support
NFS without file locking.  I suspect that's really not in-scope for the
linux-tiny tree as currently envisaged with the focus on embedded
devices that probably don't use NFS anyway.  Do we want to care about
the situation of a machine with fixed workload, that doesn't need file
locking, but does use NFS?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
