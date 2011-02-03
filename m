From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC][PATCH] KBUS messaging subsystem
Date: Thu, 3 Feb 2011 10:32:45 -0700
Message-ID: <AANLkTin+uw=y8kver3M-9OFOS-z=RvSHvFf_EBVOB71u@mail.gmail.com>
References: <20110128180158.6f670a51@spoon> <20110202034008.GC29148@angua.secretlab.ca>
 <20110203170457.0a1640cf@spoon>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110203170457.0a1640cf@spoon>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tony Ibbs <tibs@kynesim.co.uk>
Cc: linux-embedded@vger.kernel.org, tibs@tonyibbs.co.uk, rrw@kynesim.co.uk

On Thu, Feb 3, 2011 at 10:04 AM, Tony Ibbs <tibs@kynesim.co.uk> wrote:
> Apologies again for getting Grant's email address wrong on my initial
> email.
>
> On Tue, 1 Feb 2011 20:40:08 -0700
> Grant Likely <grant.likely@secretlab.ca> wrote:
>
>> There are already a large number of communication channels available
>> to Linux, with DBUS gatting the most attention at the moment. =A0Wha=
t
>> niche is KBUS filling that DBUS and others misses? =A0Secondarily, d=
oes
>> KBUS implement a new API instead of extending an existing mechanism =
to
>> meet your needs? =A0I suspect you'll get a lot more traction if KBUS=
 can
>> make DBUS work better/faster/more efficiently.
>
> Hmm. I'm not sure what make up that large number, but I'll try to
> address your specific concerns.
>
> I've got four real reasons for why KBUS and not something else:
>
> 1. Simple to use and understand. You should be able to get started
> using KBUS without needing to feel you've had to learn anything much.

It can be argued that this is an interface issue; but that's a
tangential point to my main point below....

[...]
> As a side issue, DBUS also mixes together message and content. KBUS
> deliberately does not address the description of message content. We =
do
> not believe there is a one-size-fits-all solution to this, not even f=
or
> request/reply used as RPC. Whilst not named in the big 4 above, I
> regard this as a serious problem with DBUS for our domain.
>
> Elsewhere, 0mq (zeromq) looks very attractive, not least because it
> appears to be very well documented (although I think a lot of that is
> fairly recent). I really want to find a project where I need to use i=
t.
> However, it is written in C++, so fails (4). Also, I think it is too
> complete a solution - it is meant to be a general networking solution=
,
> and I think that makes it wrong for this application - it is over
> powerful. Also, I assume it cannot provide (3).
>
> I'm not sure what other mechanisms we should consider. The kernel
> itself doesn't provide anything that addresses our problem space,
> without a lot of support work.
>
> As to API. The basic API is just the file API (open/read/write/
> ioctl/close), and KBUS is perfectly usable at that level.

The big issue that comes into play when implementing a new protocol in
Linux is that once it is implemented, we need to support it until the
end of time.  That means it needs to be well thought out and there is
a lot of resistance to implementing something new without first seeing
that it is a measurable benefit that is worth supporting to the end of
time.  In your case, you'll need to show (or attract) a wider range of
users who can say, "yes, this is better than the alternatives".  I
suggest looking at working with dbus for that exact reason.  If dbus
can be made faster/better/more reliable by using a kbus backend, then
you've got a big userbase saying that it is a valuable addition.  It
also gives you a broad use-case that will stretch your assumptions and
improve the implementation before it gets set in stone when merged.

If kbus turns out to only be applicable to your corner of the universe
then it becomes a lot harder to justify it as a generic Linux
communication implementation.

g.
