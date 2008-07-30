From: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Subject: AT91 kernel programming documentation ?
Date: Wed, 30 Jul 2008 15:53:19 +0200
Message-ID: <4890724F.2020505@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

I'm looking for some good documentation concerning AT91 Linux kernel development.
Currently I have a Olimex AT91SAM9260 development board which is supported by
the at91 patch set.
Now I would like to add different hardware to the board and write some kernel
code for it.
Unfortunately, there doesn't seem to be a lot of documentation.
At the moment I'm reading mach-at91 related source code and trying to find out
how things work.

Specificly, I would like to know how the different SoC devices can be accessed
and used, how I can do port multiplexing, how I can tell the kernel which
hardware is attached to where and so on.

Can you guys suggest any documentation ?
