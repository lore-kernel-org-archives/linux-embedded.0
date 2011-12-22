From: david@lang.hm
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 21:21:32 -0800 (PST)
Message-ID: <alpine.DEB.2.02.1112212114590.28597@asgard.lang.hm>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de> <4EF27B85.9080801@am.sony.com> <20111222005114.GA22541@suse.de> <4EF288B4.1070601@am.sony.com> <20111222014718.GA13085@suse.de> <4EF29217.7040408@am.sony.com> <20111222034717.GB14174@suse.de>
 <CAPXgP10ikqHFn41wc1HPsKHyaC7fe1WGC2eHqs-hdRaZ7XCTLw@mail.gmail.com> <CANqkERCcciVxybh=66K5xxzzGmgw=fg0vwmcitWZ1y=DTxxtOA@mail.gmail.com> <alpine.DEB.2.02.1112212044240.28597@asgard.lang.hm>
 <CANqkERDwpVqnYsC_0kQSyVohcoFK1vCEjXe+CwgdpMcNdKTkLQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANqkERDwpVqnYsC_0kQSyVohcoFK1vCEjXe+CwgdpMcNdKTkLQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Brian Swetland <swetland@google.com>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Greg KH <gregkh@suse.de>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Lennart Poettering <lennart@poettering.net>

On Wed, 21 Dec 2011, Brian Swetland wrote:

> The rate at which apps push data into logs is pretty amazing at times.
> The system booting (maybe 10-20 services and 10+ apps starting up)
> can blow through 256K of ringbuffer in seconds.

a smidge more information here.

256K of logs in 'seconds'

are we talking single digit seconds, tens of seconds, what?

any idea the average message size

on my server farms, the average log size is ~256 byttes, so if this was 
over 10 seconds we would be talking ~100 logs/sec. "slow" syslog daemons 
can handle this sort of load trivially, they start to take significant 
amounts of CPU (10%+) around two orders of magnatude higher data rates.

now, it may be that  the logs on the android are smaller, and you hit the 
256K injust a couple of seconds, at which point things would be a little 
harder, but since the job is so much simpler it shouldn't be that hard.

David Lang
