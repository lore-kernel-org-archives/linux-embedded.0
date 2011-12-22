From: Brian Swetland <swetland@google.com>
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 21:06:02 -0800
Message-ID: <CANqkERBPayBWjFp2nCDZA2CByJQwHMoeXe62ZutZr8QkWtcTLg@mail.gmail.com>
References: <4EF264C3.6000104@am.sony.com>
	<20111221231956.GB23859@suse.de>
	<4EF27B85.9080801@am.sony.com>
	<20111222122026.3a0fae36@notabene.brown>
	<alpine.DEB.2.02.1112212050060.28597@asgard.lang.hm>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:x-system-of-record:content-type;
        bh=lBXbdNdCiXHPSNnAhGkXTwLkAUlZTMhpremLRkTC+KA=;
        b=Ykxvs7plyrCEoqX2h7e2EqRn1Mx8CPPut5FQKXn427Wlcz4yp/iCyHFXhBugxJ91he
         uuHoKyG430E4xC/f5dLA==
In-Reply-To: <alpine.DEB.2.02.1112212050060.28597@asgard.lang.hm>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david@lang.hm
Cc: NeilBrown <neilb@suse.de>, Tim Bird <tim.bird@am.sony.com>, Greg KH <gregkh@suse.de>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Kay Sievers <kay.sievers@vrfy.org>, Lennart Poettering <lennart@poettering.net>

On Wed, Dec 21, 2011 at 8:52 PM,  <david@lang.hm> wrote:
> On Thu, 22 Dec 2011, NeilBrown wrote:
>>
>> You would defined 'read' and 'write' much like you currently do to create
>> a list of
>> datagrams in a circular buffer and replace the ioctls by more standard
>> interfaces:
>>
>> LOGGER_GET_LOG_BUG_SIZE would use 'stat' and the st_blocks field
>> LOGGER_GET_LOG_LEN would use 'stat' and the st_size field
>> LOGGER_GET_NEXT_ENTRY_LEN could use the FIONREAD ioctl
>> LOGGER_FLUSH_LOG could use ftruncate
>>
>> The result would be much the same amount of code, but an interface which
>> has
>> fewer details hard-coded and is generally more versatile and accessible.
>
> That sounds better than what has been done in android, but it is still _far_
> more limited than doing something that could be replaced by a fairly
> standard syslog daemon.

We're really not interested in adding another daemon to the platform
-- the logging system we have has served us well, is integrated with
our existing development tools, and we're definitely interested in
improving it, but throwing it out and replacing it with a userspace
solution is not interesting to us right now.

Brian
