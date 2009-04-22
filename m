From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Wed, 22 Apr 2009 13:54:27 -0700
Message-ID: <20090422205427.GA28435@cuplxvomd02.corp.sa.net>
References: <20090421230849.GA29555@cuplxvomd02.corp.sa.net> <Pine.LNX.4.44L0.0904221111320.3405-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.0904221111320.3405-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=3844; t=1240433683; x=1241297683;
	c=relaxed/simple; s=sjdkim6002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20Wait=20for=20console=20to=20become=20av
	ailable,=20v3.2
	|Sender:=20;
	bh=pm6+n7M7jr+lCQGCEongrdcP1ieum6LfQTN2Cf36FyY=;
	b=LPT3/izChdie7NdTvP/fgm41EP5t41SkV9CifGzskhnjRVWHv9XgWSPCme
	ZHeMjBM7CmAfBEr+liXdtTXITzUK0bySqteXW/4tcZQ6iIEnJKnPISM+EFkZ
	byxpIMFYXU;
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

On Wed, Apr 22, 2009 at 11:40:09AM -0400, Alan Stern wrote:
> On Tue, 21 Apr 2009, David VomLehn wrote:
...
> > There is one other possible gotcha to this approach. The code as I wrote it is
> > bus-agnostic, i.e. it has no idea where the console is located. As far as
> > I know, the long time to probe possible console devices only arises with
> > USB. If this is not tree, we need to handle any other cases that can arise.
> 
> That is a very good objection.  For this sort of approach to work,
> ultimately it would have to be implemented for every hotpluggable bus
> of interest.

Alright, I know you (Alan (Stern)) know about USB. I think someone else
mentioned Firewire. What other hotpluggable buses do we need to worry about
and how can we get them interested?

> The console delay routine will then wait until the USB serial device is
> discovered and registered, at which point its job is done.  It won't
> continue to wait until all the USB devices present at boot time have
> been probed, since there's no reason to wait after the first console
> device is discovered.

For each boot device, we need to determine whether a) we for some subset
instance of a device class, or b) until all possible instances of a device
class have been probed. In case a, we exit the wait if either:
1.	A suitable device has been registered, i.e. any console, a specific
	network device, etc., or
2.	All devices have been probed
If we exit for reason 2, it means that no such device is present,
and we go on to the do the appropriate thing for that device class.

In case b, we exit the wait only when all devices have been probed. Then
we either have a device of that class or not, and we do the appropriate thing.

There is a special case for USB consoles, which might apply to other buses
and classes of devices, as well: if USB_CONSOLE is not configured, you don't
need to wait for notification from USB. This helps guide the design of the
required infrastructure.

> So not only would you not need to tune two different delay times, you 
> wouldn't even need to tune one!  You wouldn't need to specify any delay 
> times at all.

This would make me and, clearly, a lot of other people happy, as well.

> Which essentially means waiting until _all_ the devices present at boot 
> time (both USB and non-USB) have been probed.  Right?  And it 
> explicitly means ruling out waiting for new devices which the user 
> might plug in after the system has booted, since a new console device 
> could be plugged in at any time.

Yes, I think we absolutely exclude devices plugged in after boot. I think such
usage, if it needs to be supported, can be handled with hot plugging. I'm a
little squishy on whether we might to be able to hot plug USB consoles as I
have a request to support this, but I think it's a separate issue from
supporting hot pluggable boot devices and I'm not worrying about it now.

> > If there is a way to guarantee that we are done with the probing, I'm
> > all for using that. Will waiting for the USB hub driver to be idle do this?
> 
> I'm pretty sure something like it can be made to work, subject to the 
> delays caused by bad devices.

There will always be bad devices, but let's see if we can support the good
devices, first. If the bad devices will make a commitment to rehabilitate
themselves, perhaps we can consider their needs later.

I'm going to see if I can come up with some sort of concrete proposal for
waiting for hotpluggable boot devices. I'd appreciate it if you could think
about how to implement the USB-specific part of this. Once we have something
that makes sense, and works, we can go back and pick up the details for
the console, IP autoconfig, and anything else that someone might need done.

> Alan Stern

David VomLehn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
