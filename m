From: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Fri, 13 Nov 2009 09:10:31 +0100
Message-ID: <20091113091031.3f6d4bba@marrow.netinsight.se>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
	<4AFC4D31.2000101@gmail.com>
	<20091112215649.GA28349@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754498AbZKMIKj@vger.kernel.org>
In-Reply-To: <20091112215649.GA28349@dvomlehn-lnx2.corp.sa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Marco Stornelli <marco.stornelli@gmail.com>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

On Thu, 12 Nov 2009 16:56:49 -0500
David VomLehn <dvomlehn@cisco.com> wrote:

> Good question. Some more detail on our application might help. In some
> situations, we may have no disk and only enough flash for the bootloader.
> The kernel is downloaded over the network. When we get to user space, we
> initialize a number of things dynamically. For example, we dynamically
> compute some MAC address, and most of the IP addresses are obtained with
> DHCP. This are very useful to have for panic analysis.
> 
> Since there is neither flash nor disk, user space has no place to store
> this information, should the kernel panic. When we come back up, we will get
> different MAC and IP addresses. Storing them in memory is our only hope.
> 
> Fortunately, there is a section of RAM that the bootloader promises not
> to overwrite. On a panic, we capture the messages written on the console
> and store them in the protected area. If the information from the
> /proc file is written as part of the panic, we will capture it, too.

Can't you solve this completely from userspace using phram and mtdoops
instead? I.e., setup two phram areas

	modprobe phram 4K@start-of-your-area,4K@start-of-your-area+4K    # Can't remember the exact syntax!

you'll then get /dev/mtdX and /dev/mtdX+1 for these two. You can then do

	modprobe mtdoops mtddev=/dev/mtdX+1 dump_oops=0

to load mtdoops to catch the panic in the second area, and just write
your userspace messages to /dev/mtdX.


One thing probably have to be fixed though: I don't think phram has a
panic_write, which will be needed by mtdoops to catch the panic - this
should be trivial to add though since it's plain RAM.

// Simon
