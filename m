From: Greg KH <greg@kroah.com>
Subject: Re: 2.6.27- Sending uevent from a driver
Date: Tue, 30 Jun 2009 08:41:10 -0700
Message-ID: <20090630154110.GD16038@kroah.com>
References: <547eba1b0906300130r6b704e9ft408c63d2c1e6f4a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <547eba1b0906300130r6b704e9ft408c63d2c1e6f4a@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Ng <daniel.ng1234@gmail.com>
Cc: linux-embedded@vger.kernel.org, linux-usb@vger.kernel.org

On Tue, Jun 30, 2009 at 06:30:43PM +1000, Daniel Ng wrote:
> Hi,
> 
> I'm trying to send a uevent from my USB Gadget Serial driver using:
> 
> kobject_uevent(&cdev->gadget->dev.kobj, KOBJ_ONLINE);

Is your device one of the ones that "ONLINE" messages are expected to
emit?  If not, it's not going to matter much, right?  :)

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

Shouldn't the userspace just be monitoring the tty line settings (like
CTS) to know when to start sending data?  I wouldn't recommend adding a
new interface to a very old, and standardized, interface.

> 2) Is there a 'proper' way to assign the bus type as above? Perhaps I
> need to call some sort of init function instead, so that the crash can
> be avoided.

There is a way, but assigning it directly like you did above, is not the
correct one.

thanks,

greg k-h
