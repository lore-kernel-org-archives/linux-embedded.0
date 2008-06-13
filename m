From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Fri, 13 Jun 2008 13:05:54 -0700
Message-ID: <4852D322.5060400@am.sony.com>
References: <1522484831@web.de> <8bd0f97a0806121304m7d00fb6dq27fa7aa37cbeb828@mail.gmail.com> <17882748-2E1B-4DB4-82FD-C5D5C4E62CC8@logicaloutcome.ca> <200806131233.50360.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806131233.50360.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Glenn Henshaw <thraxisp@logicaloutcome.ca>, linux-embedded <linux-embedded@vger.kernel.org>

Rob,

This is an excellent and concise description of the open
source perspective on the problem.  I'll add just one note below.

Rob Landley wrote:
> 1) Try to reproduce the bug under a current kernel.  (Set up a _test_ system.)

This sounds easy, but can be quite difficult.

Very often, product developers are several versions behind, with
no easy way to use the current kernel version.  For example, a
common scenario is starting with a kernel that comes with a board
(with source mind you), where the kernel came from the semi-conductor
vendor, who paid a Linux vendor to do a port, and it was
released in a time-frame relative to the Linux vendor's
product schedule.

This is how you end up having people STARTING projects today
using a 2.6.11 kernel.  (I know of many).

The real difficulty, when a developer finds themselves in
this position, is how to forward-port the BSP code necessary to
reproduce the bug in the current kernel.  Often, the code
is not isolated well enough (this is a vendor problem that
really needs attention.  If you have the BSP in patches, it
is usually not too bad to forward port even across several
kernel versions.  But many vendors don't ship stuff this way.)

The fact is, that by a series of small steps and delays by
the linux vendor, chip vendor, board vendor,
and product developer the code is out-of step.

It's easy to say "don't get in this position", but
this even happens when everyone is playing nice and actively
trying to mainline stuff.  BSP support in arch trees often
lag mainline by a version or two.

The number of parties involved here is why, IMHO, it has
taken so long to make improvements in this area.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

