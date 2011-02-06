From: Tony Ibbs <tibs@tonyibbs.co.uk>
Subject: Re: [RFC][PATCH] KBUS messaging subsystem
Date: Sun, 6 Feb 2011 21:07:38 +0000
Message-ID: <02F6EA37-B85C-48EE-8444-F5FD9B9E2A31@tonyibbs.co.uk>
References: <20110128180158.6f670a51@spoon> <20110202034008.GC29148@angua.secretlab.ca> <20110203170457.0a1640cf@spoon> <AANLkTin+uw=y8kver3M-9OFOS-z=RvSHvFf_EBVOB71u@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTin+uw=y8kver3M-9OFOS-z=RvSHvFf_EBVOB71u@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Tony Ibbs <tibs@kynesim.co.uk>, linux-embedded@vger.kernel.org, rrw@kynesim.co.uk


On 3 Feb 2011, at 17:32, Grant Likely wrote:

> The big issue that comes into play when implementing a new protocol in
> Linux is that once it is implemented, we need to support it until the
> end of time.

Indeed.

> That means it needs to be well thought out and there is
> a lot of resistance to implementing something new without first seeing
> that it is a measurable benefit that is worth supporting to the end of
> time.

And I believe this is a good thing. If KBUS doesn't get in, hopefully it
will be because it has been demonstrated why it should not.

> In your case, you'll need to show (or attract) a wider range of
> users who can say, "yes, this is better than the alternatives".

This is one of the reasons I wanted to start by talking to the embedded
linux mailing list, where we can get the attention of people working
with small systems.

> I suggest looking at working with dbus for that exact reason.  If dbus
> can be made faster/better/more reliable by using a kbus backend, then
> you've got a big userbase saying that it is a valuable addition.

Well, that's presumably true, but does DBUS *need* to be those
things (i.e., is it doing well enough already), and is that enough
reason to put something into the kernel (previous attempts, e.g.,
http://alban.apinc.org/blog/2010/09/15/d-bus-in-the-kernel-faster,
seem to have foundered).

> It also gives you a broad use-case that will stretch your assumptions

That *is* a good motivation, and is one of the reasons for the CELF
proposals. But I don't think it is sufficient to be KBUS's reason for
existence.

> and improve the implementation before it gets set in stone when
> merged.

and I'm not so convinced on this one, since it seems to present a bit of
a chiken-and-egg problem. We believe KBUS is ready for merging because
we've been using it to good effect. If we don't try to merge it, then we
won't find out if we're right (!). If it should be in the kernel, then
it's better to get it there sooner, so that it can be moulded/grown
in-tree.

> If kbus turns out to only be applicable to your corner of the universe
> then it becomes a lot harder to justify it as a generic Linux
> communication implementation.

On the other hand, that depends on how big the corner is. We've seen
many projects trying to hand construct new socket based systems for lack
of a KBUS, and these generally reinvent the same problems each time. The
idea of KBUS is to get away from that.

If you're working on a large-ish system, needing to interact with the
many high-level components that already interact using DBUS, then
clearly you should be using DBUS for that purpose.

However, if you're building a system from scratch, if you have Linux,
busybox, and a set of programs that need to communicate with each other,
and limited resources, then DBUS is not going to be chosen. But those
systems still need a reliable, already written messaging mechanism,
rather than another ad-hoc approach.

Personally, I don't see KBUS competing with DBUS. DBUS already has its
place, and I assume it is good at what it does. KBUS wants to come in
at a lower level, and satisfy different customers.

Tibs
