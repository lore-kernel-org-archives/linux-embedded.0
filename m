From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Tue, 24 Aug 2010 14:10:16 -0700
Message-ID: <20100824211016.GA7176@suse.de>
References: <1275175983.2122.42.camel@itpsd6lap>
 <1276123020.16010.97.camel@itpsd6lap>
 <20100611134455.3fa7d563@lxorguk.ukuu.org.uk>
 <1276291932.2154.45.camel@itpsd6lap>
 <20100621153858.444695c0@lxorguk.ukuu.org.uk>
 <1277244410.2195.47.camel@itpsd6lap>
 <20100622232108.26752ff8@lxorguk.ukuu.org.uk>
 <1277462596.2143.101.camel@itpsd6lap>
 <20100625120329.1303aa61@lxorguk.ukuu.org.uk>
 <1282683470.8020.66.camel@itpsd6lap>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1282683470.8020.66.camel@itpsd6lap>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samo Pogacnik <samo_pogacnik@t-2.net>
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Tue, Aug 24, 2010 at 10:57:50PM +0200, Samo Pogacnik wrote:
> On 25.06.2010 (Fri) at 12:03 +0100 Alan Cox wrote: 
> > With my devices.txt owner hat on I'll allocate the minor as you suggest
> > (and double check this causes no problems), with my tty hat on can you
> > send it to GregKH for merging into the tree.
> 
> Hi,
> 
> I hope that this TTY driver is ok for merging. It is very basic -
> removed all flow control and rate limiting. Patch has been generated
> against 2.6.34 kernel version.
> 
> Ttyprintk is a pseudo TTY driver, which allows users to make printk messages,
> via output to ttyprintk device. It is possible to store "console" messages
> inline with kernel messages for better analyses of the boot process, for
> example.

Why does this need to be a tty driver?  Why not a misc device?

And what about the normal way of just writing to /dev/kmsg to do this?
Why a whole new driver for this same functionality?

confused,

greg k-h
