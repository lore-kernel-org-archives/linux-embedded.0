From: Vishal Nandanwar <operational.people@gmail.com>
Subject: Need help regarding the USB mass storage driver
Date: Wed, 20 Jun 2012 15:09:20 +0530
Message-ID: <CAKB833nfHQwdHzCFV6ELrk1-XZT-SN8WxMs=kzO=C8+6foTrDQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=krNQe7pyS5WF2nCkDPdYZ1xoXNFCxJodcYx0R5nbPIA=;
        b=qcjSPeQvKvbK1Q8uc18W4qG2C8EqSe9Rcz6/oQQWOSTBYYww3b65cHqtHLa45zDB0s
         x8C3UY5VVzduseOqYWNz281tS9wZI7m1IBjfP1wQh3BJAJI4Wl67nfwxnnurZrQVwRso
         I69LC0A7UdiO5kOx/MGwcYwf0us2ipbOjeTYWkORDQncdVIsH4TnGpwFlukgXRWegSq1
         2yf9HN//dXSLUpVgjX0PBvSpl/0EDNxYbI+5PlzvTkPSkTl3PYy/6hV12wSjGUdbCJ4S
         ujDeKfkn2bJ8eP21IrkZUKnDT3MQ21lC5DZyRXefI7S2q/D4SuwBFXwpTSJthQwEsGAZ
         P02w==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Docs <linux-doc@vger.kernel.org>, Linux Embedded Group <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux USB <linux-usb@vger.kernel.org>, Platform driver x86 <platform-driver-x86@vger.kernel.org>

Hi,

I am working on a USB mass storage driver for a pen drive. I have done
coding as per the USB_skeleton.c file provided in Linux 3.2 source
code. I could assign the driver to pen drive when pen driver is
inserted in USB connector.

I am stuck in data transfer,  could not do the data transfer. During
enumeration interface sub class is 06 i.e. SCSI transparent command
set. Please find my questions below.

1. Where are these SCSI transparent command set documented?
2. Is there any sample code(apart from Linux source) which describes
the SCSI transparent command set and mass storage driver?
3. When I connect the pen drive and associate my driver, pop up
doesn't appear on the screen for this device. but when default
driver(usb_storage) is used this pop up does appear. What I need to do
here?

Any thing other I need to take care here?

Vishal N
