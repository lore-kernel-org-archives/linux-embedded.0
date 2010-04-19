From: Felipe Balbi <felipe.balbi@nokia.com>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Mon, 19 Apr 2010 23:07:27 +0300
Message-ID: <20100419200727.GC27643@nokia.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
 <20100419162611.GA15131@nokia.com>
 <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>
Reply-To: felipe.balbi@nokia.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: ext Linus Walleij <linus.ml.walleij@gmail.com>
Cc: "Balbi Felipe (Nokia-D/Helsinki)" <felipe.balbi@nokia.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus@nokia.com>, "Quadros Roger (Nokia-D/Helsinki)" <roger.quadros@nokia.com>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta@nokia.com>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy@nokia.com>, Greg KH <greg@kroah.com>, David Brownell <david-b@pacbell.net>, linux-embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, "libmtp-discuss@lists.sourceforge.net" <libmtp-discuss@lists.sourceforge.net>

On Mon, Apr 19, 2010 at 09:23:46PM +0200, ext Linus Walleij wrote:
>...so I read you like it's not going to be supported with the proposed
>solution?
>
>I think that if you want you gadget to work with older Windowses,
>you simply have to support this.

if you're willing to pay the Royalty fees, let me know :-p

seriously, we just can't support it. AFAICT, M$ has patents over the OS 
Descriptor thingy (I could wrong though) and we don't want to give linux 
foundation a law suit, do we ? :-)

There's no simple way to support old windows OSes. We could provide 
another .inf file on the kernel source for that at least.

-- 
balbi
