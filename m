From: Brad Arnold <brad@check-it.ca>
Subject: Re: Expose system Serial Number to userspace.
Date: Wed, 29 Aug 2012 14:47:02 -0600
Message-ID: <CADoavCcgYy_PrGkiO3rGZNvg6C1uKFQtqHffR=BviPKiWjdgvQ@mail.gmail.com>
References: <09ee18b0d2e3d7f34a9e510b3f8d7702@mail.gmail.com>
	<alpine.LFD.2.02.1208291143101.1784@xanadu.home>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.02.1208291143101.1784@xanadu.home>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nico@fluxnic.net>
Cc: linux-embedded@vger.kernel.org

On Wed, Aug 29, 2012 at 9:50 AM, Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Wed, 29 Aug 2012, Brad Arnold wrote:
>
> > Hi,
> >
> > I'm working on an embedded board which uses u-boot + linux. At
> > manufacturing time, the device serial number will be programmed into OTP
> > memory on NAND (probably from within u-boot). We'd like the linux kernel
> > to make this serial number available to be read from userspace. Is there
> > an accepted method to do this sort of thing?
>
> A serial number field is available from /proc/cpuinfo already.  you just
> have to initialize it through the system_serial_high and
> system_serial_low global variables.
>
>
> Nicolas

Actually, I guess even better than initializing through the two
variables is to pass the serial directly from u-boot using the tag.

Brad
