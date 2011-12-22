From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: RFC: android logger feedback request
Date: Thu, 22 Dec 2011 04:44:08 +0100
Message-ID: <CAPXgP13eh9ibYBq4vFo21TrQiu5gvaZtOX4J3AscPHZix6BVSg@mail.gmail.com>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de>
 <4EF27B85.9080801@am.sony.com> <20111222005114.GA22541@suse.de>
 <4EF288B4.1070601@am.sony.com> <20111222014718.GA13085@suse.de> <4EF29217.7040408@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrfy.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=PDqJiJpM0cuj9Sd1VjmcnXuT8a0dMS89A70QgYvyVVM=;
        b=AUJiNMeMbxw6dkGWsZ5LaoaWI8U/AxTxgJDyvmnoPXWgCn51deCmFyB7QhYGU5i1Ax
         SiCl62JQ1S9EmveP1mZM6RBdqtJnqVEyHnsjMmpqJSAk8qJcMY0N7RXW7v3bTAwyL606
         BIMl2TD1iBtx220KI1+ahmIOgTCbt4D1wAKbw=
In-Reply-To: <4EF29217.7040408@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Greg KH <gregkh@suse.de>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Brian Swetland <swetland@google.com>, Lennart Poettering <lennart@poettering.net>

On Thu, Dec 22, 2011 at 03:12, Tim Bird <tim.bird@am.sony.com> wrote:
> On 12/21/2011 05:47 PM, Greg KH wrote:

>> Again, please see what we are already doing in the kernel and usersp=
ace,
>> I think a lot of the above is already implemented.
>
> I don't know what systemd has got going on in user-space. =C2=A0I'm l=
ooking
> at a very recent kernel, and I see no support for multiple log channe=
ls,
> or an optimized open/write path.

> How does current systemd prevent user-space messages from crowding
> out kernel messages? =C2=A0(or vice-versa).

It intentionally doesn't. Splitting messages in separate stores is not
what we want in the general use case.

Syslog has the 'facility' for that, and it works just good enough. We
think that filtering in the receiver is more flexible and useful, than
to have multiple stores of pretty much the same type.

If you have multiple stores, you always have to fight the ordering
problem, and that really creates problems sometimes.

We are very convinced, that there should be a single entry only for
logging, and not multiple, and the filtering should happen on the
receiver side.

> Since you've been doing
> a lot of work on logging, do you have any existing metrics for loggin=
g
> overhead via the kernel log buffer?

Which overhead? I don't really think that is too interesting. Writing
to a device node or socket and copy it to the kernel's ring buffer,
not sure if it has an interesting potential of being optimized, if you
don't use fancy consoles and such.

We have no numbers, but until I see numbers of a real world problem, I
would expect there is no actual problem.

>> Which brings me back to my original question, what does this code do=
,
>> that is not already present in the kernel, and why is a totally new
>> interface being proposed for it?
>
> At the least, it supports multiple log channels. =C2=A0Quite frankly =
my mind
> has been blown a bit by the suggestion to overload the kernel log buf=
fer
> with user-space messages. =C2=A0I would never have gone that route. B=
ut I'll have
> to find out more about this systemd thing to answer your question.

It's just fine. And honestly, for early boot and debugging
interleaving is exactly what you want, because userspace is triggering
the actions in the kernel, and you want to see that in the same
channel.

Also you can use netconsole and all the weird stuff people support for
the kernel and get the messages from early boot userspace including
intramfs there.

> Secondly, this is not a particularly new or radical interface. It is =
new
> to legacy Linux, but it's been in the Android Linux kernel for some y=
ears
> now, and it has worked well.

Sure, it's understandable, it sounds like something that made sense
when it was invented, and which probably still make a lot of sense for
Android today. But I don't think it should be discussed as a general
purpose Linux use case, or something that replaces kmsg. It does not
look like too interesting for general needs today outside of Android.

We probably just want the simple stuff we have today, or something
that really solves the structured logging problem in a proper way.
Something slightly better, with almost the same model and limitations,
than what we have already, is probably not that important enough to
make changes.

Thanks,
Kay
