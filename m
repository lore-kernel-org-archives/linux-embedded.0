From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Sun, 26 Apr 2009 10:55:37 -0700
Message-ID: <20090426175537.GB18594@cuplxvomd02.corp.sa.net>
References: <20090424003555.GA31173@cuplxvomd02.corp.sa.net> <Pine.LNX.4.44L0.0904241502440.4531-100000@iolanthe.rowland.org> <20090424213238.GA5973@cuplxvomd02.corp.sa.net> <20090424221951.GC18260@shareable.org> <20090424231013.GA18340@cuplxvomd02.corp.sa.net> <20090425014152.GD23106@shareable.org>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090425014152.GD23106-yetKDKU6eevNLxjTenLetw@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=2697; t=1240768552; x=1241632552;
	c=relaxed/simple; s=sjdkim4002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20Wait=20for=20console=20to=20become=20av
	ailable,=20v3.2
	|Sender:=20;
	bh=Urnc2Z4HYilIQyGpOmv0yYxAzLmZaTHRvSXOWMowJ8M=;
	b=dLMgGqYhZGij+IELRYZ+UOgMoy9WEBljDM5JAkWV94zav6NEacaWJq97IA
	1Up4nB1mKAJfbqD0GrU8bxyC8KafpXnj+CRM2hQzOT/DqUUtcnAto++PfEGj
	5kY9vjtIyN;
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

On Sat, Apr 25, 2009 at 02:41:52AM +0100, Jamie Lokier wrote:
> David VomLehn wrote:
> > I think this is over-engineered. This focused on boot devices, so you really
> > don't care about things like buses, and I don't perceive a broader use. What
> > really matters is particular boot device types, wherever they came from.
> 
> I'm thinking this broader use:
> 
>     - My boot _script_ is waiting for a disk which identifies as
>       UUID=392852908752345749857 to appear before it can mount it on
>       /data.  If there's no such disk, it proceeds without it.  It's a
>       USB disk, behind a USB hub.
> 
>     - My boot script is looking to see if I'm holding down 'z' on the
>       keyboard, to do something different.  But how does it know if
>       there's a USB keyboard plugged in (behind two USB hubs) that
>       hasn't finished being detected?
> 
> It just seemed to fit comfortably into what's being discussed.
> 
> (I do have these a system with these requirements, by the way.  It's
> solved at the moment by waiting 5 seconds after booting, and by using
> an older kernel which doesn't have boot parallelisation yet...)

If the keyboard is being used for the console, this should fix your problem.
If not, I think you can fix it by using a hotplug script.

> Only one problem I see: what happens when there's an attempt to open
> /dev/console before you increment the pending count?  It seems to me
> you have to wait for all buses to have been detected, which is why I
> mentioned buses, as some buses are _themselves_ slow devices to detect.

A valid point. I just sent an updated patch to address this.

> > The key question is, are there cases where there is enough time between steps
> > 1 and 2, and steps 2 and 3, to add this complexity? If not, let's skip it.
> 
> The time between enumerating that a USB device exists and what it's
> class is (could be a console?), and actually initialising the device
> to find out if it's then usable, including loading firmware, can be a
> little while.
> 
> I don't know if the times are long enough to matter.

Me neither, but I went ahead and added bus_bootdev_type_found. It's a trivial
piece of code and will allow this case to be handled cleanly.

> Possibly related to all this: it would be really nice if the ATA
> rather slow probe time didn't have to delay boot scripts until they
> depend on the not-yet-probed disks, as sometimes they might not.

Related to boot time, yes, but it sounds like it's not related to the
boot device issue. By the time you get to boot scripts, you've initialized
all the boot devices you're going to.

> -- Jamie

David VomLehn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
