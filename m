From: Daniel Ng <daniel.ng1234@gmail.com>
Subject: usb gadget serial changes since 2.6.14
Date: Wed, 17 Jun 2009 12:36:21 +0000 (UTC)
Message-ID: <loom.20090617T121932-512@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

I'm having trouble porting our in-house UDC driver to 2.6.27. It originally 
worked on 2.6.14 as an CDC-ACM driver.

I notice a lot of changes since 2.6.14. For starters, instead of the single 
serial.c file, there is now f_serial.c, u_serial.c and f_acm.c.

Currently, the UDC driver in 2.6.27 seems to work if I simply plug the USB 
cable in between our gadget serial Linux device and a Windows PC. However, if 
I unplug, then replug the cable, the 'Out' Endpoint seems fine, but the 'In' 
Endpoint doesn't seem to come up properly. 

In other words, data only seems to be getting through in the direction from 
the PC to the gadget serial Linux device, but not vice versa.

Is there some sort of architecture document to show how the f_serial.c, 
u_serial.c and f_acm.c files all fit together? I've searched in the 
Documentation directory and I've read the usb-gadget-serial docbook document 
but it doesn't really tell me this.

Also, it seems that for some reason composite.c is being compiled and used, 
but my CDC-ACM gadget serial driver is *not* a composite driver. Is it 
possible to prevent linking with this composite driver?

Cheers,
Daniel


