From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: RFC: android logger feedback request
Date: Thu, 22 Dec 2011 05:12:55 +0100
Message-ID: <CAPXgP10ikqHFn41wc1HPsKHyaC7fe1WGC2eHqs-hdRaZ7XCTLw@mail.gmail.com>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de>
 <4EF27B85.9080801@am.sony.com> <20111222005114.GA22541@suse.de>
 <4EF288B4.1070601@am.sony.com> <20111222014718.GA13085@suse.de>
 <4EF29217.7040408@am.sony.com> <20111222034717.GB14174@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrfy.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=1NUHvP50YRiZaoXdUap86ajmx/TxepkxMiMpVFHgs0U=;
        b=bBQDJgBkVN3OB8i7JQvKSc3oUPsFugATJBHdctKdRGO5MmH8FJoVKGZqZ3MFFDHDzn
         KgAZ9m9s11V+MSA/lGDWOeguX8aTob++0Gb1fS2gqRcGwEXJfSaSMf/87WscPeYr4Kgr
         dgPqdWW3ybVewF2xv+QevkmozBXLHTMMfhSq8=
In-Reply-To: <20111222034717.GB14174@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Greg KH <gregkh@suse.de>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Brian Swetland <swetland@google.com>, Lennart Poettering <lennart@poettering.net>

On Thu, Dec 22, 2011 at 04:47, Greg KH <gregkh@suse.de> wrote:
> On Wed, Dec 21, 2011 at 06:12:39PM -0800, Tim Bird wrote:
>> > Again, please see what we are already doing in the kernel and user=
space,
>> > I think a lot of the above is already implemented.
>>
>> I don't know what systemd has got going on in user-space. =C2=A0I'm =
looking
>> at a very recent kernel, and I see no support for multiple log chann=
els,
>> or an optimized open/write path.
>
> How is the existing syslog read path not "optimized"? =C2=A0What kind=
 of
> speed and numbers are we talking about here?
>
> Oh, and you do know about the userspace printk tty driver, right? =C2=
=A0What
> about using that combined with the existing syslog system call?
>
> systemd doesn't use it, but I know of a few embedded systems that are
> already using it today, and I think it might solve the android issues
> already.

We would like to have for the general Linux use case is a kmsg, that
supports structured data, but looks the same as it looks today to
current and legacy tools.

We would like to have every printk that does not start with a
KERN_CONT to create a record in the kmsg buffer. This record would
carry directly a timestamp, the log facility and the log level and a
reference to the usual human readable string.

The current kmsg prefixing of the timestamp would be a runtime switch,
and just added when the records are traversed, instead of the current
buffer printing.

In addition to this common data, every record can carry a
'dictionary', which basically looks like a process environment, means
KEY=3Dvalue pairs. The additional data can carry all the stuff that is
needed for structured logging and provides the base for machine
readable log information.

We don't want to separate multiple stores to avoid ordering problems
when the messages need to be merged from the multiple streams on the
receiver side.

I think this is theoretically all possible with the current kmsg,
without breaking anything. The current interfaces would iterate over
the record list and print out the human readable parts and skip the
metadata, instead of just copying a linear byte stream. To tools, it
could look the same as it is currently. It's just that the ring buffer
is not a byte- but a record-buffer.

Advanced tools could get a new interface or switch the old interface
to pipe out the structured data too.

In the systemd journal, we have an ASCII-like stream format that
carries out structured data and is binary data capable.

If we want to think about any next generation logging, I'm convinced,
we need to support records, structured data and binary data; anything
else is unlikely worth to change the current stuff.

Kay
