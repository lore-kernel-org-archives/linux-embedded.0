From: Tim Bird <tim.bird@am.sony.com>
Subject: CELF Project proposal: UBIFS mount-time speedups
Date: Mon, 14 Dec 2009 17:56:13 -0800
Message-ID: <4B26ECBD.9030005@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: CE Linux Developers List <celinux-dev@tree.celinuxforum.org>, linux-embedded <linux-embedded@vger.kernel.org>

Summary: Improve UBIFS mounting time

Proposer: Tim Bird

Description:
UBIFS is a next-generation flash-based file system for Linux.
It is a read/write file system, which supports compression
and has good performance.  However, it's mount times are not
very good.  This affects overall Linux boot time, for a UBIFS-based
embedded system.

The purpose of this project would be to investigate mount performance
issues, and try to resolve them.  One suggestion is to keep the
bad block table on flash, instead of re-scanning it on every boot.
It is not known if algorithms to do this are covered by existing
flash management patents.

Related work:
* UBIFS
** http://en.wikipedia.org/wiki/UBIFS
** http://lwn.net/Articles/276025/
* UBI2
** see portions of http://www.mjmwired.net/kernel/Documentation/filesystems/ubifs.txt
* Mount times
** http://osl.sed.hu/wiki/ubifs/index.php/Mount_results
** http://elinux.org/images/f/f8/CELFJamboree30-UBIFS_update.pdf

Scope: This project might take about 4 months

Notes:
Toshiba may already be working on this project.

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
