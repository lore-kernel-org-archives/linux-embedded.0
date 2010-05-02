From: Samo Pogacnik <samo_pogacnik@t-2.net>
Subject: Re: [PATCH] console logging detour via printk
Date: Sun, 02 May 2010 15:29:47 +0200
Message-ID: <1272806987.2155.34.camel@itpsd6lap>
References: <1272664980.10241.77.camel@itpsd6lap>
	 <20100501120418.6fca2aad@lxorguk.ukuu.org.uk>
	 <1272739689.2147.156.camel@itpsd6lap>  <4BDD4CD7.2060205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4BDD4CD7.2060205@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Dne 02.05.2010 (ned) ob 11:58 +0200 je Marco Stornelli zapisal(a):
> 01/05/2010 20:48, Samo Pogacnik wrote:
> > Dne 01.05.2010 (sob) ob 12:04 +0100 je Alan Cox zapisal(a):
> >>> while i was searching for effective logging of complete console output
> >>> produced by the kernel and user phase of the boot process, it turned out
> >>> that only kernel messages imho get systematically cached and stored into
> >>> log files (if needed). All userspace processes are on their own to use
> >>> syslog, which is fine, but there are also many console messages
> >>> reporting the boot status via init scripts, .... I came across the
> >>> bootlogd daemo, which handles the job of redirecting console output into
> >>> a log file, but i find it problematic to use especialy, when using
> >>> initial ram disk image.
> >>
> >> So you want to patch the kernel because you can't work out how to do this
> >> in userspace ? The distributions seem to have no problem doing this in
> >> user space that I can see. It doesn't seem to be a hard user space
> >> problem, and there are a ton of things you want to do with this sort of
> >> stuff (like network logging) that you can't do in kernel space.
> > 
> > The distros have no problem logging complete console output into log
> > files or over the network, because they simply do not do it at least for
> > the initrd part of the boot process (i'd be glad, if i'm wrong). 
> 
> Mmm...It's an interesting problem. I see in my distro (openSuse) a
> script called boot.klog that it seems to perform that (even initrd
> part). In the file boot.msg I can see the initial prints of the kernel
> and user space scripts.
> 
Thanks for the info. 
Is this boot.klog script from the initrd image or from the real rootfs?
As you can see, i am still suspicious about the initrd part user console
messages:)

Samo
