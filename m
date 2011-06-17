From: Sam Ravnborg <sam@ravnborg.org>
Subject: debugging multi threaded applicatiosn on arm - status?
Date: Fri, 17 Jun 2011 11:39:27 +0200
Message-ID: <20110617093927.GA28305@merkur.ravnborg.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Is it possible to bebug multi-threaded applications using gdb on ARM these days?

We have had trobules getting this to work - but I do not have the details at hand atm.
I am just curious if this is supposed to work or not.

We have an arm target running: 2.6.32.8 #1 PREEMPT
CPU: ARM926EJ-S rev 5 (v5l) (Atmel AT91SAM9263)

The kernel is only lightly modifed - mostly with a few
propriatary drivers and a few driver hacks (not suitable for mainline).

It is a long story why we use such an old version.

Our applications uses threads and we use glibc 2.10.1 with NPTL enabled.
So far we have survived using the powerfull printf debugging :-)

	Sam
