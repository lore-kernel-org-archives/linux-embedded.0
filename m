From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: selecting initramfs support without initrd?
Date: Tue, 24 Jun 2008 18:11:01 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0806241805390.5000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org


  i'm not sure if this is the proper forum for this, but while
perusing the early boot code, i noticed that selecting the config
variable BLK_DEV_INITRD gives you support for both initramfs, and an
initrd image.

  however, with embedded systems, isn't it more common to use
initramfs and not need initrd at all (depending on the functionality
of the bootloader)?  and if that's true, might there not be some
benefit in splitting those two features (initramfs versus initrd) so
you could select initramfs all by itself, and not compile in any
initrd support whatsoever?

  based on a quick inspection of the source under init/, it would seem
that you could whack out sizable chunks of code if you had no need for
initrd, but i could be wrong.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
