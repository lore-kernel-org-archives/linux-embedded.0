From: Brad Arnold <brad@check-it.ca>
Subject: RE: Expose system Serial Number to userspace.
Date: Wed, 29 Aug 2012 10:57:25 -0600
Message-ID: <75d49b059819c35d03995bd86e72d6fb@mail.gmail.com>
References: <09ee18b0d2e3d7f34a9e510b3f8d7702@mail.gmail.com> <503E3DDB.8050708@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <503E3DDB.8050708@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: linux-embedded@vger.kernel.org

That'll help me move along. I'm currently storing the mac and serial in
the u-boot environment, but I was thinking I might want to move those two
to the OTP. But at least having some level of write protection in u-boot
is nice. I wasn't aware that this existed, because it's disabled by
default in the config for Marvell boards.

I'll have to look at that example program futher...

Brad


-----Original Message-----
From: Marco Stornelli [mailto:marco.stornelli@gmail.com]
Sent: August-29-12 10:06 AM
To: Brad Arnold
Cc: linux-embedded@vger.kernel.org
Subject: Re: Expose system Serial Number to userspace.

Il 29/08/2012 17:18, Brad Arnold ha scritto:
> Hi,
>
> I'm working on an embedded board which uses u-boot + linux. At
> manufacturing time, the device serial number will be programmed into
> OTP memory on NAND (probably from within u-boot). We'd like the linux
> kernel to make this serial number available to be read from userspace.
> Is there an accepted method to do this sort of thing?
>
> One idea I had was to make the serial number available as a device
> node
> (ie: you can simply read the serial number from "/dev/serialnumber").
> Then there's the question of how the kernel learns the serial in the
> first place (a kernel boot command like parameter passed from u-boot?).
>
> Does this sound sane, or is there a better way to do something like
this?
>
> Thanks,
>
> Brad

U-Boot manage a serial number via env variable "serial#". It provides
several tools. You'll find under tools/env applications to read/write env
variable of uboot, so reading from Linux is very simple. You should use a
dedicated little space of flash to store the env variables.

Regards,

Marco
