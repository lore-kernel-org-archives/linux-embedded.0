From: david@lang.hm
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 21:07:14 -0800 (PST)
Message-ID: <alpine.DEB.2.02.1112212103310.28597@asgard.lang.hm>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de> <4EF27B85.9080801@am.sony.com> <20111222005114.GA22541@suse.de> <4EF288B4.1070601@am.sony.com> <20111222014718.GA13085@suse.de> <4EF29217.7040408@am.sony.com> <20111222034717.GB14174@suse.de>
 <CAPXgP10ikqHFn41wc1HPsKHyaC7fe1WGC2eHqs-hdRaZ7XCTLw@mail.gmail.com> <CANqkERCcciVxybh=66K5xxzzGmgw=fg0vwmcitWZ1y=DTxxtOA@mail.gmail.com> <alpine.DEB.2.02.1112212044240.28597@asgard.lang.hm>
 <CANqkERDwpVqnYsC_0kQSyVohcoFK1vCEjXe+CwgdpMcNdKTkLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="680960-1187597142-1324530434=:28597"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CANqkERDwpVqnYsC_0kQSyVohcoFK1vCEjXe+CwgdpMcNdKTkLQ@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Brian Swetland <swetland@google.com>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Greg KH <gregkh@suse.de>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Lennart Poettering <lennart@poettering.net>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--680960-1187597142-1324530434=:28597
Content-Type: TEXT/PLAIN; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On Wed, 21 Dec 2011, Brian Swetland wrote:

> On Wed, Dec 21, 2011 at 8:47 PM,  <david@lang.hm> wrote:
>> On Wed, 21 Dec 2011, Brian Swetland wrote:
>>> Any thoughts as to how one could allow N userspace agents to log to a
>>> single shared buffer without one agent, if buggy or malicious,
>>> spamming out all the other contents of the log?  This is one of the
>>> main reasons we maintain separate logs in Android today, and are
>>> likely to continue doing so until we figure out how resolve the issue.
>>
>> note that you still don't prevent one app from blowing out the logs, all you
>> do is separate the logs into a handfulof categories and limit the app
>> (through standard filesystem permissions) to only blowing out one category
>> of logs.
>>
>> or do I misunderstand this and you actually keep a separate queue for each
>> pid (which would seem to be a problem as you no longer know how much space
>> you need)
>
> You're correct -- that's the model at present.  We'd like to move to a
> model where we have better control and are kicking around ideas for
> how to do this for the next platform version.
>
> The rate at which apps push data into logs is pretty amazing at times.
> The system booting (maybe 10-20 services and 10+ apps starting up)
> can blow through 256K of ringbuffer in seconds.
>
> Having enough context available when something crashes to be able to
> diagnose what went wrong, especially when problems could involve
> interaction between multiple agents in multiple processes is important
> for the frameworks and apps teams.

this makes it sound more like this belongs in userspace instead of the 
kernel. if something crashes and they can flip a flag in userspace to say 
'keep more logs now' and try to duplicate the crash is going to be far 
easier than having to compile a new kernel to extend the size of the log.

> Trying to get individual developers to be frugal with their logging
> has turned out to be mostly a losing battle.

that's for sure, anything that's success depends on developers doing 
things right that aren't visible to the user are pretty much doomed.

David Lang
--680960-1187597142-1324530434=:28597--
