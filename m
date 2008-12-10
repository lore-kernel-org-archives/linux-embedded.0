From: "Dave Hylands" <dhylands@gmail.com>
Subject: Re: How to handle device drivers depending on another device.
Date: Tue, 9 Dec 2008 22:09:03 -0800
Message-ID: <c32efac40812092209v52c3b425i9aede2f096a13bfa@mail.gmail.com>
References: <fa686aa40812092145h72c29ea8o7b55ab6bc0ce52ff@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=tCjtgFC9MOmwhgecEGN4MqdFjbS9k2sRbn3HpFnPPX4=;
        b=u9rAJA0bHX5Cu4gHfuRJVoT8Vz8Z8BOYE97Bi3dnpWZ8eXFIss1XLNqEbDFrnDL8sp
         5YfOPazKaW6U6PRZLNV3XdEg6NBXh2bxgMGHNcBDty45aAQJE6WsJo3kn4654shHndH5
         EVRTUEoayAltCVEfoRNo6nRwJAusFX5dagXPs=
In-Reply-To: <fa686aa40812092145h72c29ea8o7b55ab6bc0ce52ff@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-embedded@vger.kernel.org

Whoops - Replying to the list this time.

Hi Grant,

> Problem: There are no guarantees that the MDIO bus controller will be
> probed before the Ethernet device.

I believe that what you're supposed to do is to have "bus" controllers
initilize themselves using subsys_initcall rather than module_init. If
you look in include/linux/init.h you can see the various initcall
definitions. module_init is at the same level as device_initcall. All
of the initcalls at one "level" are completed before moving onto the
next level.

Of course, if you're using loadable modules, then the dependencies
should take care of things for you.

-- 
Dave Hylands
Shuswap, BC, Canada
http://www.DaveHylands.com/
