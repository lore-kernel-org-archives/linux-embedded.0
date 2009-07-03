From: Aras Vaichas <arasv@magellan-technology.com>
Subject: need help finding a WiFi + BT SDIO chipset/module for Linux
Date: Fri, 3 Jul 2009 11:23:22 +1000
Message-ID: <ed62800907021823t2518700cv3710d3aa46371369@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

can someone point me in the right direction to choose an OEM WiFI +
Bluetooth chipset/module suitable for an embedded Linux system? I'd
prefer if it was connected via SDIO.

My usual discovery process is to run "make config" -> Device Drivers
->Network Device Support -> Wireless Lan to see which chipsets are
supported. I then do keyword searches on Google to find which modules
contain these chipsets.

Or alternatively, I do a Google search for "wifi bluetooth SDIO
module", try and find which chipset it contains, and then grep the
latest kernel source to see if I get any hints of compatibility.

This is all very hit and miss, as many of the WiFi module
manufacturers provide little to no details about their products ...

Also, some manufacturers state that they are Linux compatible like
this: "Linux (Custom Driver Porting Services Available)" i.e. they
want to sell you the driver for $XYZ ... no thanks.

I know that there are sites which list compatible USB and PCI WiFi
devices, but I've not seen anything that goes down to the OEM module
level. Is there a webpage somewhere of OEM Linux compatible SDIO Wifi
modules?

regards,

Aras Vaichas
