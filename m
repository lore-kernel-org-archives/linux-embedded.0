From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Tue, 24 Aug 2010 15:02:16 -0700
Message-ID: <20100824220216.GA5164@suse.de>
References: <20100611134455.3fa7d563@lxorguk.ukuu.org.uk>
 <1276291932.2154.45.camel@itpsd6lap>
 <20100621153858.444695c0@lxorguk.ukuu.org.uk>
 <1277244410.2195.47.camel@itpsd6lap>
 <20100622232108.26752ff8@lxorguk.ukuu.org.uk>
 <1277462596.2143.101.camel@itpsd6lap>
 <20100625120329.1303aa61@lxorguk.ukuu.org.uk>
 <1282683470.8020.66.camel@itpsd6lap>
 <20100824211016.GA7176@suse.de>
 <20100824231641.33d5679b@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100824231641.33d5679b@lxorguk.ukuu.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Samo Pogacnik <samo_pogacnik@t-2.net>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Tue, Aug 24, 2010 at 11:16:41PM +0100, Alan Cox wrote:
> > Why does this need to be a tty driver?  Why not a misc device?
> 
> So you can use it as a"console" (in the user space sense) tty device on
> embedded devices which don't have a meaningful normal output subsystem.

But can't you do that today with kmsg?  The startup of systemd does this
in a way that handles all of the log messages very nicely, and the
embedded people are sure to pick it up as well because of the
simplicity.

thanks,

greg k-h
