From: Jim Freeman <jfree@sovereign.org>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Tue, 17 Jun 2008 13:22:48 -0600
Message-ID: <20080617192248.GH11921@sovereign.org>
References: <48580116.9070504@am.sony.com> <20080617190750.GA31224@logfs.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080617190750.GA31224@logfs.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J??rn Engel <joern@logfs.org>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Tue, Jun 17, 2008 at 09:07:51PM +0200, J??rn Engel wrote:
> On Tue, 17 June 2008 11:23:18 -0700, Tim Bird wrote:
> > 
> > I'm not that happy using an ioctl for this trigger.  What is
> > the preferred method of activating a kernel feature like this?
> > I presume something in /proc or /sys, but I'm not sure.
> 
> I personally would be unhappy with any kind of interface for this.  It
> would be much nicer to make it transparent and still get the benefits.
> One option would be to start a kernel thread for the initialization and
> renice it to 19 or so.
> 
> If you want an explicit trigger, you could either hook into init_post()
> or have hooks in the open functions of drivers with deferred
> initialization.  Obviously you need to wait for completion here anyway,
> so adding a trigger wouldn't be too expensive.

Run modprobe?  Have it do just the _init bits without a load/link
of the actual module text?


> J??rn
> 
> -- 
> Joern's library part 13:
> http://www.chip-architect.com/
