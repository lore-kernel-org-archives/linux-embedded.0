From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Tue, 24 Aug 2010 15:57:03 -0700
Message-ID: <20100824225703.GA5913@suse.de>
References: <20100621153858.444695c0@lxorguk.ukuu.org.uk>
 <1277244410.2195.47.camel@itpsd6lap>
 <20100622232108.26752ff8@lxorguk.ukuu.org.uk>
 <1277462596.2143.101.camel@itpsd6lap>
 <20100625120329.1303aa61@lxorguk.ukuu.org.uk>
 <1282683470.8020.66.camel@itpsd6lap>
 <20100824211016.GA7176@suse.de>
 <1282687797.8020.108.camel@itpsd6lap>
 <20100824222035.GA10625@suse.de>
 <1282690232.8020.116.camel@itpsd6lap>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1282690232.8020.116.camel@itpsd6lap>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samo Pogacnik <samo_pogacnik@t-2.net>
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Wed, Aug 25, 2010 at 12:50:32AM +0200, Samo Pogacnik wrote:
> Dne 24.08.2010 (tor) ob 15:20 -0700 je Greg KH zapisal(a):
> > > > And what about the normal way of just writing to /dev/kmsg to do this?
> > > > Why a whole new driver for this same functionality?
> > > I must admit, i was not aware of the /dev/kmsg driver, but i made a few
> > > tests and found out that it seems not to be possible to redirect console
> > > to kmsg.
> > 
> > See how systemd does this, as it sounds like exactly what you want to
> > do.  Look in either Fedora 14, or openSUSE Factory for examples of this,
> > with no kernel changes needed.
> > 
> I'll check out systemd. 
> 
> however:)
> It may be that systemd does not cover the initrd part of the
> initialization and it may be an overkill do introduce systemd to an
> existing system just to be analyzed.

No, it does cover that.  You should be able to do that with a simple
console redirection to /dev/kmsg  What happened when you tried to do
that?

thanks,

greg k-h
