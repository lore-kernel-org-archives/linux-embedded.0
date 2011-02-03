From: Tony Ibbs <tibs@kynesim.co.uk>
Subject: Re: [RFC][PATCH] KBUS messaging subsystem
Date: Thu, 3 Feb 2011 17:04:57 +0000
Message-ID: <20110203170457.0a1640cf@spoon>
References: <20110128180158.6f670a51@spoon>
	<20110202034008.GC29148@angua.secretlab.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110202034008.GC29148@angua.secretlab.ca>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-embedded@vger.kernel.org, tibs@tonyibbs.co.uk, rrw@kynesim.co.uk

Apologies again for getting Grant's email address wrong on my initial
email.

On Tue, 1 Feb 2011 20:40:08 -0700
Grant Likely <grant.likely@secretlab.ca> wrote:

> There are already a large number of communication channels available
> to Linux, with DBUS gatting the most attention at the moment.  What
> niche is KBUS filling that DBUS and others misses?  Secondarily, does
> KBUS implement a new API instead of extending an existing mechanism to
> meet your needs?  I suspect you'll get a lot more traction if KBUS can
> make DBUS work better/faster/more efficiently.

Hmm. I'm not sure what make up that large number, but I'll try to
address your specific concerns.

I've got four real reasons for why KBUS and not something else:

1. Simple to use and understand. You should be able to get started
using KBUS without needing to feel you've had to learn anything much.

  1.5 This also means it mustn't try to do too much - it needs
  to aim for the simplest solution that will do.

2. We require deterministic message ordering. All listeners (on the
same bus) to a particular message name must receive those messages
in the same order. And that must be the same as the order they
were sent in.

3. In a request/reply situation, the requester must be guaranteed a
reply, even if the reply is to indicate that the replier has gone away,
and including the case that the replier has crashed.

4. The system has to be written in C, since we can't guarantee the
availability of other language libraries (specifically, we are quite
likely not to have C++ on a board).

I believe DBUS is ruled out because of (1) alone - it is not easy to use
or understand. Someone writing embedded code does not normally want to
invest much time in learning yet another technology, so quick to learn
is very important here. Learning about protocol layers is not
appropriate in this context. My EuroPython talk explained almost the
entirety of KBUS (and all the important bits) with examples, in about
20 minutes.

I don't know if DBUS provides (2) - I've not been able to tell from its
documentation. And I assume it doesn't provide (3).

Also, KBUS is perfectly usable with just the kernel module. DBUS is
quite large, and we don't necessarily have the space to spare for it on
many of our systems.

As a side issue, DBUS also mixes together message and content. KBUS
deliberately does not address the description of message content. We do
not believe there is a one-size-fits-all solution to this, not even for
request/reply used as RPC. Whilst not named in the big 4 above, I
regard this as a serious problem with DBUS for our domain.

Elsewhere, 0mq (zeromq) looks very attractive, not least because it
appears to be very well documented (although I think a lot of that is
fairly recent). I really want to find a project where I need to use it.
However, it is written in C++, so fails (4). Also, I think it is too
complete a solution - it is meant to be a general networking solution,
and I think that makes it wrong for this application - it is over
powerful. Also, I assume it cannot provide (3).

I'm not sure what other mechanisms we should consider. The kernel
itself doesn't provide anything that addresses our problem space,
without a lot of support work.

As to API. The basic API is just the file API (open/read/write/
ioctl/close), and KBUS is perfectly usable at that level.

For those who want to have simpler code, there's a C library to wrap
stuff up neatly, but you don't have to use it. We wanted a set of
useful routines for ourselves, so it happened anyway. It's also a
useful step to (for instance) the Java API, rather than going the
low-level route (obviously not needed when writing the C++ or Python
bindings).

Finally, I have actually submitted a CELF Open Project proposal for
KBUS, and one of the work items is to look at using KBUS as a bottom
end for DBUS.
 
> > Date: Fri, 28 Jan 2011 17:50:40 +0000
> > From: Tony Ibbs <tibs@kynesim.co.uk>
> > To: Linux-embedded <linux-embedded@vger.kernel.org>
[...]
> > Should I just submit the patch to this list?
[...]
> Yes.  If you want review, then posting a URLs doesn't help.  :-)  Send
> it as an email so that I can just hit 'reply' and start typing.
> Post and then I'll comment.

I shall attempt to sort out the issues following on from Sam Ravnborg's
comments, and then submit as several inline patches, then.

Tibs
