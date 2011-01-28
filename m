From: Tony Ibbs <tibs@kynesim.co.uk>
Subject: [RFC][PATCH] KBUS messaging subsystem
Date: Fri, 28 Jan 2011 17:50:40 +0000
Message-ID: <20110128175040.72cf332a@spoon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-embedded <linux-embedded@vger.kernel.org>
Cc: Grant Likely <grant.likely@secretlab.com>, Tibs at home <tibs@tonyibbs.co.uk>, Richard Watts <rrw@kynesim.co.uk>

KBUS is a lightweight Linux-kernel mediated message system,
particularly intended for use in embedded environments.

It is meant to be simple to use and understand. It is particularly
designed to provide predictable message delivery, deterministic
message ordering, and a guaranteed reply for each request.

We have various customers using KBUS in real life, and believe it to
be useful. I had a showcase table for KBUS at the ELCE in Cambridge,
October last year, and there seemed to be interest.

We'd like some advice on how to submit this - I assume that submitting
patches to the Embedded Linux mailing list first would be sensible,
since we believe this to be an area that will find KBUS interesting.

The KBUS project home page is at http://kbus-messaging.org/
The KBUS specification can be found at
http://html.kbus.googlecode.com/hg/docs/html/specification.html

Userland support, plus unit tests for the kernel module, are in the
Google code repositories. There's a GettingStarted page linked from
the KBUS home page.

We've got a working repository with Linux 2.6.37 patched for KBUS,
available via:

  git pull git://github.com/crazyscot/linux-2.6-kbus.git kbus-2.6.37

Our tentative patch is at
http://kbus.googlecode.com/files/0001-KBUS-messaging-subsystem.patch

The diffstat for the patch is:

 Documentation/Kbus.txt     | 1189 ++++++++++
 include/linux/kbus_defns.h |  666 ++++++
 init/Kconfig               |    3 +
 ipc/Kconfig                |   99 +
 ipc/Makefile               |    1 +
 ipc/kbus.c                 | 5120 ++++++++++++++++++++++++++++++++++++++++++++
 ipc/kbus_internal.h        |  773 +++++++
 7 files changed, 7851 insertions(+), 0 deletions(-)

Should I just submit the patch to this list?

Tibs
