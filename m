From: Brad Arnold <brad@check-it.ca>
Subject: Expose system Serial Number to userspace.
Date: Wed, 29 Aug 2012 09:18:32 -0600
Message-ID: <09ee18b0d2e3d7f34a9e510b3f8d7702@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hi,

I'm working on an embedded board which uses u-boot + linux. At
manufacturing time, the device serial number will be programmed into OTP
memory on NAND (probably from within u-boot). We'd like the linux kernel
to make this serial number available to be read from userspace. Is there
an accepted method to do this sort of thing?

One idea I had was to make the serial number available as a device node
(ie: you can simply read the serial number from "/dev/serialnumber"). Then
there's the question of how the kernel learns the serial in the first
place (a kernel boot command like parameter passed from u-boot?).

Does this sound sane, or is there a better way to do something like this?

Thanks,

Brad
