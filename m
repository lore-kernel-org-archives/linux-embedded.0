From: Roger Quadros <roger.quadros@nokia.com>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Tue, 20 Apr 2010 10:54:40 +0300
Message-ID: <4BCD5DC0.2050102@nokia.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>	 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>	 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>	 <20100419162611.GA15131@nokia.com> <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ext Linus Walleij <linus.ml.walleij@gmail.com>
Cc: "Balbi Felipe (Nokia-D/Helsinki)" <felipe.balbi@nokia.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus@nokia.com>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta@nokia.com>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy@nokia.com>, Greg KH <greg@kroah.com>, David Brownell <david-b@pacbell.net>, linux-embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, "libmtp-discuss@lists.sourceforge.net" <libmtp-discuss@lists.sourceforge.net>

ext Linus Walleij wrote:
> 2010/4/19 Felipe Balbi <felipe.balbi@nokia.com>:
>>> 2010/4/18 Linus Walleij <linus.ml.walleij@gmail.com>:
> 
>>> Further comments: there is apparently a driver floating around this list
>>> for supporting PTP through the gadgetfs. How does this work relate
>>> to that, and why can't you use gadgetfs?
>> dude, can't you read ? gadgetfs prevents us from combining into a composite
>> gadget. We went throught that already. Please follow the thread before
>> commenting.
> 
> Yeah sorry, I'm trying to catch up and miss some pieces here and there.
> I'm mainly reading it from the MTP side of things.
> 
>>> Second: after looking at this, I think that atleast the part of
>>> functionality
>>> called "OS descriptor" should be in the kernel and not in userspace,
>>> is the OS descriptor the reason to why you want to expose EP0 to
>>> userspace, or are you using this for other things in the MTP stack?
>> OS descriptor is MS specific crap, it's not on the USB-IF mtp spec and most
>> like MS has some patent on that.
> 
> ...so I read you like it's not going to be supported with the proposed
> solution?
> 
> I think that if you want you gadget to work with older Windowses,
> you simply have to support this.
> 

The device can simply fall back to PTP mode on older Windows.

cheers,
-roger
