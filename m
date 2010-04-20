From: Greg KH <greg@kroah.com>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Tue, 20 Apr 2010 16:57:22 -0700
Message-ID: <20100420235722.GB6542@kroah.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
 <20100419162611.GA15131@nokia.com>
 <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>
 <20100419200727.GC27643@nokia.com>
 <20100419224451.GE1800@kroah.com>
 <20100420062241.GA5427@nokia.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100420062241.GA5427@nokia.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <felipe.balbi@nokia.com>
Cc: ext Linus Walleij <linus.ml.walleij@gmail.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus@nokia.com>, "Quadros Roger (Nokia-D/Helsinki)" <roger.quadros@nokia.com>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta@nokia.com>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy@nokia.com>, David Brownell <david-b@pacbell.net>, linux-embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, "libmtp-discuss@lists.sourceforge.net" <libmtp-discuss@lists.sourceforge.net>

On Tue, Apr 20, 2010 at 09:22:41AM +0300, Felipe Balbi wrote:
> On Tue, Apr 20, 2010 at 12:44:51AM +0200, ext Greg KH wrote:
> >If you know the patent numbers, please send them to me.  There are very
> >simple methods of routing around patents.  Also, the USB-IF is very
> >interested in patents that cover USB related things, as they could
> >possibly violate the USB-IF agreement that companies are forced to sign
> >to join it.
> 
> you might have better contacts than I do. Last time I contacted them
> regarding MS problems - at that time, I was complaining that Windows
> doesn't fetch all config descriptors - they replied that "other
> devices have passed USB Certification, so why can't you?"
> 
> It's too bad when the Specification authority doesn't want to hear
> about mis-implementations of their own specification. Anyways...
> 
> Take a look here:
> 
> http://www.microsoft.com/whdc/connect/usb/os_desc.mspx
> 
> it doesn't say the patent number but it does say that "Microsoft
> agrees to grant a nonexclusive, royalty-free, world-wide license
> under these copyrights, patents or applications solely to implement
> the Microsoft OS Descriptor Specification to interface with (i) a
> Microsoft OS Descriptor enabled operating system or (ii) other
> systems authorized by Microsoft to retrieve and use this
> information, on condition that you agree not to assert any
> intellectual property rights against Microsoft or other companies
> for their implementation of the Specification."
> 
> We just need to check whether Linux falls into the "other systems
> authorized by Microsoft" category. I would guess not :-p

It might, now that Microsoft has code in the Linux kernel :)

I'll ask around and see what I can find out.

thanks,

greg k-h
