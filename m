From: Andrew Worsley <amworsley@gmail.com>
Subject: usb-skeleton.c - generates warning
Date: Sat, 16 Oct 2010 22:00:35 +1100
Message-ID: <AANLkTimsXLsZ1deY+eJreb3js5d8y3sCEFgDS1q0A2Uc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=gHsgB8FvbiJlYxYtTPl6NFMsop+4A0V8rtulGuwFdZE=;
        b=BQRPkdwCzjhCzAighFygl+bUpXBiKh8pEbafjwMN8elo9mMm3r8etA5kuHDHD6TilS
         dECvGBfZEaBJrlq90i6RUOFWdai4IfFRE0JWy7RXPpZTrUCO6/7rmxWHVN4D8XQ7qsbl
         ed6s/Xf2wvCyjslSCJ6szjbH5fTVDeLDDmZm8=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Sorry if this is the wrong mailing list for this - I am writing a USB
driver  (for an embedded system) modeled on the
drivers/usb/usb-skeleton.c
version 2.6.30 but it gets the following warning.
It looks like it is a generic issue, perhaps the skeleton is not
maintained any more?
 If so is there a reference explain the right way? I couldn't find
anything on google.

Looking at other  drivers it appears this isn't done anymore? If so
perhaps this should be updated?

Suggestions appreciated.

Thanks

Andrew
...
usb 1-5: jtag_release()
usb 1-5: jtag_open()
usb 1-5: jtag_read(file=ded6e3c0, buf=092f8440, count=512,..)
usb 1-5: jtag_flush()
usb 1-5: jtag_release()
usb 1-5: jtag_open()
usb 1-5: jtag_write(file=df0ebe40, buf=093783f0, count=2506,..)
usb 1-5: jtag_flush()
usb 1-5: jtag_release()
------------[ cut here ]------------
WARNING: at /tmp/9789a690-d005-11df-8a73-00241dc62196/voyage-linux-2.6.30/arch/x86/include/asm/dma-mapping.h:294
hcd_buffer_free+0x85/0xb9 [usbcore]()
Hardware name: POULSBO
Modules linked in: ctam_ftdi ipv6 tun e1000e ata_piix usb_storage
ff_memless intel_agp agpgart loop hwmon_vid hostap_pci hostap lib80211
natsemi serio_raw p
cspkr asix pl2303 usbnet ftdi_sio usbserial usbhid i2c_isch hid evdev
ext3 jbd mbcache sd_mod pata_sch ata_generic libata uhci_hcd ehci_hcd
scsi_mod ide_pci
_generic r8169 mii usbcore amd74xx lm90 led_class ide_generic ide_core
[last unloaded: ctam_ftdi]
Pid: 2234, comm: loadFPGA Tainted: G        W  2.6.30.10-robin-z5xx #1
Call Trace:
 [<c0126a04>] ? warn_slowpath_common+0x5e/0x8a
 [<c0126a3a>] ? warn_slowpath_null+0xa/0xc
 [<dff512d1>] ? hcd_buffer_free+0x85/0xb9 [usbcore]
 [<e043b328>] ? jtag_write_bulk_callback+0x55/0x61 [ctam_ftdi]
 [<dff4c1e2>] ? usb_hcd_giveback_urb+0x60/0x8f [usbcore]
 [<dfffde94>] ? ehci_urb_done+0x9d/0xa9 [ehci_hcd]
 [<dffff42d>] ? qh_completions+0x359/0x3e9 [ehci_hcd]
 [<dffff552>] ? ehci_work+0x95/0x782 [ehci_hcd]
 [<e016f5c1>] ? serial_write+0x72/0x7d [usbserial]
 [<c0175aa5>] ? handle_mm_fault+0x293/0x5f4
 [<e00024f9>] ? ehci_irq+0x171/0x1c4 [ehci_hcd]
 [<dff4beca>] ? usb_hcd_irq+0x2f/0x6c [usbcore]
 [<c0156287>] ? handle_IRQ_event+0x4e/0x101
 [<c0157510>] ? handle_fasteoi_irq+0x66/0x97
 [<c0104def>] ? handle_irq+0x17/0x1b
 [<c010485d>] ? do_IRQ+0x38/0x76
 [<c0103569>] ? common_interrupt+0x29/0x30
---[ end trace 7b48bc9372419b94 ]---
usb 1-5: jtag_open()
usb 1-5: jtag_flush()
usb 1-5: jtag_read(file=de7748c0, buf=09a63000, count=512,..)
usb 1-5: jtag_flush()
usb 1-5: jtag_release()
