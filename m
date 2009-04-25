From: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Sat, 25 Apr 2009 02:41:52 +0100
Message-ID: <20090425014152.GD23106@shareable.org>
References: <20090424003555.GA31173@cuplxvomd02.corp.sa.net> <Pine.LNX.4.44L0.0904241502440.4531-100000@iolanthe.rowland.org> <20090424213238.GA5973@cuplxvomd02.corp.sa.net> <20090424221951.GC18260@shareable.org> <20090424231013.GA18340@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090424231013.GA18340-CFZJ1or75eBPWxJt6d6B6bQa8qPdvLwY@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

David VomLehn wrote:
> I think this is over-engineered. This focused on boot devices, so you really
> don't care about things like buses, and I don't perceive a broader use. What
> really matters is particular boot device types, wherever they came from.

I'm thinking this broader use:

    - My boot _script_ is waiting for a disk which identifies as
      UUID=392852908752345749857 to appear before it can mount it on
      /data.  If there's no such disk, it proceeds without it.  It's a
      USB disk, behind a USB hub.

    - My boot script is looking to see if I'm holding down 'z' on the
      keyboard, to do something different.  But how does it know if
      there's a USB keyboard plugged in (behind two USB hubs) that
      hasn't finished being detected?

It just seemed to fit comfortably into what's being discussed.

(I do have these a system with these requirements, by the way.  It's
solved at the moment by waiting 5 seconds after booting, and by using
an older kernel which doesn't have boot parallelisation yet...)

There was a thread about BTRFS wanting to match up multiple disks
being scranned with volume ids some months ago, which might have
similar requirements, I'm not sure.

> I've been thinking about the issue of handling device classes because, as you
> clearly understand, distingishing between them can give you finer granularity
> during boot initialization. There are really three possible steps:
> 1. Discover a device exists.
> 2. Discover the device type
> 3. Completion of the probe function for the device.

Yes.

> The existing code is great if the interval between 1 and 2, or 2 and 3, is
> nearly zero. In the first case, you do nothing at step 1 and at step 2 you
> indicate that a boot device of the given type it found. In the second case,
> you indicate that you have found a device of unknown type was found (passing
> BOOTDEV_ANY_MASK) at step 1, ignore the information at step 2, and report
> completion of the probe for a generic device type at step 3 (again passing
> BOOTDEV_ANY_MASK).

Yes.

> There is one additional possibility, that there is a significant
> amount of time that passes between steps 1, 2, and 3. The existing
> interfaces already handle that, but I'm thinking a clearer interface
> is in order. The key is that, when you indicate a possible boot
> device was found, and when you indicate the completion of probing,
> you are actually passing a mask of boot device types.

This too, yes.

> Say that the device is actually a console, my favorite example. In
> this case, you'd pass BOOTDEV_ANY_MASK to bootdev_found at step 1,
> indicating that you don't really know the device type. This
> increments the pending count for all boot device types. At step 2,
> you find out you have a console, so you pass BOOTDEV_ANY_MASK &
> ~BOOTDEV_CONSOLE_MASK to bootdev_probe_done. This decrements the
> pending count for all device types except consoles. Then, at step 3,
> you call bootdev_probe_done with BOOTDEV_CONSOLE_MASK. Which
> decrements the pending count for console devices and wakes up any
> waiters.

Only one problem I see: what happens when there's an attempt to open
/dev/console before you increment the pending count?  It seems to me
you have to wait for all buses to have been detected, which is why I
mentioned buses, as some buses are _themselves_ slow devices to detect.

> The key question is, are there cases where there is enough time between steps
> 1 and 2, and steps 2 and 3, to add this complexity? If not, let's skip it.

The time between enumerating that a USB device exists and what it's
class is (could be a console?), and actually initialising the device
to find out if it's then usable, including loading firmware, can be a
little while.

I don't know if the times are long enough to matter.

Possibly related to all this: it would be really nice if the ATA
rather slow probe time didn't have to delay boot scripts until they
depend on the not-yet-probed disks, as sometimes they might not.

-- Jamie
 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
