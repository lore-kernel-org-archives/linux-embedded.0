From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: is it worth separating initrd from initramfs support?
Date: Mon, 4 Aug 2008 14:53:26 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0808041449420.9561@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>


  not sure if i asked this here once upon a time but, in the current
kernel, you get to select support for *both* initrd and initramfs with
a single selection (CONFIG_BLK_DEV_INITRD).

  however, folks who have been around a while generally associate the
feature INITRD with, well, an initrd image, while initramfs is
something a bit newer.

  in the context of embedded linux, is there any value in separating
these features and letting one select them individually?  isn't it
reasonable to think that one might need initramfs support but have
absolutely no use for "initrd" support?  or is that not worth worrying
about?

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
