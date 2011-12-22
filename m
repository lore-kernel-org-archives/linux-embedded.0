From: Greg KH <gregkh@suse.de>
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 19:47:17 -0800
Message-ID: <20111222034717.GB14174@suse.de>
References: <4EF264C3.6000104@am.sony.com>
 <20111221231956.GB23859@suse.de>
 <4EF27B85.9080801@am.sony.com>
 <20111222005114.GA22541@suse.de>
 <4EF288B4.1070601@am.sony.com>
 <20111222014718.GA13085@suse.de>
 <4EF29217.7040408@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4EF29217.7040408@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Brian Swetland <swetland@google.com>, Kay Sievers <kay.sievers@vrfy.org>, Lennart Poettering <lennart@poettering.net>

On Wed, Dec 21, 2011 at 06:12:39PM -0800, Tim Bird wrote:
> > Again, please see what we are already doing in the kernel and userspace,
> > I think a lot of the above is already implemented.
> 
> I don't know what systemd has got going on in user-space.  I'm looking
> at a very recent kernel, and I see no support for multiple log channels,
> or an optimized open/write path.

How is the existing syslog read path not "optimized"?  What kind of
speed and numbers are we talking about here?

Oh, and you do know about the userspace printk tty driver, right?  What
about using that combined with the existing syslog system call?

systemd doesn't use it, but I know of a few embedded systems that are
already using it today, and I think it might solve the android issues
already.

thanks,

greg k-h
