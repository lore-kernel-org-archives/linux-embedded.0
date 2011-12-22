From: Brian Swetland <swetland@google.com>
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 20:22:49 -0800
Message-ID: <CANqkERCcciVxybh=66K5xxzzGmgw=fg0vwmcitWZ1y=DTxxtOA@mail.gmail.com>
References: <4EF264C3.6000104@am.sony.com>
	<20111221231956.GB23859@suse.de>
	<4EF27B85.9080801@am.sony.com>
	<20111222005114.GA22541@suse.de>
	<4EF288B4.1070601@am.sony.com>
	<20111222014718.GA13085@suse.de>
	<4EF29217.7040408@am.sony.com>
	<20111222034717.GB14174@suse.de>
	<CAPXgP10ikqHFn41wc1HPsKHyaC7fe1WGC2eHqs-hdRaZ7XCTLw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:x-system-of-record:content-type;
        bh=7yhg6+MVkMvxP/m49N8o7T+VbKfTPQS+qXiy2EvIx20=;
        b=rmjs3GvLY5qMqX0yVwWqQOcrDfZH+j2/nXBwWwGl4rAswcssJP4pYME/IV5u9ePwYt
         S/vIBG1gmtqitlEBd48A==
In-Reply-To: <CAPXgP10ikqHFn41wc1HPsKHyaC7fe1WGC2eHqs-hdRaZ7XCTLw@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kay Sievers <kay.sievers@vrfy.org>
Cc: Greg KH <gregkh@suse.de>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Lennart Poettering <lennart@poettering.net>

On Wed, Dec 21, 2011 at 8:12 PM, Kay Sievers <kay.sievers@vrfy.org> wrote:
>
> We would like to have for the general Linux use case is a kmsg, that
> supports structured data, but looks the same as it looks today to
> current and legacy tools.
>
> We would like to have every printk that does not start with a
> KERN_CONT to create a record in the kmsg buffer. This record would
> carry directly a timestamp, the log facility and the log level and a
> reference to the usual human readable string.
>
> The current kmsg prefixing of the timestamp would be a runtime switch,
> and just added when the records are traversed, instead of the current
> buffer printing.
>
> In addition to this common data, every record can carry a
> 'dictionary', which basically looks like a process environment, means
> KEY=value pairs. The additional data can carry all the stuff that is
> needed for structured logging and provides the base for machine
> readable log information.
>
> We don't want to separate multiple stores to avoid ordering problems
> when the messages need to be merged from the multiple streams on the
> receiver side.
>
> I think this is theoretically all possible with the current kmsg,
> without breaking anything. The current interfaces would iterate over
> the record list and print out the human readable parts and skip the
> metadata, instead of just copying a linear byte stream. To tools, it
> could look the same as it is currently. It's just that the ring buffer
> is not a byte- but a record-buffer.
>
> Advanced tools could get a new interface or switch the old interface
> to pipe out the structured data too.
>
> In the systemd journal, we have an ASCII-like stream format that
> carries out structured data and is binary data capable.
>
> If we want to think about any next generation logging, I'm convinced,
> we need to support records, structured data and binary data; anything
> else is unlikely worth to change the current stuff.

Any thoughts as to how one could allow N userspace agents to log to a
single shared buffer without one agent, if buggy or malicious,
spamming out all the other contents of the log?  This is one of the
main reasons we maintain separate logs in Android today, and are
likely to continue doing so until we figure out how resolve the issue.

Having everything in one unified log definitely has benefits (it
certainly makes keeping everything ordered and reading everything back
simpler), however we can't control third party applications (by
design), so systems that require apps to "just don't do that" are not
really solving that problem for us.

Also, as I mentioned earlier, from a security standpoint it is highly
desirable to be able to restrict which records certain readers can
read.  Convincing third party app developers to not log sensitive or
PII data remains a challenge -- providing the ability for filtered
read access allows some mitigation (app can retrieve it's own logs for
a bug report but can't sift through all logs looking for interesting
tidbits).

Brian
