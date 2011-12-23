From: Greg KH <gregkh@suse.de>
Subject: Re: RFC: android logger feedback request
Date: Fri, 23 Dec 2011 08:29:04 -0800
Message-ID: <20111223162904.GA25097@suse.de>
References: <4EF264C3.6000104@am.sony.com>
 <20111221231956.GB23859@suse.de>
 <4EF27B85.9080801@am.sony.com>
 <20111222122026.3a0fae36@notabene.brown>
 <alpine.DEB.2.02.1112212050060.28597@asgard.lang.hm>
 <CANqkERBPayBWjFp2nCDZA2CByJQwHMoeXe62ZutZr8QkWtcTLg@mail.gmail.com>
 <alpine.DEB.2.02.1112212107550.28597@asgard.lang.hm>
 <CANqkERCH15aGi5TJwUk6Yg3fnrPA0aiTJa=Nz9sUeZLbWs20HA@mail.gmail.com>
 <20111222060917.GA16302@suse.de>
 <20111223152231.4a304fdd@pyx>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111223152231.4a304fdd@pyx>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Brian Swetland <swetland@google.com>, david@lang.hm, NeilBrown <neilb@suse.de>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Kay Sievers <kay.sievers@vrfy.org>, Lennart Poettering <lennart@poettering.net>

On Fri, Dec 23, 2011 at 03:22:31PM +0000, Alan Cox wrote:
> > I have no problem leaving the logger driver in staging, but it seems
> > that Tim is taking on the task to do the harder thing here, which
> > probably would entail work on both sides, which as a openhandset
> > alliance company member, he might have a change that someone like me
> > might not :)
> 
> I'd like to see it in staging. There is a general discussion going on
> about how such logging services should look (and indeed it goes back
> before Android bits), and it looks like a good way to proceed is going to
> be to "play" with the Android one - perhaps adding the fs model to it.
> 
> So we need something and the Android interface at the very least is a
> prototype that has production proof of working.

It is already in staging, look in the staging-next branch of linux-next.

thanks,

greg k-h
