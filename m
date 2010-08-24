From: Samo Pogacnik <samo_pogacnik@t-2.net>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Wed, 25 Aug 2010 00:09:57 +0200
Message-ID: <1282687797.8020.108.camel@itpsd6lap>
References: <1275175983.2122.42.camel@itpsd6lap>
	 <1276123020.16010.97.camel@itpsd6lap>
	 <20100611134455.3fa7d563@lxorguk.ukuu.org.uk>
	 <1276291932.2154.45.camel@itpsd6lap>
	 <20100621153858.444695c0@lxorguk.ukuu.org.uk>
	 <1277244410.2195.47.camel@itpsd6lap>
	 <20100622232108.26752ff8@lxorguk.ukuu.org.uk>
	 <1277462596.2143.101.camel@itpsd6lap>
	 <20100625120329.1303aa61@lxorguk.ukuu.org.uk>
	 <1282683470.8020.66.camel@itpsd6lap>  <20100824211016.GA7176@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-2.net; h=
	content-transfer-encoding:x-mailer:mime-version:message-id:date
	:date:content-type:content-type:references:in-reply-to:from:from
	:subject:subject:received:received:received:received; s=
	smtp-out-2; t=1282687808; x=1284502208; bh=BuiT+MC5wrVq30kLWET8H
	CnHT61x1cVAJdHoxqxe8d0=; b=mpexWfWRKnCCO86uRmI6Oxx2V9x1zFKsFKvx3
	z7epavfnPZqfAq025eRALRH2k68hrsk5+Dyt45ol3sHikJ0EaSsbKlYaK5+5srW8
	jAMnqEtUHB9yabpaW3Cg+SnCawzCtWXE1iStNjUIpyzrx9mWUXIofz4H4N/2iG1v
	wqxQtM=
In-Reply-To: <20100824211016.GA7176@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@suse.de>
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On 24.08.2010 (Tue) at 14:10 -0700 Greg KH wrote:
> On Tue, Aug 24, 2010 at 10:57:50PM +0200, Samo Pogacnik wrote:
> > On 25.06.2010 (Fri) at 12:03 +0100 Alan Cox wrote: 
> > > With my devices.txt owner hat on I'll allocate the minor as you suggest
> > > (and double check this causes no problems), with my tty hat on can you
> > > send it to GregKH for merging into the tree.
> > 
> > Hi,
> > 
> > I hope that this TTY driver is ok for merging. It is very basic -
> > removed all flow control and rate limiting. Patch has been generated
> > against 2.6.34 kernel version.
> > 
> > Ttyprintk is a pseudo TTY driver, which allows users to make printk messages,
> > via output to ttyprintk device. It is possible to store "console" messages
> > inline with kernel messages for better analyses of the boot process, for
> > example.
> 
> Why does this need to be a tty driver?  Why not a misc device?
Thanks for the response. I'll try to explain.
Well it all started with a kernel hack, which internaly redirected
console output to printk function to be able to capture console messages
inline with real kernel messages. Console messages have also been
automatically stored via system logging facility, which was very useful
especially for analyzes of the initrd part of the userspace system
initialization. Through initial posts (thread: console logging detour
via printk) Alan suggested, that a separate TTY driver could provide
this functionality and that may initial hacking isn't acceptable.
> 
> And what about the normal way of just writing to /dev/kmsg to do this?
> Why a whole new driver for this same functionality?
I must admit, i was not aware of the /dev/kmsg driver, but i made a few
tests and found out that it seems not to be possible to redirect console
to kmsg.

regards, Samo
