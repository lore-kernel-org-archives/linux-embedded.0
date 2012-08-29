From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Expose system Serial Number to userspace.
Date: Wed, 29 Aug 2012 11:50:43 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1208291143101.1784@xanadu.home>
References: <09ee18b0d2e3d7f34a9e510b3f8d7702@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <09ee18b0d2e3d7f34a9e510b3f8d7702@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Brad Arnold <brad@check-it.ca>
Cc: linux-embedded@vger.kernel.org

On Wed, 29 Aug 2012, Brad Arnold wrote:

> Hi,
> 
> I'm working on an embedded board which uses u-boot + linux. At
> manufacturing time, the device serial number will be programmed into OTP
> memory on NAND (probably from within u-boot). We'd like the linux kernel
> to make this serial number available to be read from userspace. Is there
> an accepted method to do this sort of thing?

A serial number field is available from /proc/cpuinfo already.  you just 
have to initialize it through the system_serial_high and 
system_serial_low global variables.


Nicolas
