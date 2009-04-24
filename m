From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Fri, 24 Apr 2009 16:10:13 -0700
Message-ID: <20090424231013.GA18340@cuplxvomd02.corp.sa.net>
References: <20090424003555.GA31173@cuplxvomd02.corp.sa.net> <Pine.LNX.4.44L0.0904241502440.4531-100000@iolanthe.rowland.org> <20090424213238.GA5973@cuplxvomd02.corp.sa.net> <20090424221951.GC18260@shareable.org>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090424221951.GC18260-yetKDKU6eevNLxjTenLetw@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=5261; t=1240614618; x=1241478618;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20Wait=20for=20console=20to=20become=20av
	ailable,=20v3.2
	|Sender:=20;
	bh=H2o92xM4pOr7hlvSzUv3mfc6iiBCW4LEAHzXT0ZZElo=;
	b=NaMm+g79Bk8Ii8+Q/HqQgFcpU1uFxfz/d5RoVPAWNhgVj/VjSVMHIfawZ/
	Qybc1hesondT0KAU+5N3xRCbYTkWolGE6UQH+hBGEslmZb21ju7TDYRW9Zc8
	0YBR8iUPW6;
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

On Fri, Apr 24, 2009 at 11:19:51PM +0100, Jamie Lokier wrote:
> David VomLehn wrote:
> > > This looks like a good plan and not hard to implement.  It even should 
> > > be possible to fit USB disk drives into the scheme.
> > 
> > That would definitely rock. 
> 
> How about this, perhaps in the generic device model:
> 
>   1. Whenever a device's existence is detected by its parent bus,
>      add the device id to a pool of "potential devices worth waiting for".
> 
>   2. Whenever a device is registered, remove that device id from the pool.
> 
>   3. Whenever a device is itself a bus, or has subdevices or
>      attributes to be discovered, it triggers step 1 for all devices
>      found by enumeration (or in the case of USB, whatever you have to
>      wait for).  Then the bus can declare itself initialised.
>  
>   4. The top-level enumeration behaves as though there was a root bus,
>      onto which the real buses like PCI etc. are attached as in step 3.
> 
>   5. Waiting for console / boot device / userspace waiting for other
>      mount points all check this pool for device ids of matching type.
> In this, the pool serves the same role as Alan Stern's global counter,
> the difference being you can wait for particular types of device when
> you need to, and this is more explicit about how a hierarchy is handled.
> 
> Device ids in this pool are simply "category" values for what the
> device is relevant to - and a waitqueue.  If a PCI device is a serial
> port, then goes into category "serial port", because it's relevant if
> serial console is requested on the boot command line.
> 
> When waiting for a newly powered USB bus to settle, you may get
> notification of all devices on it, but you might not know enough about
> each device until the individual drivers start fetching descriptors.
> Then you can either make every device go temporarily into the pool,
> much as if it were a little bus itself, until it has detailed
> information about what type of device it is.  Or you can wait until
> all those devices have fetched descriptors before the USB bus declares
> that its enumeration is complete and removes its own id.

I think this is over-engineered. This focused on boot devices, so you really
don't care about things like buses, and I don't perceive a broader use. What
really matters is particular boot device types, wherever they came from.

I'm just about to send out an RFC patch. It may work, but it sure hasn't been
tested (so we can actually be sure it doesn't work) and it is not integrated
with any bus. Following it will be a patch to handle the specific case of a
console, but even this is not intended for use.

I've been thinking about the issue of handling device classes because, as you
clearly understand, distingishing between them can give you finer granularity
during boot initialization. There are really three possible steps:
1. Discover a device exists.
2. Discover the device type
3. Completion of the probe function for the device.

The existing code is great if the interval between 1 and 2, or 2 and 3, is
nearly zero. In the first case, you do nothing at step 1 and at step 2 you
indicate that a boot device of the given type it found. In the second case,
you indicate that you have found a device of unknown type was found (passing
BOOTDEV_ANY_MASK) at step 1, ignore the information at step 2, and report
completion of the probe for a generic device type at step 3 (again passing
BOOTDEV_ANY_MASK).

There is one additional possibility, that there is a significant amount of time
that passes between steps 1, 2, and 3. The existing interfaces already handle
that, but I'm thinking a clearer interface is in order. The key is that, when
you indicate a possible boot device was found, and when you indicate the
completion of probing, you are actually passing a mask of boot device types.

Say that the device is actually a console, my favorite example. In this case,
you'd pass BOOTDEV_ANY_MASK to bootdev_found at step 1, indicating that you
don't really know the device type. This increments the pending count for all
boot device types. At step 2, you find out you have a console, so you pass
BOOTDEV_ANY_MASK & ~BOOTDEV_CONSOLE_MASK to bootdev_probe_done. This decrements
the pending count for all device types except consoles. Then, at step 3, you
call bootdev_probe_done with BOOTDEV_CONSOLE_MASK. Which decrements the pending
count for console devices and wakes up any waiters.

This is useful functionality only if we have cases where the intervals between
each of the three steps is significant. If so, then my approach is to add a
function:
	void bootdev_type_found(int old_mask, enum bootdev_type type);
which is passed the mask that was passed to bootdev_found and the type the
device is now known to be. Implementation-wise, all it really does, then, is
to call bootdev_probe_done:
	bootdev_probe_done(old_mask & ~(1 << type));
This would be a cleaner interface than calling bootdev_probe_done twice..

The key question is, are there cases where there is enough time between steps
1 and 2, and steps 2 and 3, to add this complexity? If not, let's skip it.

> -- Jamie

David VomLehn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
