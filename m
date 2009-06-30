From: Daniel Ng <daniel.ng1234-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: 2.6.27- Sending uevent from a driver
Date: Tue, 30 Jun 2009 18:30:43 +1000
Message-ID: <547eba1b0906300130r6b704e9ft408c63d2c1e6f4a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=TR6eUpym3YHT0l08vkFyS07j8yAIvxAJgSsgPwtnqXc=;
        b=lwyrgJjytgbYXMEzDQiWUfy6IIAgW0UZR1uKZ0SFwGNUsp6iwa0UISBAo8sfD9f+cW
         l68Im7pzLQoxGfRCaQRemwNku4FIWqlze2f6CB012hexf2BMuhPZTc+Np2bJ1S//8VeO
         2Dn1yUUWCeHsgnyLizNkG1AYp2bCDNMUWqZ/E=
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

I'm trying to send a uevent from my USB Gadget Serial driver using:

kobject_uevent(&cdev->gadget->dev.kobj, KOBJ_ONLINE);

However, the uevent gets filtered out with the error message:

"filter function caused the event to drop!"

-from kobject_uevent.c line 124

The filter function used is dev_uevent_filter() from core.c.

The dev_uevent_filter() filters out the uevent because the following test fails:

if (ktype == &device_ktype)

This is because my driver's (struct bus_type *) gadget.dev.bus is NULL.

So I tried the following in my driver's probe() function:

the_controller->gadget.dev.bus = &of_platform_bus_type;

But this results in a crash.

Here are my questions:

1) I am trying to communicate to a Userspace prgoram that the Gadget
Serial driver has connected to a TTY device, so the Userspace program
can know when to start I/O with the TTY device.
To achieve this, I want to send a uevent from for example f_acm.c,
just after it calls gserial_connect() in acm_set_alt(). I'm hoping
that I can use libudev (via netlink sockets) to catch this uevent, and
hence send a notification to a socket that the Userspace program is
listening on. Does this all look like a sensible thing to do?

2) Is there a 'proper' way to assign the bus type as above? Perhaps I
need to call some sort of init function instead, so that the crash can
be avoided.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
