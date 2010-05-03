From: Paul Smith <paul@mad-scientist.net>
Subject: Re: Can I manage/modify console baud rates from userspace?
Date: Mon, 3 May 2010 13:28:27 -0400
Message-ID: <1272907707.31303.23.camel@psmith-ubeta.netezza.com>
References: <1272758524.27961.1114.camel@homebase>
	 <4BDD4CC7.3050507@gmail.com> <1272816895.27961.1131.camel@homebase>
	 <20100502202534.GA29535@merkur.ravnborg.org>
Reply-To: paul@mad-scientist.net
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20100502202534.GA29535@merkur.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-embedded@vger.kernel.org

On Sun, 2010-05-02 at 22:25 +0200, Sam Ravnborg wrote:
> I would suggest asking Alan Cox - he if anyone would know.
> I lost the original mail and context above is missing some details.
> Anyway added to this mail.

Thanks Sam.  Alan, hope you don't mind a direct email.  I'll cut down
the original request to just (I hope) the important details.

I have an environment in which a number of (Intel-based) blades in one
or more blade chassis boot from a host using PXE to download a Linux
kernel (2.6.31-based ATM) and a ramdisk root partition.  These blades
provide access to the console via serial-over-LAN, where the chassis
provides a special vlan connection to the blades' ttyS1 port.  You can
then connect to the chassis management module via SSH, and from there
connect to the console of any of the blades.

We require this capability in our deployed systems, not just during
development, so I need to make sure this is working at all times and
that it's easy to configure and maintain in the field.

Today, all the blades we ship use a maximum baud rate of 19200 so in my
PXE config, I have "console=ttyS1,19200" added to the kernel boot line.
Works great.

The vendor is providing a newer version of these blades and the current
version is end-of-lifed.  The new blades are drop-in replaceable,
individually, with the current blades, which is nice.  Unfortunately
these new blades do not support any overlapping baud rate with the old
blades, so there's no single value I can provide in the PXE
configuration on my host that will work with all blades in a
heterogeneous blade deployment.


So I'm stuck here and don't have a good idea how to move forward.  I
tried using setserial to modify the baud rate (it supports a parameter
baud_base which didn't seem like it would do what I wanted--and it
didn't) but no joy.

Trying to customize the PXE config would be virtually impossible: we'd
have to map all the MAC addresses and figure out which ones were for
newer blades, and maintain that mapping as blades were swapped in and
out and even moved between chassis or between slots in the same chassis.
A nightmare!

Is there some other way to modify the baud rate of the console device
from userspace once I figure out the right one?  It would definitely be
less than ideal since we'd lose all the boot output, except what we can
get from dmesg _if_ the system boots, but it would be something.

Any other thoughts or ideas?


Thanks for reading!
