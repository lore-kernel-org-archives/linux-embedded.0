From: john stultz <johnstul@us.ibm.com>
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 17:09:03 -0800
Message-ID: <1324516143.30527.154.camel@work-vm>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de>
	 <1324513091.30527.139.camel@work-vm> <20111222002719.GA18361@suse.de>
	 <1324514820.30527.148.camel@work-vm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1324514820.30527.148.camel@work-vm>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@suse.de>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Brian Swetland <swetland@google.com>, Kay Sievers <kay.sievers@vrfy.org>, Lennart Poettering <lennart@poettering.net>

On Wed, 2011-12-21 at 16:47 -0800, john stultz wrote:
> Also, if I understand correctly, logger also is able to store messages
> from hardware modems or other hardware that run their own micro-os in a
> central location. This may be closer to the pstore mce bits, but its not
> clear yet to me how much overlap is there.

Looking at the driver, this point seems to be inaccurate as well.  So
sorry for adding to any confusion here. 

thanks
-john
