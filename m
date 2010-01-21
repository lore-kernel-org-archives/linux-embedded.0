From: Greg KH <greg@kroah.com>
Subject: Re: /dev/fw major not constant (embedded mdev devtmpfs ieee1394)
Date: Thu, 21 Jan 2010 13:26:22 -0800
Message-ID: <20100121212622.GA12515@kroah.com>
References: <4B58BF6A.6070303@fnac.net>
 <20100121205711.GA29455@kroah.com>
 <8bd0f97a1001211321t4aea0ee0q8e0e253be2eff65a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hotplug-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8bd0f97a1001211321t4aea0ee0q8e0e253be2eff65a@mail.gmail.com>
Sender: linux-hotplug-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Paul Chavent <paul.chavent@fnac.net>, linux-embedded@vger.kernel.org, linux-hotplug@vger.kernel.org, linux1394-devel@lists.sourceforge.net, busybox@busybox.net, libdc1394-devel@lists.sourceforge.net

On Thu, Jan 21, 2010 at 04:21:26PM -0500, Mike Frysinger wrote:
> On Thu, Jan 21, 2010 at 15:57, Greg KH wrote:
> > On Thu, Jan 21, 2010 at 09:56:10PM +0100, Paul Chavent wrote:
> >> I'am working on an embedded gnu/linux system that allow to capture an ieee1394 stream.
> >>
> >> The system is compound of a kernel, a basic initrd (libc,libgcc,busybox,libdc1394,...) and my app.
> >>
> >> I use the new firewire stack.
> >>
> >> As my system is very minimalist, i tought to create the nodes in /dev at the moment of building my initrd.
> >>
> >> But when i needed to modify my kernel configuration, it has changed the major number of /dev/fw*.
> >>
> >> It's not really important for the definitive system (it will be
> >> freeze), but i wonder how to solve this issue for my future works ?
> >>
> >> I don't need hotplug, i just need to fill /dev at startup (coldplug).
> >> The target is an embedded device, so it should be easy to
> >> build/configure/install, and lightweight.
> >>
> >> For those reasons i don't want to use udev.
> >
> > Why, is udev somehow not "lightweight"?
> 
> in comparison, it is absolutely not

Heh, in comparison to devtmpfs, yes, good point :)

thanks,

greg k-h
