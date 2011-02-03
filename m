From: Tony Ibbs <tibs@kynesim.co.uk>
Subject: Re: [RFC][PATCH] KBUS messaging subsystem
Date: Thu, 3 Feb 2011 16:59:28 +0000
Message-ID: <20110203165928.796651d5@spoon>
References: <20110128175040.72cf332a@spoon>
	<20110128191837.GA6781@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110128191837.GA6781@merkur.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>, Richard Watts <rrw@kynesim.co.uk>, Tibs at home <tibs@tibsnjoan.co.uk>

On Fri, 28 Jan 2011 20:20:42 +0100
Sam Ravnborg <sam@ravnborg.org> wrote:

> [Edited cc: list as my smtp server refused to send the original reply]

Apologies - I had copied down Grant Likely's email address wrong at ELCE.

> > Should I just submit the patch to this list?
> 
> You will get more feedback on lkml...

Indeed. I hoped to start small.

> - use __u32 (and friends) in exported headers - not uint32_t.

OK. I'd missed that. Presumably I should also be using u32 and friends
inside the kernel module itself, instead of uint32_t...

> - do not invent our own logging system. Use one of the standard
> methods.

I vaguely remember having a reason for that. Doubtless it was a bad
one. I shall attend to it.

> If you post for review try to divide it up a little.
> Maybe kbus.c in one patch, Makefile + Kconfig in last patch.
> It is a large file to review already.

That's useful guidance. I shall amend the code as suggested above and
resubmit as smaller, inline patches.

Tibs
