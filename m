From: Brad Arnold <brad@check-it.ca>
Subject: RE: Expose system Serial Number to userspace.
Date: Wed, 29 Aug 2012 10:53:23 -0600
Message-ID: <c01a38e85047d286d68599d3472fbcbd@mail.gmail.com>
References: <09ee18b0d2e3d7f34a9e510b3f8d7702@mail.gmail.com> <alpine.LFD.2.02.1208291143101.1784@xanadu.home>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.02.1208291143101.1784@xanadu.home>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nico@fluxnic.net>
Cc: linux-embedded@vger.kernel.org

That's perfect, thanks!

Brad

-----Original Message-----
From: Nicolas Pitre [mailto:nico@fluxnic.net]
Sent: August-29-12 9:51 AM
To: Brad Arnold
Cc: linux-embedded@vger.kernel.org
Subject: Re: Expose system Serial Number to userspace.

On Wed, 29 Aug 2012, Brad Arnold wrote:

> Hi,
>
> I'm working on an embedded board which uses u-boot + linux. At
> manufacturing time, the device serial number will be programmed into
> OTP memory on NAND (probably from within u-boot). We'd like the linux
> kernel to make this serial number available to be read from userspace.
> Is there an accepted method to do this sort of thing?

A serial number field is available from /proc/cpuinfo already.  you just
have to initialize it through the system_serial_high and system_serial_low
global variables.


Nicolas
