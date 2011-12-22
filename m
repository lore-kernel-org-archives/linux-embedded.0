From: david@lang.hm
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 21:14:26 -0800 (PST)
Message-ID: <alpine.DEB.2.02.1112212107550.28597@asgard.lang.hm>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de> <4EF27B85.9080801@am.sony.com> <20111222122026.3a0fae36@notabene.brown> <alpine.DEB.2.02.1112212050060.28597@asgard.lang.hm>
 <CANqkERBPayBWjFp2nCDZA2CByJQwHMoeXe62ZutZr8QkWtcTLg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CANqkERBPayBWjFp2nCDZA2CByJQwHMoeXe62ZutZr8QkWtcTLg@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Brian Swetland <swetland@google.com>
Cc: NeilBrown <neilb@suse.de>, Tim Bird <tim.bird@am.sony.com>, Greg KH <gregkh@suse.de>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Kay Sievers <kay.sievers@vrfy.org>, Lennart Poettering <lennart@poettering.net>

On Wed, 21 Dec 2011, Brian Swetland wrote:

>>> The result would be much the same amount of code, but an interface which
>>> has
>>> fewer details hard-coded and is generally more versatile and accessible.
>>
>> That sounds better than what has been done in android, but it is still _far_
>> more limited than doing something that could be replaced by a fairly
>> standard syslog daemon.
>
> We're really not interested in adding another daemon to the platform
> -- the logging system we have has served us well, is integrated with
> our existing development tools, and we're definitely interested in
> improving it, but throwing it out and replacing it with a userspace
> solution is not interesting to us right now.

Think very hard before you reject any possibility of doing this in 
userspace, especially with all the things that you are talking about doing 
with logging in the future. I really don't think aht a lot of your 
long-0term plans for logging are going to sit well with the kernel 
developers, and if your justification is "you don't want to change your 
build process", I really doubt that you will get this upstream.

It should be possible to do this without having to change the tools 
writing the logs, any change in logging will change what it takes to read 
the logs.

I am not saying that you need to have a logging daemon as heavyweight as 
syslog-ng or rsyslog for the low-end phones, but I do think that as 
android moves up the stack a bit into talets and netbooks (especially in 
applications where it will have wifi connectivity almost all the time) 
having the capability to move to a full-blown syslog daemon will make a 
huge amount of sense, so you should look at how big a minimalist daemon 
would be, and what sort of performance it would have.

David Lang
