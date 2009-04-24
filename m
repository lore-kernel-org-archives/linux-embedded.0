From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Fri, 24 Apr 2009 14:32:38 -0700
Message-ID: <20090424213238.GA5973@cuplxvomd02.corp.sa.net>
References: <20090424003555.GA31173@cuplxvomd02.corp.sa.net> <Pine.LNX.4.44L0.0904241502440.4531-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.0904241502440.4531-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=3471; t=1240608764; x=1241472764;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20Wait=20for=20console=20to=20become=20av
	ailable,=20v3.2
	|Sender:=20;
	bh=NMFVvKlMtVxPDo0C7wFgYTG5C78EyJX0+SBmjuWDLUc=;
	b=abkk3NPHHYQRyc5eefpEwSJ6NA9Ud64YxR+qD+/Av7S+ynxJzKKbCho/01
	cpwS5gj/nhsTj6pS4Q2hpYkWPq08L+dctBKQsgYklCyI10UzLq10a39fMZZQ
	vE0AGnA9AU;
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

On Fri, Apr 24, 2009 at 03:20:42PM -0400, Alan Stern wrote:
> On Thu, 23 Apr 2009, David VomLehn wrote:
> 
> > I'm still scratching my head, trying to figure out where I can tap into the
> > 'USB notion of "all devices that were present at boot time have been probed"'
> > that Alan mentions above, so I don't have a specific implementation yet. I'm
> > open to any tips in this area.
> 
> This is a general notion; it applies to all subsystems that do
> asynchronous device discovery or registration.  The idea is simple
> enough: Keep a count of all devices which are known or suspected to be
> present, and decrement the count each time one of them is registered or
> determined not to exist.  When the count first reaches 0, all devices
> that were present (or reachable) at boot time will have been
> registered.
> 
> Isn't this basically what you had in mind?  If you're concerned about 
> the USB implementation, don't be -- I can write it quite easily.

I will absolutely take you up on your offer to lash this into USB. I'm still
fine-tuning a few details but will send out a patch soon, probably today. It's
a bit hard to test it and I'm sure it will need revision, but it will help a
whole bunch to have a USB implementation to play with.

> It's not just hot-pluggable devices.  These ideas are appropriate 
> whenever detection or registration is asynchronous.

This is very true, and I should modify the nomenclature to reflect this.

> > There currently two types supported:
> > -	consoles
> > -	network devices
> 
> You might as well add block devices too.

Yes, we should. My guess is block devices that hang off of buses besides USB
would be able to use this.

> > bus_bootdev_initialized(int bootdev_mask)
> > 	This function must be called by the bus support code after it calls the
> > 	initialiation function for a boot device. Every call to
> > 	bus_bootdev_found must be matched by a call to
> > 	bus_bootdev_initialized with the same bootdev_mask.
> 
> Even if the device can't be initialized for some reason, or if it turns
> out not the be the sort of boot device originally thought, this
> function still has to be called.  That should be made extremely clear.

True, and I was hoping that was clear enough, but I'll go back and emphasize
this more.

> > 	Device initialization functions must have called the appropriate
> > 	registration function for that device before bus_bootdev_initialized
> > 	is called. So, for console devices, register_console must be called
> > 	before bus_bootdev_initialized, and for network devices,
> > 	register_netdevice must be called first.
> 
> It's not clear how either of these two functions is bus-specific.

They aren't, not directly.  I *think* there isn't a problem here, but it
is certainly possible that the driver wouldn't register the device until some
time after its probe function is called. If that's the case, we would still
have a race condition when we went to use the device, which would defeat the
whole purpose of this change. Determining whether actually have a problem
here is probably too difficult to do beforehand; if an issue exists will find
it during use. Not the ideal approach, but this is engineering and not math.

> This looks like a good plan and not hard to implement.  It even should 
> be possible to fit USB disk drives into the scheme.

That would definitely rock. 

> Alan Stern

David VomLehn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
