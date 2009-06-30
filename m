From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: 2.6.27- Sending uevent from a driver
Date: Tue, 30 Jun 2009 10:14:19 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0906301008350.2927-100000@iolanthe.rowland.org>
References: <547eba1b0906300130r6b704e9ft408c63d2c1e6f4a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <547eba1b0906300130r6b704e9ft408c63d2c1e6f4a@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Ng <daniel.ng1234@gmail.com>
Cc: linux-embedded@vger.kernel.org, linux-usb@vger.kernel.org

On Tue, 30 Jun 2009, Daniel Ng wrote:

> Hi,
> 
> I'm trying to send a uevent from my USB Gadget Serial driver using:
> 
> kobject_uevent(&cdev->gadget->dev.kobj, KOBJ_ONLINE);
> 
> However, the uevent gets filtered out with the error message:
> 
> "filter function caused the event to drop!"
> 
> -from kobject_uevent.c line 124
> 
> The filter function used is dev_uevent_filter() from core.c.
> 
> The dev_uevent_filter() filters out the uevent because the following test fails:
> 
> if (ktype == &device_ktype)
> 
> This is because my driver's (struct bus_type *) gadget.dev.bus is NULL.
> 
> So I tried the following in my driver's probe() function:
> 
> the_controller->gadget.dev.bus = &of_platform_bus_type;
> 
> But this results in a crash.
> 
> Here are my questions:
> 
> 1) I am trying to communicate to a Userspace prgoram that the Gadget
> Serial driver has connected to a TTY device, so the Userspace program
> can know when to start I/O with the TTY device.
> To achieve this, I want to send a uevent from for example f_acm.c,
> just after it calls gserial_connect() in acm_set_alt(). I'm hoping
> that I can use libudev (via netlink sockets) to catch this uevent, and
> hence send a notification to a socket that the Userspace program is
> listening on. Does this all look like a sensible thing to do?

Why do you want to use uevents?  How about using a sysfs attribute file 
instead?  It would be a lot easier.

> 2) Is there a 'proper' way to assign the bus type as above? Perhaps I
> need to call some sort of init function instead, so that the crash can
> be avoided.

You can set the bus type to whatever you want, but various buses have
expectations about the structures registered under them.  For example,
anything registered on the platform bus has to be embedded in a struct
platform_device, and anything registered on the PCI bus has to be
embedded in a struct pci_dev.  I don't know what the OF platform bus
expects, but you can probably figure it out.

And instead of setting dev.bus directly, you have to call the 
appropriate registration function.

Alan Stern
