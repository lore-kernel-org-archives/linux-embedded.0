From: Tim Bird <tim.bird@am.sony.com>
Subject: Project Proposal: add sleeping spinlocks to mainline kernel
Date: Wed, 16 Dec 2009 14:47:44 -0800
Message-ID: <4B296390.3090004@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: CE Linux Developers List <celinux-dev@tree.celinuxforum.org>, linux-embedded <linux-embedded@vger.kernel.org>

Summary: add sleeping spinlocks to the mainline kernel

Proposer: Tim Bird

Description:
One of the last major elements of the RT-preempt patch set that is
still not mainlined is the implementation of the so-called
"sleeping spinlocks".  It would be good to mainline these,
addressing remaining issues to their inclusion in the standard
Linux kernel.

Thomas Gleixner discussed the status of RT-preempt at the
[http://lwn.net/Articles/354690/ realtime preemption mini-summit,
and the [http://lwn.net/Articles/357465/ 2009 kernel summit].

Related work:
* RT-preempt
** http://rt.wiki.kernel.org/index.php/Main_Page

Scope: unknown

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
