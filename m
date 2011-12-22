From: david@lang.hm
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 20:49:29 -0800 (PST)
Message-ID: <alpine.DEB.2.02.1112212047260.28597@asgard.lang.hm>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de> <4EF27B85.9080801@am.sony.com> <20111222005114.GA22541@suse.de> <4EF288B4.1070601@am.sony.com> <20111222014718.GA13085@suse.de> <4EF29217.7040408@am.sony.com> <20111222034717.GB14174@suse.de>
 <CAPXgP10ikqHFn41wc1HPsKHyaC7fe1WGC2eHqs-hdRaZ7XCTLw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPXgP10ikqHFn41wc1HPsKHyaC7fe1WGC2eHqs-hdRaZ7XCTLw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Kay Sievers <kay.sievers@vrfy.org>
Cc: Greg KH <gregkh@suse.de>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Brian Swetland <swetland@google.com>, Lennart Poettering <lennart@poettering.net>

On Thu, 22 Dec 2011, Kay Sievers wrote:

> If we want to think about any next generation logging, I'm convinced,
> we need to support records, structured data and binary data; anything
> else is unlikely worth to change the current stuff.

note that current generation syslog supports records, structured data, 
metadata capture of the sending process, everything you listed except 
unencoded binary data.

David Lang
