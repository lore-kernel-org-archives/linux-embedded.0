From: david@lang.hm
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 20:47:17 -0800 (PST)
Message-ID: <alpine.DEB.2.02.1112212044240.28597@asgard.lang.hm>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de> <4EF27B85.9080801@am.sony.com> <20111222005114.GA22541@suse.de> <4EF288B4.1070601@am.sony.com> <20111222014718.GA13085@suse.de> <4EF29217.7040408@am.sony.com> <20111222034717.GB14174@suse.de>
 <CAPXgP10ikqHFn41wc1HPsKHyaC7fe1WGC2eHqs-hdRaZ7XCTLw@mail.gmail.com> <CANqkERCcciVxybh=66K5xxzzGmgw=fg0vwmcitWZ1y=DTxxtOA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CANqkERCcciVxybh=66K5xxzzGmgw=fg0vwmcitWZ1y=DTxxtOA@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Brian Swetland <swetland@google.com>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Greg KH <gregkh@suse.de>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Lennart Poettering <lennart@poettering.net>

On Wed, 21 Dec 2011, Brian Swetland wrote:

> Any thoughts as to how one could allow N userspace agents to log to a
> single shared buffer without one agent, if buggy or malicious,
> spamming out all the other contents of the log?  This is one of the
> main reasons we maintain separate logs in Android today, and are
> likely to continue doing so until we figure out how resolve the issue.

note that you still don't prevent one app from blowing out the logs, all 
you do is separate the logs into a handfulof categories and limit the app 
(through standard filesystem permissions) to only blowing out one category 
of logs.

or do I misunderstand this and you actually keep a separate queue for each 
pid (which would seem to be a problem as you no longer know how much space 
you need)

David Lang
