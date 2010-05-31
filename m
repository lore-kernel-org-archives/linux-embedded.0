From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: omap udc driver problem with beagle board
Date: Mon, 31 May 2010 08:30:21 +0200
Message-ID: <AANLkTinrmtStR8o8rRkqmbva77s9GByPpynpQjcEzqvh@mail.gmail.com>
References: <4C0235AD.70008@gmail.com>
	<20100530160047.GA7704@gandalf>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=KdqLjXU3JS6jUx68jWm+s00G4FlsfSML6Yak+WCe96g=;
        b=mRkSoy+6lz4pg9/xr+n/6UGmj5qtuhZGYP1cGVPMLztDg4nUQChwj0TPYQKbN8DPO2
         vfSc+y6zd5GYB3UQbw0NZjvmqFr0oEE8X0IBYegvRZmhARs7qaE+IICTgmsNxAHV2bbB
         xDDKb1PfPYJafDBQgrcMweC7jSXW5I09bpj8g=
In-Reply-To: <20100530160047.GA7704@gandalf>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: me@felipebalbi.com
Cc: felipe.balbi@nokia.com, dbrownell@users.sourceforge.net, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, Linux Embedded <linux-embedded@vger.kernel.org>, tony@atomide.com

2010/5/30 Felipe Balbi <me@felipebalbi.com>:
> On Sun, May 30, 2010 at 11:53:49AM +0200, Marco Stornelli wrote:
>
> beagle board uses musb. You shouldn't be relying on the udc controller.
> Your Kconfig is just wrong.
>
> --
> balbi
>

Mmm....does it mean that it's not possible to use g_ether driver? I
read in several docs/wiki that it's possible.

Marco
