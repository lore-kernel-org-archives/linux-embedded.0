From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: can initrd and initramfs be made independent?
Date: Wed, 3 Jun 2009 13:10:45 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.0906031307580.7946@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>


  as it stands, when configuring the kernel, you can't select
initramfs capability without also selecting initrd.  but isn't it
feasible that you might want initramfs and have no need for initrd?
if you make those selections independent, the help info suggests you
can save 15Kb by not having RAM disk (initrd) support.

  or is there an interdependence here that's not so obvious?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Linked In:                             http://www.linkedin.com/in/rpjday
Twitter:                                       http://twitter.com/rpjday
========================================================================
