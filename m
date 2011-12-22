From: john stultz <johnstul@us.ibm.com>
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 16:47:00 -0800
Message-ID: <1324514820.30527.148.camel@work-vm>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de>
	 <1324513091.30527.139.camel@work-vm> <20111222002719.GA18361@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20111222002719.GA18361@suse.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@suse.de>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Brian Swetland <swetland@google.com>, Kay Sievers <kay.sievers@vrfy.org>, Lennart Poettering <lennart@poettering.net>

On Wed, 2011-12-21 at 16:27 -0800, Greg KH wrote:
> On Wed, Dec 21, 2011 at 04:18:11PM -0800, john stultz wrote:
> > On Wed, 2011-12-21 at 15:19 -0800, Greg KH wrote:
> > > What way is it superior?  Again, why not extend syslog?  Why not "fix"
> > > syslog if this really is a superior thing?  How does this tie into Kay
> > > and Lennard's proposal for work in this area?
> > 
> > There is also some overlap functionality wise with pstore as well, as I
> > believe the logger is used as a known location in memory where messages
> > can be fetched from after a kernel panic or crash.
> 
> That sounds like a major overlap, can't pstore be used for this
> functionality today instead of the logger code?

It may be able to suffice for some portion of the functionality, it was
suggested that we consider doing something like try to make logger use
pstore as a backend.  I'm not really familiar with pstore, but I don't
know if its able to preserve messages from userland, so it may not
really be sufficient in of itself.

Also, if I understand correctly, logger also is able to store messages
from hardware modems or other hardware that run their own micro-os in a
central location. This may be closer to the pstore mce bits, but its not
clear yet to me how much overlap is there.

But I've not yet really spent too much time looking at logger yet, so I
can't really comment too strongly here. Just wanted to make sure folks
have looked at all the other similar work.

thanks
-john
