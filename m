From: Tony Ibbs <tibs@tonyibbs.co.uk>
Subject: [PATCH 0/5] RFC: KBUS messaging subsystem
Date: Sun, 27 Feb 2011 18:11:43 +0000
Message-ID: <cover.1298829754.git.tibs@tonyibbs.co.uk>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-embedded <linux-embedded@vger.kernel.org>
Cc: Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>, Grant Likely <grant.likely@secretlab.ca>

KBUS is a lightweight, Linux kernel mediated, message system,
particularly intended for use in embedded environments.

It is meant to be simple to use and understand. It is designed to
provide predictable message delivery, deterministic message ordering,
and a guaranteed reply for each request.

It is especially aimed at situations where existing solutions,
such as DBUS, cannot be used, typically because of system constraints.

We have various customers using KBUS in real life, and believe it to
be useful. I had a showcase table for KBUS at the ELCE in Cambridge,
October last year, and there seemed to be interest.

I am hoping to get a response from this list before attempting to send
to the kernel list, since I believe this list should contain people
who might be most interested in using it.

The KBUS project home page is at http://kbus-messaging.org/, from
which there are various useful links.

There is a working repository with Linux 2.6.37 patched for KBUS,
available via:

 git pull git://github.com/crazyscot/linux-2.6-kbus.git kbus-2.6.37

This is a resubmission of the original RFC to the Linux-Embedded list,
having:

a) changed to use __u32 instead of uint32_t and
b) changed to use kernel messaging mechanisms (also removing
   some messaging that should not be needed). These in response
   to the suggestion of Sam Ravnborg
c) split into multiple in-line patches, as is normal practice,
   and as requested by Grant Likely

Tibs (5):
  Documentation for KBUS
  External header file for KBUS
  Kconfig files and Makefile for KBUS
  Internal header file for KBUS
  KBUS itself, the main source file

 Documentation/Kbus.txt     | 1222 +++++++++++
 include/linux/kbus_defns.h |  666 ++++++
 init/Kconfig               |    3 +
 ipc/Kconfig                |   99 +
 ipc/Makefile               |    5 +
 ipc/kbus.c                 | 4927 ++++++++++++++++++++++++++++++++++++++++++++
 ipc/kbus_internal.h        |  709 +++++++
 7 files changed, 7631 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/Kbus.txt
 create mode 100644 include/linux/kbus_defns.h
 create mode 100644 ipc/Kconfig
 create mode 100644 ipc/kbus.c
 create mode 100644 ipc/kbus_internal.h
