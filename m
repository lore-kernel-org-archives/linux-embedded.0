From: Jacob Avraham <jacob@compass-eos.com>
Subject: determine boot device in initrd
Date: Thu, 20 Jan 2011 11:57:59 +0200
Message-ID: <A4B10BB8CE8F86468ABF12A5E4A5CC9920F919A3C4@mail>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hi,

I have a system with several USB disks, each of them is boot-capable.
Each such device has a kernel and initrd in its filesystem.
I want to be able to determine in initrd from which USB device it (and the kernel) were
loaded from, so I can mount the root filesystem from that device.
Is that doable?
I don't want to use a static "root=" entry in grub, since I don't know which sd device it will be.

Thanks,

Jacob Avraham