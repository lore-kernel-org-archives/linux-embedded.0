From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Embedded Linux power management
Date: Fri, 30 May 2008 15:05:01 -0700
Message-ID: <48407A0D.3050802@am.sony.com>
References: <483B5F0D.9060302@cs.drexel.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <483B5F0D.9060302@cs.drexel.edu>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: J Sevy <jsevy@cs.drexel.edu>
Cc: linux-embedded@vger.kernel.org

J Sevy wrote:
> Hi,
> kind of a general question for the list concerning the current "state of 
> the art" in power management for handheld embedded Linux devices. In 
> particular:
> - What are the standards in common use for power management on 
> handhelds? APM, ACPI, or something else?
> - Is there a general consensus on the "best" approach for power management?
> - Is Dynamic Power Management (i.e., "speed-stepping") widely used?
> Thanks for any input.

In general, PM on handhelds is heavily dependent on chip features.
Many SOCs used in these devices have elaborate clock hardware,
allowing you to adjust the voltage and frequency of various parts
of the chip (or chipsets) dynamically.

For some good overviews of different PM features relevant to embedded,
you may want to look at the following papers:

Every Microamp is Sacred - A Dynamic Voltage and Current Control
Interface for the Linux Kernel - Liam Girdwood
http://www.celinux.org/elc08_presentations/regulator-api-celf.pdf

Power Management Quality of Service and How You Could Use it in
Your Embedded Application - Mark Gross
http://www.celinux.org/elc08_presentations/elc2008_pm_qos_slides.pdf

Building Blocks for Embedded Power Management - Kevin Hilman
http://www.celinux.org/elc08_presentations/PM_Building_Blocks1.pdf

Linux Suspend-to-Disk Objectives for Consumer Electronic Devices -
Vitaly Wool
http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2007Presentations?action=AttachFile&do=view&target=std.pdf

Linux Clock Management Framework - Siarhei Yermalayeu
http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2007Presentations?action=AttachFile&do=view&target=ELC_2007_Linux_clock_fmw.pdf


These links should probably be added to the Power Management
page on the elinux wiki (http://elinux.org/Power_Management),
which at the moment is fairly light on content.
  -- Tim


=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

