From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC][PATCH] KBUS messaging subsystem
Date: Tue, 1 Feb 2011 20:40:08 -0700
Message-ID: <20110202034008.GC29148@angua.secretlab.ca>
References: <20110128180158.6f670a51@spoon>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110128180158.6f670a51@spoon>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Ibbs <tibs@kynesim.co.uk>
Cc: linux-embedded@vger.kernel.org, tibs@tonyibbs.co.uk, rrw@kynesim.co.uk

On Fri, Jan 28, 2011 at 06:01:58PM +0000, Tony Ibbs wrote:
> We talked briefly at ELCE 2010 in Cambridge, after the "keeping
> kernel maintainers happy" talk, and you offered that I could
> CC you when I got round to submitting our kernel module.

Hi Tony,

Yes, I remember talking to you.  I'll take a look through and see if I
see any glaring problems.  However, my major critique still stands.
There are already a large number of communication channels available
to Linux, with DBUS gatting the most attention at the moment.  What
niche is KBUS filling that DBUS and others misses?  Secondarily, does
KBUS implement a new API instead of extending an existing mechanism to
meet your needs?  I suspect you'll get a lot more traction if KBUS can
make DBUS work better/faster/more efficiently.

> I've just emailed the embedded linux mailing list with an initial
> question about it, and attempted to CC you as
> grant.likely@secretlab.com, which appears to have bounced. I'm
> hoping that I just wrote the address down wrong, and the .ca
> version is correct.

Yes, the correct domain is secretlab.ca

> 
> Apologies for any confusion,
> Tibs
> 
> Begin forwarded message:
> 
> Date: Fri, 28 Jan 2011 17:50:40 +0000
> From: Tony Ibbs <tibs@kynesim.co.uk>
> To: Linux-embedded <linux-embedded@vger.kernel.org>
> Cc: Grant Likely <grant.likely@secretlab.com>, Tibs at home <tibs@tonyibbs.co.uk>, Richard Watts <rrw@kynesim.co.uk>
> Subject: [RFC][PATCH] KBUS messaging subsystem
> 
> 
[...]
> We've got a working repository with Linux 2.6.37 patched for KBUS,
> available via:
> 
>   git pull git://github.com/crazyscot/linux-2.6-kbus.git kbus-2.6.37
> 
> Our tentative patch is at
> http://kbus.googlecode.com/files/0001-KBUS-messaging-subsystem.patch
> 
> The diffstat for the patch is:
> 
>  Documentation/Kbus.txt     | 1189 ++++++++++
>  include/linux/kbus_defns.h |  666 ++++++
>  init/Kconfig               |    3 +
>  ipc/Kconfig                |   99 +
>  ipc/Makefile               |    1 +
>  ipc/kbus.c                 | 5120 ++++++++++++++++++++++++++++++++++++++++++++
>  ipc/kbus_internal.h        |  773 +++++++
>  7 files changed, 7851 insertions(+), 0 deletions(-)
> 
> Should I just submit the patch to this list?

Yes.  If you want review, then posting a URLs doesn't help.  :-)  Send
it as an email so that I can just hit 'reply' and start typing.
Post and then I'll comment.

g.
