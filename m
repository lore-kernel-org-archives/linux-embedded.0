From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC][PATCH] KBUS messaging subsystem
Date: Fri, 28 Jan 2011 20:20:42 +0100
Message-ID: <20110128191837.GA6781@merkur.ravnborg.org>
References: <20110128175040.72cf332a@spoon>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110128175040.72cf332a@spoon>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Ibbs <tibs@kynesim.co.uk>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>

[Edited cc: list as my smtp server refused to send the original reply]
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

You will get more feedback on lkml...
Looks like comprehensive descriptions - good!

Took a quick peek at the patch.

- use __u32 (and friends) in exported headers - not uint32_t.
- do not invent our own logging system. Use one of the standard methods.

If you post for review try to divide it up a little.
Maybe kbus.c in one patch, Makefile + Kconfig in last patch.
It is a large file to review already.

	Sam
