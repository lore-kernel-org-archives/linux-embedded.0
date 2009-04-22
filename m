From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 22:35:18 -0700
Message-ID: <20090422053518.GA11055@cuplxvomd02.corp.sa.net>
References: <20090421165214.GB8251@cuplxvomd02.corp.sa.net> <Pine.LNX.4.44L0.0904211457150.3986-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.0904211457150.3986-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1358; t=1240378533; x=1241242533;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20Wait=20for=20console=20to=20become=20av
	ailable,=20v3.2
	|Sender:=20;
	bh=u/WyTcZQ68+HLrKWMfXx2amT3AbxI2gw2P8eojucY7k=;
	b=OqGHK7WdkTCE6oFcFs13L0kplgPHdEcvHv90I7RKKyh2YoeaE6KPhcSw7J
	cjJT05UP/dQm9ku+AM6old/9gYqosIFA52dcy/w3RrL8fBQyG07s5JTaePvb
	m+2LB+uTAZ;
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

By now, pretty much everone is probably up to speed on what the USB folks are
telling us:

	There is no way to avoid using some sort of timeout to decide
	whether the console is ever going to appear.

So:
1.	We want the minimum timeout possible so that headless systems will
	not be delayed any more than is necessary to detect that no console
	is available.
2.	As I understand it, USB devices don't generally come with any
	guarantee what the maximum time to initialize will be.

Therefore, as far as I can see, this means that we can't empirically
determine an appropriate timeout until we know what USB devices are
connected to a particular system. This, in turn, means that any default
timeout we might choose will have to have a command line parameter to
override it.

Naturally, we want to help a user determine as easily as possible just how
long it took to detect whatever serial device they may want to use so that
they can set the timeout so the system will boot as quickly as possible when
being used in a headless mode. This probably means picking a stable point
from which to start measuring the timeout, as well as printing how long it
took to detect the console, if there was one.

An open question is whether we want to wait for all possible consoles or
whether we can proceed with as few as one.

David VomLehn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
