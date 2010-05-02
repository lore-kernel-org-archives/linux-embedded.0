From: Paul Smith <paul@mad-scientist.net>
Subject: Re: Can I manage/modify console baud rates from userspace?
Date: Sun, 02 May 2010 12:14:55 -0400
Message-ID: <1272816895.27961.1131.camel@homebase>
References: <1272758524.27961.1114.camel@homebase>
	 <4BDD4CC7.3050507@gmail.com>
Reply-To: paul@mad-scientist.net
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4BDD4CC7.3050507@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: linux-embedded@vger.kernel.org

On Sun, 2010-05-02 at 11:58 +0200, Marco Stornelli wrote:
> 02/05/2010 02:02, Paul Smith wrote:
> > I've looked at setserial and it supports a baud_base parameter but that
> > doesn't appear to be what I want (I tried it anyway: changing it didn't
> > work, my console output was still screwed up).
> > 
> > Trying to do something like creating customized PXE configs on the
> > server based on the MAC addresses of the blades that are "new" (or old)
> > would be an absolute nightmare as people swap blades between chassis,
> > add new ones, etc. all the time.
> > 
> > 
> > Please help me find a better way... :-(
> > 
> 
> It's strange that it's not possible to change the baud rate, but I'm not
> an expert of tty layer. A naive implementation could be patch the kernel
> to choose a well-known baud rate for your hw reading a revision register
> or something like that.

I guess; I'd hate to have to modify the kernel like that though.  Plus,
as far as I'm aware at the moment the only way to tell these blades
apart is through querying IPMI which would be a serious bummer to try to
do via the kernel, I believe.  Maybe there's some other way to do it
that's simpler.

Still hoping someone will say "all you have to do is XYZZY..."  Anyone?
